package com.kindergarten.bean;

import java.util.Date;
//实体类不给get方法，xml查出来的数据不会封装到实体类里面
public class Syslog {
    private int syslogId;
    private String operateor;
    private String operateType;
    private String operateDetail;
    private Date operateTime;
    private String operateResult;
    private String operateIp;

    public Syslog() {
    }

    public Syslog(int syslogId, String operateor, String operateType, String operateDetail, Date operateTime, String operateResult, String operateIp) {
        this.syslogId = syslogId;
        this.operateor = operateor;
        this.operateType = operateType;
        this.operateDetail = operateDetail;
        this.operateTime = operateTime;
        this.operateResult = operateResult;
        this.operateIp = operateIp;
    }

    public void setSyslogId(int syslogId) {
        this.syslogId = syslogId;
    }

    public void setOperateor(String operateor) {
        this.operateor = operateor;
    }

    public void setOperateType(String operateType) {
        this.operateType = operateType;
    }

    public void setOperateDetail(String operateDetail) {
        this.operateDetail = operateDetail;
    }

    public void setOperateTime(Date operateTime) {
        this.operateTime = operateTime;
    }

    public void setOperateResult(String operateResult) {
        this.operateResult = operateResult;
    }

    public void setOperateIp(String operateIp) {
        this.operateIp = operateIp;
    }

    public int getSyslogId() {
        return syslogId;
    }

    public String getOperateor() {
        return operateor;
    }

    public String getOperateType() {
        return operateType;
    }

    public String getOperateDetail() {
        return operateDetail;
    }

    public Date getOperateTime() {
        return operateTime;
    }

    public String getOperateResult() {
        return operateResult;
    }

    public String getOperateIp() {
        return operateIp;
    }
}
