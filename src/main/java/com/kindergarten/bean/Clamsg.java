package com.kindergarten.bean;

public class Clamsg
{

    private int clamsgId;
    private String clamsgDetail;
    private int classId;
    private int teacherId;
    private String sendmsgTime;
    private String clamsgName;

    public Clamsg(){

    }

    public Clamsg(int clamsgId, String clamsgDetail, int classId, int teacherId, String sendmsgTime, String clamsgName) {
        this.clamsgId = clamsgId;
        this.clamsgDetail = clamsgDetail;
        this.classId = classId;
        this.teacherId = teacherId;
        this.sendmsgTime = sendmsgTime;
        this.clamsgName = clamsgName;
    }

    public String getClamsgName() {
        return clamsgName;
    }

    public void setClamsgName(String clamsgName) {
        this.clamsgName = clamsgName;
    }

    public int getClamsgId() {
        return clamsgId;
    }

    public void setClamsgId(int clamsgId) {
        this.clamsgId = clamsgId;
    }

    public String getClamsgDetail() {
        return clamsgDetail;
    }

    public void setClamsgDetail(String clamsgDetail) {
        this.clamsgDetail = clamsgDetail;
    }

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    public String getSendmsgTime() {
        return sendmsgTime;
    }

    public void setSendmsgTime(String sendmsgTime) {
        this.sendmsgTime = sendmsgTime;
    }

    @Override
    public String toString() {
        return "Clamsg{" +
                "clamsgId=" + clamsgId +
                ", clamsgDetail='" + clamsgDetail + '\'' +
                ", classId=" + classId +
                ", teacherId=" + teacherId +
                ", sendmsgTime='" + sendmsgTime + '\'' +
                ", clamsgName='" + clamsgName + '\'' +
                '}';
    }
}
