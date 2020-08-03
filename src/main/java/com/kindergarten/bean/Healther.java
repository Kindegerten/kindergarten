package com.kindergarten.bean;

public class Healther {
    private int healtherId;
    private String healtherName;
    private String healtherSex;
    private int healtherAge;
    private String healtherAdd;
    private String healtherPhone;
    private String healtherRegtime;
    private int rid;
    private String healtherStatus;
    private String healtherPwd;

    public Healther() {
    }

    public Healther(int healtherId, String healtherName, String healtherSex, int healtherAge, String healtherAdd, String healtherPhone, String healtherRegtime, int rid, String healtherStatus, String healtherPwd) {
        this.healtherId = healtherId;
        this.healtherName = healtherName;
        this.healtherSex = healtherSex;
        this.healtherAge = healtherAge;
        this.healtherAdd = healtherAdd;
        this.healtherPhone = healtherPhone;
        this.healtherRegtime = healtherRegtime;
        this.rid = rid;
        this.healtherStatus = healtherStatus;
        this.healtherPwd = healtherPwd;
    }

    public int getHealtherId() {
        return healtherId;
    }

    public void setHealtherId(int healtherId) {
        this.healtherId = healtherId;
    }

    public String getHealtherName() {
        return healtherName;
    }

    public void setHealtherName(String healtherName) {
        this.healtherName = healtherName;
    }

    public String getHealtherSex() {
        return healtherSex;
    }

    public void setHealtherSex(String healtherSex) {
        this.healtherSex = healtherSex;
    }

    public int getHealtherAge() {
        return healtherAge;
    }

    public void setHealtherAge(int healtherAge) {
        this.healtherAge = healtherAge;
    }

    public String getHealtherAdd() {
        return healtherAdd;
    }

    public void setHealtherAdd(String healtherAdd) {
        this.healtherAdd = healtherAdd;
    }

    public String getHealtherPhone() {
        return healtherPhone;
    }

    public void setHealtherPhone(String healtherPhone) {
        this.healtherPhone = healtherPhone;
    }

    public String getHealtherRegtime() {
        return healtherRegtime;
    }

    public void setHealtherRegtime(String healtherRegtime) {
        this.healtherRegtime = healtherRegtime;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public String getHealtherStatus() {
        return healtherStatus;
    }

    public void setHealtherStatus(String healtherStatus) {
        this.healtherStatus = healtherStatus;
    }

    public String getHealtherPwd() {
        return healtherPwd;
    }

    public void setHealtherPwd(String healtherPwd) {
        this.healtherPwd = healtherPwd;
    }
}
