package com.kindergarten.bean;

public class StudentBill {
    private int studentbillId;
    private int studentId;
    private String studentName;
    private String studentbillCreatetime="无";
    private String studentbillTradeno;
    private String studentbillType="未缴费";
    private int schoolbillId;
    private String studentbillTrano;


    public StudentBill() {
    }

    public int getStudentbillId() {
        return studentbillId;
    }

    public void setStudentbillId(int studentbillId) {
        this.studentbillId = studentbillId;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentbillCreatetime() {
        return studentbillCreatetime;
    }

    public void setStudentbillCreatetime(String studentbillCreatetime) {
        this.studentbillCreatetime = studentbillCreatetime;
    }

    public String getStudentbillTradeno() {
        return studentbillTradeno;
    }

    public void setStudentbillTradeno(String studentbillTradeno) {
        this.studentbillTradeno = studentbillTradeno;
    }

    public String getStudentbillType() {
        return studentbillType;
    }

    public void setStudentbillType(String studentbillType) {
        this.studentbillType = studentbillType;
    }

    public int getSchoolbillId() {
        return schoolbillId;
    }

    public void setSchoolbillId(int schoolbillId) {
        this.schoolbillId = schoolbillId;
    }

    public String getStudentbillTrano() {
        return studentbillTrano;
    }

    public void setStudentbillTrano(String studentbillTrano) {
        this.studentbillTrano = studentbillTrano;
    }
}
