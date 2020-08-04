package com.kindergarten.bean;

import java.util.Date;

public class Kinder {
    private int kinderId,kinderStatus;
    private String parameterText;//状态名
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
    private String kinderRegtime; //申请时间
    private Date approveTime;//审批时间
    private String kinderAccount;
    private String kinderStateText;
    private String kinderPwd;
    private int kinderState;
    public Kinder() {
    }

    public String getKinderPwd() {
        return kinderPwd;
    }

    public void setKinderPwd(String kinderPwd) {
        this.kinderPwd = kinderPwd;
    }

    public int getKinderState() {
        return kinderState;
    }

    public void setKinderState(int kinderState) {
        this.kinderState = kinderState;
    }

    public String getKinderStateText() {

        return kinderStateText;
    }

    public void setKinderStateText(String kinderStateText) {
        this.kinderStateText = kinderStateText;
    }

    public String getKinderAccount() {
        return kinderAccount;
    }

    public void setKinderAccount(String kinderAccount) {
        this.kinderAccount = kinderAccount;
    }

    public String getParameterText() {
        return parameterText;
    }

    public void setParameterText(String parameterText) {
        this.parameterText = parameterText;
    }

    public String getKinderRegtime() {
        return kinderRegtime;
    }

    public void setKinderRegtime(String kinderRegtime) {
        this.kinderRegtime = kinderRegtime;
    }



    //    public Date getKinderRegtime() {
//        return kinderRegtime;
//    }
//
//    public void setKinderRegtime(Date kinderRegtime) {
//        this.kinderRegtime = kinderRegtime;
//    }
//
    public Date getApproveTime() {
        return approveTime;
    }

    public void setApproveTime(Date approveTime) {
        this.approveTime = approveTime;
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
