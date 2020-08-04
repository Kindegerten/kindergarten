package com.kindergarten.bean;

public class Workrelease {
    private int workreleaseId;
    private String workName;
    private String workUrl;
    private String workreleaseTime;
    private int classId;
    private int teacherId;
    private String teacherName;

    private String workResult="未完成";
    private String workEva="暂未评价";


    public Workrelease() {
    }


    public int getWorkreleaseId() {
        return workreleaseId;
    }

    public void setWorkreleaseId(int workreleaseId) {
        this.workreleaseId = workreleaseId;
    }

    public String getWorkName() {
        return workName;
    }

    public void setWorkName(String workName) {
        this.workName = workName;
    }

    public String getWorkUrl() {
        return workUrl;
    }

    public void setWorkUrl(String workUrl) {
        this.workUrl = workUrl;
    }

    public String getWorkreleaseTime() {
        return workreleaseTime;
    }

    public void setWorkreleaseTime(String workreleaseTime) {
        this.workreleaseTime = workreleaseTime;
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

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getWorkResult() {
        return workResult;
    }

    public void setWorkResult(String workResult) {
        this.workResult = workResult;
    }

    public String getWorkEva() {
        return workEva;
    }

    public void setWorkEva(String workEva) {
        this.workEva = workEva;
    }
}
