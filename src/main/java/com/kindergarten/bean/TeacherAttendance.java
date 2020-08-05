package com.kindergarten.bean;

public class TeacherAttendance {

    private int tertimeId,tid;
    private String printtime,tertimeDate,tertimePeriod;

    public TeacherAttendance() {
    }

    public TeacherAttendance(int tertimeId, int tid, String printtime, String tertimeDate, String tertimePeriod) {
        this.tertimeId = tertimeId;
        this.tid = tid;
        this.printtime = printtime;
        this.tertimeDate = tertimeDate;
        this.tertimePeriod = tertimePeriod;
    }

    @Override
    public String toString() {
        return "TeacherAttendance{" +
                "tertimeId=" + tertimeId +
                ", tid=" + tid +
                ", printtime='" + printtime + '\'' +
                ", tertimeDate='" + tertimeDate + '\'' +
                ", tertimePeriod='" + tertimePeriod + '\'' +
                '}';
    }

    public int getTertimeId() {
        return tertimeId;
    }

    public void setTertimeId(int tertimeId) {
        this.tertimeId = tertimeId;
    }

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public String getPrinttime() {
        return printtime;
    }

    public void setPrinttime(String printtime) {
        this.printtime = printtime;
    }

    public String getTertimeDate() {
        return tertimeDate;
    }

    public void setTertimeDate(String tertimeDate) {
        this.tertimeDate = tertimeDate;
    }

    public String getTertimePeriod() {
        return tertimePeriod;
    }

    public void setTertimePeriod(String tertimePeriod) {
        this.tertimePeriod = tertimePeriod;
    }
}
