package com.kindergarten.bean;

public class Monitor {
    private int monitorId;
    private String monitorImgUrl;
    private String monitorMvUrl;
    private int kid;
    private String monitorName;

    public Monitor() {
    }


    public Monitor(int monitorId, String monitorImgUrl, String monitorMvUrl, int kid, String monitorName) {
        this.monitorId = monitorId;
        this.monitorImgUrl = monitorImgUrl;
        this.monitorMvUrl = monitorMvUrl;
        this.kid = kid;
        this.monitorName = monitorName;
    }

    public int getMonitorId() {
        return monitorId;
    }

    public void setMonitorId(int monitorId) {
        this.monitorId = monitorId;
    }

    public String getMonitorImgUrl() {
        return monitorImgUrl;
    }

    public void setMonitorImgUrl(String monitorImgUrl) {
        this.monitorImgUrl = monitorImgUrl;
    }

    public String getMonitorMvUrl() {
        return monitorMvUrl;
    }

    public void setMonitorMvUrl(String monitorMvUrl) {
        this.monitorMvUrl = monitorMvUrl;
    }

    public int getKid() {
        return kid;
    }

    public void setKid(int kid) {
        this.kid = kid;
    }

    public String getMonitorName() {
        return monitorName;
    }

    public void setMonitorName(String monitorName) {
        this.monitorName = monitorName;
    }
}
