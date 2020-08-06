package com.kindergarten.bean;

public class PlatformInfo {
    private int platformInfoId;
    private String platformInfoName;
    private String platformInfoTime;
    private String platformInfoDetail;
    private int platformInfoStatus;
    private String imageUrl;


    public PlatformInfo() {
    }

    public PlatformInfo(int platformInfoId, String platformInfoName, String platformInfoTime, String platformInfoDetail) {
        this.platformInfoId = platformInfoId;
        this.platformInfoName = platformInfoName;
        this.platformInfoTime = platformInfoTime;
        this.platformInfoDetail = platformInfoDetail;
    }

    public int getPlatformInfoStatus() {
        return platformInfoStatus;
    }

    public void setPlatformInfoStatus(int platformInfoStatus) {
        this.platformInfoStatus = platformInfoStatus;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getPlatformInfoId() {
        return platformInfoId;
    }

    public void setPlatformInfoId(int platformInfoId) {
        this.platformInfoId = platformInfoId;
    }

    public String getPlatformInfoName() {
        return platformInfoName;
    }

    public void setPlatformInfoName(String platformInfoName) {
        this.platformInfoName = platformInfoName;
    }

    public String getPlatformInfoTime() {
        return platformInfoTime;
    }

    public void setPlatformInfoTime(String platformInfoTime) {
        this.platformInfoTime = platformInfoTime;
    }

    public String getPlatformInfoDetail() {
        return platformInfoDetail;
    }

    public void setPlatformInfoDetail(String platformInfoDetail) {
        this.platformInfoDetail = platformInfoDetail;
    }
}
