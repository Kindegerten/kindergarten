package com.kindergarten.bean;

public class ClassInfo
{

    private int studentId;
    private String studentName;
    private String studentSex;
    private String studentAdd;
    private String studentBirth;
    private String studentTime;
    private String parentsName;
    private String parentsTel;
    private int classId;
    private int teacherId;
    private String stutimeDate;
    private String stutimeType;

    public ClassInfo(){
    }

    public ClassInfo(int studentId, String studentName, String studentSex, String studentAdd, String studentBirth, String studentTime, String parentsName, String parentsTel, int classId, int teacherId, String stutimeDate, String stutimeType) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.studentSex = studentSex;
        this.studentAdd = studentAdd;
        this.studentBirth = studentBirth;
        this.studentTime = studentTime;
        this.parentsName = parentsName;
        this.parentsTel = parentsTel;
        this.classId = classId;
        this.teacherId = teacherId;
        this.stutimeDate = stutimeDate;
        this.stutimeType = stutimeType;
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

    public String getStudentSex() {
        return studentSex;
    }

    public void setStudentSex(String studentSex) {
        this.studentSex = studentSex;
    }

    public String getStudentAdd() {
        return studentAdd;
    }

    public void setStudentAdd(String studentAdd) {
        this.studentAdd = studentAdd;
    }

    public String getStudentBirth() {
        return studentBirth;
    }

    public void setStudentBirth(String studentBirth) {
        this.studentBirth = studentBirth;
    }

    public String getStudentTime() {
        return studentTime;
    }

    public void setStudentTime(String studentTime) {
        this.studentTime = studentTime;
    }

    public String getParentsName() {
        return parentsName;
    }

    public void setParentsName(String parentsName) {
        this.parentsName = parentsName;
    }

    public String getParentsTel() {
        return parentsTel;
    }

    public void setParentsTel(String parentsTel) {
        this.parentsTel = parentsTel;
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

    public String getStutimeDate() {
        return stutimeDate;
    }

    public void setStutimeDate(String stutimeDate) {
        this.stutimeDate = stutimeDate;
    }

    public String getStutimeType() {
        return stutimeType;
    }

    public void setStutimeType(String stutimeType) {
        this.stutimeType = stutimeType;
    }


    @Override
    public String toString() {
        return "ClassInfo{" +
                "studentId=" + studentId +
                ", studentName='" + studentName + '\'' +
                ", studentSex='" + studentSex + '\'' +
                ", studentAdd='" + studentAdd + '\'' +
                ", studentBirth='" + studentBirth + '\'' +
                ", studentTime='" + studentTime + '\'' +
                ", parentsName='" + parentsName + '\'' +
                ", parentsTel='" + parentsTel + '\'' +
                ", classId=" + classId +
                ", teacherId=" + teacherId +
                ", stutimeDate='" + stutimeDate + '\'' +
                ", stutimeType='" + stutimeType + '\'' +
                '}';
    }
}
