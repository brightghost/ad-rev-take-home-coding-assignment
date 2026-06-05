package com.swlkr.adrevdemo.demo.touchpoint;
import java.sql.Timestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.Table;


@Entity
@Table(name = "touchpoints")
public class Touchpoint {
    @Id
    private String id;
    private String conversion_id; //foreign key to Conversion

    @Enumerated(EnumType.STRING)   
    @Column(name = "channel")
    private TouchPointChannel channel;
    private String channel_detail; // e.g. "Google Search", "Meta Retarget", etc.
    private Timestamp impression_date;
    private Integer sequence_index; //e.g., 1 for first touch, 2 for second touch, etc.

    public enum TouchPointChannel {
        GOOGLE,
        META,
        PROGRAMMATIC,
        DIRECT
    }

    // Getters and setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getConversion_id() {
        return conversion_id;
    }

    public void setConversion_id(String conversion_id) {
        this.conversion_id = conversion_id;
    }

    public TouchPointChannel getChannel() {
        return channel;
    }

    public void setChannel(TouchPointChannel channel) {
        this.channel = channel;
    }

    public String getChannel_detail() {
        return channel_detail;
    }

    public void setChannel_detail(String channel_detail) {
        this.channel_detail = channel_detail;
    }

    public Timestamp getImpression_date() {
        return impression_date;
    }

    public void setImpression_date(Timestamp impression_date) {
        this.impression_date = impression_date;
    }

    public Integer getSequence_index() {
        return sequence_index;
    }

    public void setSequence_index(Integer sequence_index) {
        this.sequence_index = sequence_index;
    }
}

