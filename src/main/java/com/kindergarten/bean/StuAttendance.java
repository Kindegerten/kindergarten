package com.kindergarten.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class StuAttendance {

    private int stutimeId;
    private String stutimeDate;
    private int studentId;
    private String studentType;

    public StuAttendance() {
    }

    public StuAttendance(int stutimeId, String stutimeDate, int studentId, String studentType) {
        this.stutimeId = stutimeId;
        this.stutimeDate = stutimeDate;
        this.studentId = studentId;
        this.studentType = studentType;
    }

    public int getStutimeId() {
        return stutimeId;
    }

    public void setStutimeId(int stutimeId) {
        this.stutimeId = stutimeId;
    }

    public String getStutimeDate() {
        return stutimeDate;
    }

    public void setStutimeDate(String stutimeDate) {
        this.stutimeDate = stutimeDate;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getStudentType() {
        return studentType;
    }

    public void setStudentType(String studentType) {
        this.studentType = studentType;
    }
}
