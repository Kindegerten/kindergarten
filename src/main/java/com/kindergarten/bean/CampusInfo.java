package com.kindergarten.bean;

public class CampusInfo {
    private int campusInfoId;
    private String campusInfoName;
    private String campusInfoDetail;
    private int kid;
    private String campusInfoTime;


    public CampusInfo(int campusInfoId, String campusInfoName, String campusInfoDetail, int kid, String campusInfoTime) {
        this.campusInfoId = campusInfoId;
        this.campusInfoName = campusInfoName;
        this.campusInfoDetail = campusInfoDetail;
        this.kid = kid;
        this.campusInfoTime = campusInfoTime;
    }

    public int getCampusInfoId() {
        return campusInfoId;
    }

    public void setCampusInfoId(int campusInfoId) {
        this.campusInfoId = campusInfoId;
    }

    public String getCampusInfoName() {
        return campusInfoName;
    }

    public void setCampusInfoName(String campusInfoName) {
        this.campusInfoName = campusInfoName;
    }

    public String getCampusInfoDetail() {
        return campusInfoDetail;
    }

    public void setCampusInfoDetail(String campusInfoDetail) {
        this.campusInfoDetail = campusInfoDetail;
    }

    public int getKid() {
        return kid;
    }

    public void setKid(int kid) {
        this.kid = kid;
    }

    public String getCampusInfoTime() {
        return campusInfoTime;
    }

    public void setCampusInfoTime(String campusInfoTime) {
        this.campusInfoTime = campusInfoTime;
    }
}
