package com.swlkr.adrevdemo.demo.conversion;
import java.math.BigDecimal;
import java.sql.Timestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "conversions")
public class Conversion {
    @Id
    private String id;
    private String advertiser_id;
    private Timestamp conversion_date;
    
    @Enumerated(EnumType.STRING)
    @Column(name = "type")
    private ConversionType type;
    private String subcategory;
    private BigDecimal revenue; //only for CHECKOUT type

    public enum ConversionType {
        CHECKOUT,
        LEAD,
        PAGE_VISIT
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAdvertiserId() {
        return advertiser_id;
    }

    public void setAdvertiserId(String advertiser_id) {
        this.advertiser_id = advertiser_id;
    }

    public Timestamp getConversion_date() {
        return conversion_date;
    }

    public void setConversion_date(Timestamp conversion_date) {
        this.conversion_date = conversion_date;
    }

    public ConversionType getType() {
        return type;
    }

    public void setType(ConversionType type) {
        this.type = type;
    }

    public String getSubcategory() {
        return subcategory;
    }

    public void setSubcategory(String subcategory) {
        this.subcategory = subcategory;
    }

    public BigDecimal getRevenue() {
        return revenue;
    }

    public void setRevenue(BigDecimal revenue) {
        this.revenue = revenue;
    }
}
