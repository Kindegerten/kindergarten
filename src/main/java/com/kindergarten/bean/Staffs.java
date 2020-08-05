package com.kindergarten.bean;

public class Staffs {
    private int kinderId;
    private int teacherId;
    private String teacherName;
    private String roleName;
    private String teacherRegtime;

    public Staffs() {
    }

    public Staffs(int kinderId,int teacherId, String teacherName, String roleName, String teacherRegtime) {
        this.kinderId = kinderId;
        this.teacherId = teacherId;
        this.teacherName = teacherName;
        this.roleName = roleName;
        this.teacherRegtime = teacherRegtime;
    }

    public int getKinderId() {
        return kinderId;
    }

    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    public void setKinderId(int kinderId) {
        this.kinderId = kinderId;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getTeacherRegtime() {
        return teacherRegtime;
    }

    public void setTeacherRegtime(String teacherRegtime) {
        this.teacherRegtime = teacherRegtime;
    }
}
