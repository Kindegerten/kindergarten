package com.kindergarten.bean;

public class Work {
    private int workID;
    private int workReleaseid;
    private String workUrl;
    private String workFinishtime;
    private int cid;
    private String workResult;
    private String workEva;
    private int studentId;
    private String studentName;
    private int parentId;
    private String parentName;
    private int kid;

    public Work() {
    }

    public Work(int workID, int workReleaseid, String workUrl, String workFinishtime, int cid, String workResult, String workEva, int studentId, String studentName, int parentId, String parentName, int kid) {
        this.workID = workID;
        this.workReleaseid = workReleaseid;
        this.workUrl = workUrl;
        this.workFinishtime = workFinishtime;
        this.cid = cid;
        this.workResult = workResult;
        this.workEva = workEva;
        this.studentId = studentId;
        this.studentName = studentName;
        this.parentId = parentId;
        this.parentName = parentName;
        this.kid = kid;
    }

    public int getWorkID() {
        return workID;
    }

    public void setWorkID(int workID) {
        this.workID = workID;
    }

    public int getWorkReleaseid() {
        return workReleaseid;
    }

    public void setWorkReleaseid(int workReleaseid) {
        this.workReleaseid = workReleaseid;
    }

    public String getWorkUrl() {
        return workUrl;
    }

    public void setWorkUrl(String workUrl) {
        this.workUrl = workUrl;
    }

    public String getWorkFinishtime() {
        return workFinishtime;
    }

    public void setWorkFinishtime(String workFinishtime) {
        this.workFinishtime = workFinishtime;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
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

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    public int getKid() {
        return kid;
    }

    public void setKid(int kid) {
        this.kid = kid;
    }
}
