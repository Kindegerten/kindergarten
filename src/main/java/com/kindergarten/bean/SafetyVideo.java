package com.kindergarten.bean;

public class SafetyVideo
{

    private int safetyVideoId;
    private String safetyVideoName;

    public SafetyVideo(){}

    public SafetyVideo(int safetyVideoId, String safetyVideoName) {
        this.safetyVideoId = safetyVideoId;
        this.safetyVideoName = safetyVideoName;
    }

    public int getSafetyVideoId() {
        return safetyVideoId;
    }

    public void setSafetyVideoId(int safetyVideoId) {
        this.safetyVideoId = safetyVideoId;
    }

    public String getSafetyVideoName() {
        return safetyVideoName;
    }

    public void setSafetyVideoName(String safetyVideoName) {
        this.safetyVideoName = safetyVideoName;
    }

    @Override
    public String toString() {
        return "SafetyVideo{" +
                "safetyVideoId=" + safetyVideoId +
                ", safetyVideoName='" + safetyVideoName + '\'' +
                '}';
    }
}
