package com.kindergarten.bean;

import java.util.Date;

public class Security {
    private int securityId;
    private String securityName;
    private String securitySex;
    private int securityAge;
    private String securityAdd;
    private String securityPhone;
    private Date securityRegtime;
    private int rid;
    private int securityStatus;
    private String securityPwd;

    public Security() {
    }

    public int getSecurityId() {
        return securityId;
    }

    public void setSecurityId(int securityId) {
        this.securityId = securityId;
    }

    public String getSecurityName() {
        return securityName;
    }

    public void setSecurityName(String securityName) {
        this.securityName = securityName;
    }

    public String getSecuritySex() {
        return securitySex;
    }

    public void setSecuritySex(String securitySex) {
        this.securitySex = securitySex;
    }

    public int getSecurityAge() {
        return securityAge;
    }

    public void setSecurityAge(int securityAge) {
        this.securityAge = securityAge;
    }

    public String getSecurityAdd() {
        return securityAdd;
    }

    public void setSecurityAdd(String securityAdd) {
        this.securityAdd = securityAdd;
    }

    public String getSecurityPhone() {
        return securityPhone;
    }

    public void setSecurityPhone(String securityPhone) {
        this.securityPhone = securityPhone;
    }

    public Date getSecurityRegtime() {
        return securityRegtime;
    }

    public void setSecurityRegtime(Date securityRegtime) {
        this.securityRegtime = securityRegtime;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public int getSecurityStatus() {
        return securityStatus;
    }

    public void setSecurityStatus(int securityStatus) {
        this.securityStatus = securityStatus;
    }

    public String getSecurityPwd() {
        return securityPwd;
    }

    public void setSecurityPwd(String securityPwd) {
        this.securityPwd = securityPwd;
    }
}
