package com.kindergarten.bean;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class Teachers {
    private int teacherId;
    private String teacherTel;
    private String teacherPwd;
    private String teacherName;
    private int classId; //班级id
    private int  teacherStatus;
    private int  kinderId;//所属园所id
    private String  teacherSex;
    private int  teacherAge;

//    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
    private Date teacherRegtime;

    public Teachers() {
    }

    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    public String getTeacherTel() {
        return teacherTel;
    }

    public void setTeacherTel(String teacherTel) {
        this.teacherTel = teacherTel;
    }

    public String getTeacherPwd() {
        return teacherPwd;
    }

    public void setTeacherPwd(String teacherPwd) {
        this.teacherPwd = teacherPwd;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public int getTeacherStatus() {
        return teacherStatus;
    }

    public void setTeacherStatus(int teacherStatus) {
        this.teacherStatus = teacherStatus;
    }

    public int getKinderId() {
        return kinderId;
    }

    public void setKinderId(int kinderId) {
        this.kinderId = kinderId;
    }

    public String getTeacherSex() {
        return teacherSex;
    }

    public void setTeacherSex(String teacherSex) {
        this.teacherSex = teacherSex;
    }

    public int getTeacherAge() {
        return teacherAge;
    }

    public void setTeacherAge(int teacherAge) {
        this.teacherAge = teacherAge;
    }

    public Date getTeacherRegtime() {
        return teacherRegtime;
    }

    public void setTeacherRegtime(Date teacherRegtime) {
        this.teacherRegtime = teacherRegtime;
    }
}
