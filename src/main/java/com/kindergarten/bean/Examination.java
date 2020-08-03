package com.kindergarten.bean;

public class Examination {
    private int examinationId;
    private String examinationTime;
    private String height;
    private String weight;
    private String vision;
    private String temperature;
    private String healthStatus;
    private int sid;
    private String studentName;
    private int classId;

    public Examination() {
    }

    public Examination(int classId,int examinationId, String examinationTime, String height, String weight, String vision, String temperature, String healthStatus, int sid, String studentName) {
        this.examinationId = examinationId;
        this.examinationTime = examinationTime;
        this.height = height;
        this.weight = weight;
        this.vision = vision;
        this.temperature = temperature;
        this.healthStatus = healthStatus;
        this.sid = sid;
        this.studentName = studentName;
        this.classId=classId;
    }

    public int getExaminationId() {
        return examinationId;
    }

    public void setExaminationId(int examinationId) {
        this.examinationId = examinationId;
    }

    public String getExaminationTime() {
        return examinationTime;
    }

    public void setExaminationTime(String examinationTime) {
        this.examinationTime = examinationTime;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getVision() {
        return vision;
    }

    public void setVision(String vision) {
        this.vision = vision;
    }

    public String getTemperature() {
        return temperature;
    }

    public void setTemperature(String temperature) {
        this.temperature = temperature;
    }

    public String getHealthStatus() {
        return healthStatus;
    }

    public void setHealthStatus(String healthStatus) {
        this.healthStatus = healthStatus;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }
}
