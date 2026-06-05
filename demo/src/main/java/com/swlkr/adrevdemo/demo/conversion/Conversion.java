package com.swlkr.adrevdemo.demo.conversion;
import java.math.BigDecimal;
import java.sql.Timestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "conversions")
public class Conversion {
    @Id
    private String id;
    @Column(name = "advertiser_id")
    private String advertiserId;
    private Timestamp conversion_date;
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
        return advertiserId;
    }

    public void setAdvertiserId(String advertiserId) {
        this.advertiserId = advertiserId;
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
