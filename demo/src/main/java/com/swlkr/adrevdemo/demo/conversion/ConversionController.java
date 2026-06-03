package com.swlkr.adrevdemo.demo.conversion;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import com.swlkr.adrevdemo.demo.exception.ResourceNotFoundException;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.swlkr.adrevdemo.demo.touchpoint.Touchpoint;
import com.swlkr.adrevdemo.demo.touchpoint.TouchpointRepository;

@RestController
@RequestMapping("/conversions")
public class ConversionController {
    
    private final ConversionRepository conversionRepository;
    private final TouchpointRepository touchpointRepository;
    
    public ConversionController(ConversionRepository conversionRepository, TouchpointRepository touchpointRepository) {
        this.conversionRepository = conversionRepository;
        this.touchpointRepository = touchpointRepository;
    }

    @GetMapping(value = "/summary")
    public Map<String, Object> getConversionSummary(@RequestParam("advertiserId") String advertiserId) {
        List<Conversion> conversions = conversionRepository.findAll().stream()
                .filter(c -> advertiserId.equals(c.getAdvertiserId()))
                .collect(Collectors.toList());

        int totalConversions = conversions.size();
        if (totalConversions == 0) {
            return Map.of(
                    "totalConversions", 0,
                    "avgTouchpoints", 0.0,
                    "avgTimeToConvertDays", 0.0,
                    "multiTouchRate", 0.0);
        }

        List<Touchpoint> touchpoints = touchpointRepository.findAll();
        Map<String, List<Touchpoint>> touchpointsByConversion = touchpoints.stream()
                .collect(Collectors.groupingBy(Touchpoint::getConversion_id));

        double avgTouchpoints = conversions.stream()
                .mapToInt(c -> touchpointsByConversion.getOrDefault(c.getId(), List.of()).size())
                .average()
                .orElse(0.0);

        List<Double> conversionDurations = conversions.stream()
                .map(c -> {
                    List<Touchpoint> touches = touchpointsByConversion.getOrDefault(c.getId(), List.of());
                    return touches.stream()
                            .map(Touchpoint::getImpression_date)
                            .min(java.util.Comparator.naturalOrder())
                            .map(firstTouch -> (c.getConversion_date().getTime() - firstTouch.getTime()) / 86_400_000.0);
                })
                .flatMap(java.util.Optional::stream)
                .toList();

        double avgTimeToConvertDays = conversionDurations.stream()
                .mapToDouble(Double::doubleValue)
                .average()
                .orElse(0.0);

        double multiTouchRate = conversions.stream()
                .filter(c -> touchpointsByConversion.getOrDefault(c.getId(), List.of()).size() > 1)
                .count() * 100.0 / totalConversions;

        return Map.of(
                "totalConversions", totalConversions,
                "avgTouchpoints", Math.round(avgTouchpoints * 10) / 10.0,
                "avgTimeToConvertDays", Math.round(avgTimeToConvertDays * 10) / 10.0,
                "multiTouchRate", Math.round(multiTouchRate * 10) / 10.0);
    }

    @GetMapping(value = "/top-paths")
    public List<TopPathResponse> getTopConversionPaths(@RequestParam("advertiserId") String advertiserId, @RequestParam(value = "limit", defaultValue = "5") int limit) {
        List<Conversion> conversions = conversionRepository.findAll().stream()
                .filter(c -> advertiserId.equals(c.getAdvertiserId()))
                .collect(Collectors.toList());

        if (conversions.isEmpty()) {
            return List.of();
        }

        List<Touchpoint> allTouchpoints = touchpointRepository.findAll();
        Map<String, List<Touchpoint>> touchpointsByConversion = allTouchpoints.stream()
                .collect(Collectors.groupingBy(Touchpoint::getConversion_id));

        // Build paths: for each conversion, get ordered touchpoint channels
        Map<List<String>, Integer> pathCounts = new java.util.LinkedHashMap<>();
        for (Conversion conversion : conversions) {
            List<Touchpoint> touches = touchpointsByConversion.getOrDefault(conversion.getId(), List.of());
            if (!touches.isEmpty()) {
                List<String> path = touches.stream()
                        .sorted(Comparator.comparingInt(Touchpoint::getSequence_index))
                        .map(t -> t.getChannel().name())
                        .collect(Collectors.toList());
                pathCounts.put(path, pathCounts.getOrDefault(path, 0) + 1);
            }
        }

        // Sort by count descending and take top limit
        int maxCount = pathCounts.values().stream()
                .max(Integer::compareTo)
                .orElse(1);

        List<TopPathResponse> result = new ArrayList<>();
        int rank = 1;
        for (Map.Entry<List<String>, Integer> entry : pathCounts.entrySet().stream()
                .sorted((a, b) -> b.getValue().compareTo(a.getValue()))
                .limit(limit)
                .collect(Collectors.toList())) {
            double percentage = (entry.getValue() * 100.0) / maxCount;
            result.add(new TopPathResponse(rank++, entry.getKey(), entry.getValue(), Math.round(percentage * 10) / 10.0));
        }

        return result;
    }

