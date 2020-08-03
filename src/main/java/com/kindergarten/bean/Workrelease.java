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

    public Workrelease() {
    }



    public String getWorkResult() {
        return workResult;
    }

    public void setWorkResult(String workResult) {
        this.workResult = workResult;
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

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }



    public Workrelease(int workreleaseId, String workName, String workUrl, String workreleaseTime, int classId, int teacherId, String teacherName, String workResult) {
        this.workreleaseId = workreleaseId;
        this.workName = workName;
        this.workUrl = workUrl;
        this.workreleaseTime = workreleaseTime;
        this.classId = classId;
        this.teacherId = teacherId;
        this.teacherName = teacherName;
        this.workResult = workResult;
    }
}
