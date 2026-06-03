package com.swlkr.adrevdemo.demo.conversion;

import java.util.List;

public class TopPathResponse {
    private int rank;
    private List<String> path;
    private int conversions;
    private double percentage;

    public TopPathResponse(int rank, List<String> path, int conversions, double percentage) {
        this.rank = rank;
        this.path = path;
        this.conversions = conversions;
        this.percentage = percentage;
    }

    public int getRank() {
        return rank;
    }

    public void setRank(int rank) {
        this.rank = rank;
    }

    public List<String> getPath() {
        return path;
    }

    public void setPath(List<String> path) {
        this.path = path;
    }

    public int getConversions() {
        return conversions;
    }

    public void setConversions(int conversions) {
        this.conversions = conversions;
    }

    public double getPercentage() {
        return percentage;
    }

    public void setPercentage(double percentage) {
        this.percentage = percentage;
    }
}
