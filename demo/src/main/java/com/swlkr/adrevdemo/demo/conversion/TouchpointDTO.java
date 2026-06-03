package com.swlkr.adrevdemo.demo.conversion;

public class TouchpointDTO {
    private String channel;
    private String channelDetail;
    private Integer sequenceIndex;

    public TouchpointDTO(String channel, String channelDetail, Integer sequenceIndex) {
        this.channel = channel;
        this.channelDetail = channelDetail;
        this.sequenceIndex = sequenceIndex;
    }

    public String getChannel() {
        return channel;
    }

    public void setChannel(String channel) {
        this.channel = channel;
    }

    public String getChannelDetail() {
        return channelDetail;
    }

    public void setChannelDetail(String channelDetail) {
        this.channelDetail = channelDetail;
    }

    public Integer getSequenceIndex() {
        return sequenceIndex;
    }

    public void setSequenceIndex(Integer sequenceIndex) {
        this.sequenceIndex = sequenceIndex;
    }
}
