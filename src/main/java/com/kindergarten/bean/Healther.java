package com.kindergarten.bean;

import java.util.Date;

public class Healther {
    private int healtherId;
    private String healtherName;
    private String healtherSex;
    private int healtherAge;
    private String healtherAdd;//地址
    private String healtherPhone;
    private Date healtherRegtime;
    private int rid;
    private int healtherStatus;
    private String healtherPwd;
    private int kid;

    public Healther() {

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

    public Date getHealtherRegtime() {
        return healtherRegtime;
    }

    public void setHealtherRegtime(Date healtherRegtime) {
        this.healtherRegtime = healtherRegtime;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public int getHealtherStatus() {
        return healtherStatus;
    }

    public void setHealtherStatus(int healtherStatus) {
        this.healtherStatus = healtherStatus;
    }

    public String getHealtherPwd() {
        return healtherPwd;
    }

    public void setHealtherPwd(String healtherPwd) {
        this.healtherPwd = healtherPwd;
    }

    public int getKid() {
        return kid;
    }

    public void setKid(int kid) {
        this.kid = kid;
    }
}
