package com.kindergarten.bean;

public class SafetyVtq {
    private int safetyVtqId;
    private String safetyVtqName;
    private String a;
    private int aValue;
    private String b;
    private String bValue;
    private int safetyVideoId;//试题对应视频的id
    public SafetyVtq() {
    }

    public int getSafetyVtqId() {
        return safetyVtqId;
    }

    public void setSafetyVtqId(int safetyVtqId) {
        this.safetyVtqId = safetyVtqId;
    }

    public int getSafetyVideoId() {
        return safetyVideoId;
    }

    public void setSafetyVideoId(int safetyVideoId) {
        this.safetyVideoId = safetyVideoId;
    }

    public String getSafetyVtqName() {
        return safetyVtqName;
    }

    public void setSafetyVtqName(String safetyVtqName) {
        this.safetyVtqName = safetyVtqName;
    }

    public String getA() {
        return a;
    }

    public void setA(String a) {
        this.a = a;
    }

    public int getaValue() {
        return aValue;
    }

    public void setaValue(int aValue) {
        this.aValue = aValue;
    }

    public String getB() {
        return b;
    }

    public void setB(String b) {
        this.b = b;
    }

    public String getbValue() {
        return bValue;
    }

    public void setbValue(String bValue) {
        this.bValue = bValue;
    }
}
