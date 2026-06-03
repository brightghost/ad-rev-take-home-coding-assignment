package com.swlkr.adrevdemo.demo.conversion;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

public class ConversionDetailDTO {
    private String id;
    private Timestamp conversionDate;
    private String type;
    private List<TouchpointDTO> touchpoints;
    private Integer touchpointCount;
    private Long timeToConvertDays;
    private BigDecimal revenue;

    public ConversionDetailDTO(String id, Timestamp conversionDate, String type, 
                              List<TouchpointDTO> touchpoints, Integer touchpointCount,
                              Long timeToConvertDays, BigDecimal revenue) {
        this.id = id;
        this.conversionDate = conversionDate;
        this.type = type;
        this.touchpoints = touchpoints;
        this.touchpointCount = touchpointCount;
        this.timeToConvertDays = timeToConvertDays;
        this.revenue = revenue;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Timestamp getConversionDate() {
        return conversionDate;
    }

    public void setConversionDate(Timestamp conversionDate) {
        this.conversionDate = conversionDate;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public List<TouchpointDTO> getTouchpoints() {
        return touchpoints;
    }

    public void setTouchpoints(List<TouchpointDTO> touchpoints) {
        this.touchpoints = touchpoints;
    }

    public Integer getTouchpointCount() {
        return touchpointCount;
    }

    public void setTouchpointCount(Integer touchpointCount) {
        this.touchpointCount = touchpointCount;
    }

    public Long getTimeToConvertDays() {
        return timeToConvertDays;
    }

    public void setTimeToConvertDays(Long timeToConvertDays) {
        this.timeToConvertDays = timeToConvertDays;
    }

    public BigDecimal getRevenue() {
        return revenue;
    }

    public void setRevenue(BigDecimal revenue) {
        this.revenue = revenue;
    }
}