    @GetMapping
    public Page<ConversionDetailDTO> getConversions(
            @RequestParam("advertiserId") String advertiserId,
            @RequestParam(value = "type", required = false) String type,
            @RequestParam(value = "page", defaultValue = "0") int page,
            @RequestParam(value = "size", defaultValue = "6") int size) {
        
        Pageable pageable = PageRequest.of(page, size, Sort.by("conversion_date").descending());
        Page<Conversion> conversionsPage;
        
        if (type != null && !type.isEmpty()) {
            try {
                Conversion.ConversionType conversionType = Conversion.ConversionType.valueOf(type.toUpperCase());
                conversionsPage = conversionRepository.findByAdvertiserIdAndType(advertiserId, conversionType, pageable);
            } catch (IllegalArgumentException e) {
                return Page.empty(pageable);
            }
        } else {
            conversionsPage = conversionRepository.findByAdvertiserId(advertiserId, pageable);
        }
        
        List<Touchpoint> allTouchpoints = touchpointRepository.findAll();
        Map<String, List<Touchpoint>> touchpointsByConversion = allTouchpoints.stream()
                .collect(Collectors.groupingBy(Touchpoint::getConversion_id));
        
        List<ConversionDetailDTO> content = conversionsPage.getContent().stream()
                .map(conversion -> {
                    List<Touchpoint> touches = touchpointsByConversion.getOrDefault(conversion.getId(), List.of());
                    
                    List<TouchpointDTO> touchpointDTOs = touches.stream()
                            .sorted(Comparator.comparingInt(Touchpoint::getSequence_index))
                            .map(t -> new TouchpointDTO(
                                    t.getChannel().name(),
                                    t.getChannel_detail(),
                                    t.getSequence_index()))
                            .collect(Collectors.toList());
                    
                    long timeToConvertDays = 0;
                    if (!touches.isEmpty()) {
                        long firstTouchTime = touches.stream()
                                .map(Touchpoint::getImpression_date)
                                .min(Comparator.naturalOrder())
                                .map(java.sql.Timestamp::getTime)
                                .orElse(conversion.getConversion_date().getTime());
                        timeToConvertDays = (conversion.getConversion_date().getTime() - firstTouchTime) / 86_400_000;
                    }
                    
                    return new ConversionDetailDTO(
                            conversion.getId(),
                            conversion.getConversion_date(),
                            conversion.getType().name(),
                            touchpointDTOs,
                            touches.size(),
                            timeToConvertDays,
                            conversion.getRevenue());
                })
                .collect(Collectors.toList());
        
        return new PageImpl<>(content, pageable, conversionsPage.getTotalElements());
    }

    @GetMapping(value = "/{id}")
    public Conversion getConversionById(@PathVariable String id) {
        return conversionRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Conversion not found with id " + id));
    }

    @PostMapping
    public ResponseEntity<Conversion> createConversion(@RequestBody Conversion conversion) throws URISyntaxException {
        Conversion savedConversion = conversionRepository.save(conversion);
        return ResponseEntity.created(new URI("/api/v1/conversions/" + savedConversion.getId())).body(savedConversion);
    }

    @PutMapping(value = "/{id}")
    public ResponseEntity<Conversion> updateConversion(@PathVariable String id, @RequestBody Conversion conversion) {
        Conversion currentConversion = conversionRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Conversion not found with id " + id));
        currentConversion.setAdvertiserId(conversion.getAdvertiserId());
        currentConversion.setConversion_date(conversion.getConversion_date());
        currentConversion.setType(conversion.getType());
        currentConversion.setSubcategory(conversion.getSubcategory());
        currentConversion.setRevenue(conversion.getRevenue());
        currentConversion = conversionRepository.save(currentConversion);
        
        return ResponseEntity.ok(currentConversion);
    }

    @DeleteMapping(value = "/{id}")
    public ResponseEntity<Void> deleteConversion(@PathVariable String id) {
        conversionRepository.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
