package com.kindergarten.bean;

import java.util.Date;

public class Rector {
    private int rectorId;
    private String rectorName;
    private String rectorTel;
    private String rectorPwd;
    private String rectorSex;
    private int rectorAge;
    private String rectorAdd;
    private Date rectorRegtime;
    private int rectorStatus;
    private int kinderId;
    private String kinderName;
    public Rector() {

    }

    public String getKinderName() {
        return kinderName;
    }

    public void setKinderName(String kinderName) {
        this.kinderName = kinderName;
    }

    public int getRectorId() {
        return rectorId;
    }

    public void setRectorId(int rectorId) {
        this.rectorId = rectorId;
    }

    public String getRectorName() {
        return rectorName;
    }

    public void setRectorName(String rectorName) {
        this.rectorName = rectorName;
    }

    public String getRectorTel() {
        return rectorTel;
    }

    public void setRectorTel(String rectorTel) {
        this.rectorTel = rectorTel;
    }

    public String getRectorPwd() {
        return rectorPwd;
    }

    public void setRectorPwd(String rectorPwd) {
        this.rectorPwd = rectorPwd;
    }

    public String getRectorSex() {
        return rectorSex;
    }

    public void setRectorSex(String rectorSex) {
        this.rectorSex = rectorSex;
    }

    public int getRectorAge() {
        return rectorAge;
    }

    public void setRectorAge(int rectorAge) {
        this.rectorAge = rectorAge;
    }

    public String getRectorAdd() {
        return rectorAdd;
    }

    public void setRectorAdd(String rectorAdd) {
        this.rectorAdd = rectorAdd;
    }

    public Date getRectorRegtime() {
        return rectorRegtime;
    }

    public void setRectorRegtime(Date rectorRegtime) {
        this.rectorRegtime = rectorRegtime;
    }

    public int getRectorStatus() {
        return rectorStatus;
    }

    public void setRectorStatus(int rectorStatus) {
        this.rectorStatus = rectorStatus;
    }

    public int getKinderId() {
        return kinderId;
    }

    public void setKinderId(int kinderId) {
        this.kinderId = kinderId;
    }
}
