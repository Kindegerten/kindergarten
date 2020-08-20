package com.kindergarten.bean;

public class MonitorVideo {

    private int videoId;
    private String videoName,monitorLocation;
    private String videoDate;
    private String videoUrl;
    private String start,end;

    public MonitorVideo() {
    }

    public MonitorVideo(int videoId, String videoName, String monitorLocation, String videoDate, String videoUrl, String start, String end) {
        this.videoId = videoId;
        this.videoName = videoName;
        this.monitorLocation = monitorLocation;
        this.videoDate = videoDate;
        this.videoUrl = videoUrl;
        this.start = start;
        this.end = end;
    }

    @Override
    public String toString() {
        return "MonitorVideo{" +
                "videoId=" + videoId +
                ", videoName='" + videoName + '\'' +
                ", monitorLocation='" + monitorLocation + '\'' +
                ", videoDate='" + videoDate + '\'' +
                ", videoUrl='" + videoUrl + '\'' +
                ", start='" + start + '\'' +
                ", end='" + end + '\'' +
                '}';
    }

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public String getVideoName() {
        return videoName;
    }

    public void setVideoName(String videoName) {
        this.videoName = videoName;
    }

    public String getMonitorLocation() {
        return monitorLocation;
    }

    public void setMonitorLocation(String monitorLocation) {
        this.monitorLocation = monitorLocation;
    }

    public String getVideoDate() {
        return videoDate;
    }

    public void setVideoDate(String videoDate) {
        this.videoDate = videoDate;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }
}
