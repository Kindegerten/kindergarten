package com.kindergarten.bean;

public class SafetyTestComplete
{

    private int safetyTestTd;
    private int safetyVideoId;
    private int studentId;
    private int safetyTestScore;
    private int safetyTestResult;
    private int parentsId;
    private int teacherId;
    private String safetyVideoName;
    private String parentsName;
    private String studentName;

    public SafetyTestComplete(){

    }

    public SafetyTestComplete(int safetyTestTd, int safetyVideoId, int studentId, int safetyTestScore, int safetyTestResult, int parentsId, int teacherId, String safetyVideoName, String parentsName, String studentName) {
        this.safetyTestTd = safetyTestTd;
        this.safetyVideoId = safetyVideoId;
        this.studentId = studentId;
        this.safetyTestScore = safetyTestScore;
        this.safetyTestResult = safetyTestResult;
        this.parentsId = parentsId;
        this.teacherId = teacherId;
        this.safetyVideoName = safetyVideoName;
        this.parentsName = parentsName;
        this.studentName = studentName;
    }

    public String getSafetyVideoName() {
        return safetyVideoName;
    }

    public void setSafetyVideoName(String safetyVideoName) {
        this.safetyVideoName = safetyVideoName;
    }

    public String getParentsName() {
        return parentsName;
    }

    public void setParentsName(String parentsName) {
        this.parentsName = parentsName;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public int getSafetyTestTd() {
        return safetyTestTd;
    }

    public void setSafetyTestTd(int safetyTestTd) {
        this.safetyTestTd = safetyTestTd;
    }

    public int getSafetyVideoId() {
        return safetyVideoId;
    }

    public void setSafetyVideoId(int safetyVideoId) {
        this.safetyVideoId = safetyVideoId;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public int getSafetyTestScore() {
        return safetyTestScore;
    }

    public void setSafetyTestScore(int safetyTestScore) {
        this.safetyTestScore = safetyTestScore;
    }

    public int getSafetyTestResult() {
        return safetyTestResult;
    }

    public void setSafetyTestResult(int safetyTestResult) {
        this.safetyTestResult = safetyTestResult;
    }

    public int getParentsId() {
        return parentsId;
    }

    public void setParentsId(int parentsId) {
        this.parentsId = parentsId;
    }

    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    @Override
    public String toString() {
        return "SafetyTestComplete{" +
                "safetyTestTd=" + safetyTestTd +
                ", safetyVideoId=" + safetyVideoId +
                ", studentId=" + studentId +
                ", safetyTestScore=" + safetyTestScore +
                ", safetyTestResult=" + safetyTestResult +
                ", parentsId=" + parentsId +
                '}';
    }
}
