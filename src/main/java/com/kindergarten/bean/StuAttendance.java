package com.kindergarten.bean;

public class StuAttendance {

    private int stutimeId,studentId,stutimeIsdelay;
    private String stutimeDate,stutimeType,photoUrl;

    public StuAttendance(int stutimeId, int studentId, int stutimeIsdelay, String stutimeDate, String stutimeType, String photoUrl) {
        this.stutimeId = stutimeId;
        this.studentId = studentId;
        this.stutimeIsdelay = stutimeIsdelay;
        this.stutimeDate = stutimeDate;
        this.stutimeType = stutimeType;
        this.photoUrl = photoUrl;
    }

    public StuAttendance() {
    }

    @Override
    public String toString() {
        return "StuAttendance{" +
                "stutimeId=" + stutimeId +
                ", studentId=" + studentId +
                ", stutimeIsdelay=" + stutimeIsdelay +
                ", stutimeDate='" + stutimeDate + '\'' +
                ", stutimeType='" + stutimeType + '\'' +
                ", photoUrl='" + photoUrl + '\'' +
                '}';
    }

    public int getStutimeId() {
        return stutimeId;
    }

    public void setStutimeId(int stutimeId) {
        this.stutimeId = stutimeId;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public int getStutimeIsdelay() {
        return stutimeIsdelay;
    }

    public void setStutimeIsdelay(int stutimeIsdelay) {
        this.stutimeIsdelay = stutimeIsdelay;
    }

    public String getStutimeDate() {
        return stutimeDate;
    }

    public void setStutimeDate(String stutimeDate) {
        this.stutimeDate = stutimeDate;
    }

    public String getStutimeType() {
        return stutimeType;
    }

    public void setStutimeType(String stutimeType) {
        this.stutimeType = stutimeType;
    }

    public String getPhotoUrl() {
        return photoUrl;
    }

    public void setPhotoUrl(String photoUrl) {
        this.photoUrl = photoUrl;
    }
}
