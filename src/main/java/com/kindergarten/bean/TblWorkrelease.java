package com.kindergarten.bean;

public class TblWorkrelease
{
    private int workReleaseid;
    private String workreleaseTime;
    private String workName;
    private  String workUrl;
    private int classId;
    private int teacherId;
    private String className;
    private String parentsName;

    public TblWorkrelease(){

    }

    public TblWorkrelease(int workReleaseid, String workreleaseTime, String workName, String workUrl, int classId, int teacherId, String className, String parentsName) {
        this.workReleaseid = workReleaseid;
        this.workreleaseTime = workreleaseTime;
        this.workName = workName;
        this.workUrl = workUrl;
        this.classId = classId;
        this.teacherId = teacherId;
        this.className = className;
        this.parentsName = parentsName;
    }

    public String getParentsName() {
        return parentsName;
    }

    public void setParentName(String parentsName) {
        this.parentsName = parentsName;
    }

    public int getWorkReleaseid() {
        return workReleaseid;
    }

    public void setWorkReleaseid(int workReleaseid) {
        this.workReleaseid = workReleaseid;
    }

    public String getWorkreleaseTime() {
        return workreleaseTime;
    }

    public void setWorkreleaseTime(String workreleaseTime) {
        this.workreleaseTime = workreleaseTime;
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

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    @Override
    public String toString() {
        return "TblWorkrelease{" +
                "workReleaseid=" + workReleaseid +
                ", workreleaseTime='" + workreleaseTime + '\'' +
                ", workName='" + workName + '\'' +
                ", workUrl='" + workUrl + '\'' +
                ", classId=" + classId +
                ", teacherId=" + teacherId +
                ", className='" + className + '\'' +
                '}';
    }
}
