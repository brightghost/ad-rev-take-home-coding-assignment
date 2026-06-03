package com.swlkr.adrevdemo.demo.conversion;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ConversionRepository extends JpaRepository<Conversion, String> {
    Page<Conversion> findByAdvertiserId(String advertiserId, Pageable pageable);
    
    Page<Conversion> findByAdvertiserIdAndType(String advertiserId, Conversion.ConversionType type, Pageable pageable);
}
