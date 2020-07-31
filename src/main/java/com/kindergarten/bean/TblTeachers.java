package com.kindergarten.bean;

public class TblTeachers
{

    private int teacherId;
    private String teacherTel;
    private String teacherPwd;
    private String teacherName;

    public TblTeachers()
    {

    }

    public TblTeachers(int teacherId, String teacherTel, String teacherPwd)
    {
        this.teacherId = teacherId;
        this.teacherTel = teacherTel;
        this.teacherPwd = teacherPwd;
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

    @Override
    public String toString() {
        return "TblTeachers{" +
                "teacherId=" + teacherId +
                ", teacherTel=" + teacherTel +
                ", teacherPwd='" + teacherPwd + '\'' +
                ", teacherName='" + teacherName + '\'' +
                '}';
    }
}
