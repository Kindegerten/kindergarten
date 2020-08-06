package com.kindergarten.bean;

import java.util.Date;

public class Teachers
{

    private int teacherId;
    private String teacherTel;
    private String teacherPwd;
    private String teacherName;
    private String teacherSex;
    private int teacherAge;
    private int classId;
    private int teacherStatus;
    private int kinderId;
    private Date teacherRegtime;
    private int rid;


    public Teachers()
    {

    }

    public Teachers(int teacherId, String teacherTel, String teacherPwd, String teacherName, String teacherSex, int teacherAge, int classId) {
        this.teacherId = teacherId;
        this.teacherTel = teacherTel;
        this.teacherPwd = teacherPwd;
        this.teacherName = teacherName;
        this.teacherSex = teacherSex;
        this.teacherAge = teacherAge;
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

    public Date getTeacherRegtime() {
        return teacherRegtime;
    }

    public void setTeacherRegtime(Date teacherRegtime) {
        this.teacherRegtime = teacherRegtime;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
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

    @Override
    public String toString() {
        return "TblTeachers{" +
                "teacherId=" + teacherId +
                ", teacherTel='" + teacherTel + '\'' +
                ", teacherPwd='" + teacherPwd + '\'' +
                ", teacherName='" + teacherName + '\'' +
                ", teacherSex='" + teacherSex + '\'' +
                ", teacherAge=" + teacherAge +
                ", classId=" + classId +
                '}';
    }
}
