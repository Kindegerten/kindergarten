package com.kindergarten.bean;

public class Kinder {
    private int kinderId,kinderStatus;
    private String kinderName;//院所名称
    private String kinderLp;//法人
    private String kinderLpid;//法人身份证
    private String kinderLpadd;//法人地址
    private String kinderLptel;//联系电话
    private String schoolPermit;//办学许可证
    private String healthPermit;//卫生许可证
    private String firePermit;//消防许可证
    private String groupPermit;//组织代码证
    private String registrationPermit;//税务登记证

    public Kinder() {
    }

    public int getKinderId() {
        return kinderId;
    }

    public void setKinderId(int kinderId) {
        this.kinderId = kinderId;
    }

    public int getKinderStatus() {
        return kinderStatus;
    }

    public void setKinderStatus(int kinderStatus) {
        this.kinderStatus = kinderStatus;
    }

    public String getKinderName() {
        return kinderName;
    }

    public void setKinderName(String kinderName) {
        this.kinderName = kinderName;
    }

    public String getKinderLp() {
        return kinderLp;
    }

    public void setKinderLp(String kinderLp) {
        this.kinderLp = kinderLp;
    }

    public String getKinderLpid() {
        return kinderLpid;
    }

    public void setKinderLpid(String kinderLpid) {
        this.kinderLpid = kinderLpid;
    }

    public String getKinderLpadd() {
        return kinderLpadd;
    }

    public void setKinderLpadd(String kinderLpadd) {
        this.kinderLpadd = kinderLpadd;
    }

    public String getKinderLptel() {
        return kinderLptel;
    }

    public void setKinderLptel(String kinderLptel) {
        this.kinderLptel = kinderLptel;
    }

    public String getSchoolPermit() {
        return schoolPermit;
    }

    public void setSchoolPermit(String schoolPermit) {
        this.schoolPermit = schoolPermit;
    }

    public String getHealthPermit() {
        return healthPermit;
    }

    public void setHealthPermit(String healthPermit) {
        this.healthPermit = healthPermit;
    }

    public String getFirePermit() {
        return firePermit;
    }

    public void setFirePermit(String firePermit) {
        this.firePermit = firePermit;
    }

    public String getGroupPermit() {
        return groupPermit;
    }

    public void setGroupPermit(String groupPermit) {
        this.groupPermit = groupPermit;
    }

    public String getRegistrationPermit() {
        return registrationPermit;
    }

    public void setRegistrationPermit(String registrationPermit) {
        this.registrationPermit = registrationPermit;
    }
}