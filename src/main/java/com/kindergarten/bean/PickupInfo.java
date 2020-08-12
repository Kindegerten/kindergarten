package com.kindergarten.bean;

public class PickupInfo {

    private String studentName,teacherName,studentSex;
    private int studentId,classId,kinderId,teacherId;
    private String studentTime;
    private String className;

    public PickupInfo() {
    }

    public PickupInfo(String studentName, String teacherName, String studentSex, int studentId, int classId, int kinderId, int teacherId, String studentTime, String className) {
        this.studentName = studentName;
        this.teacherName = teacherName;
        this.studentSex = studentSex;
        this.studentId = studentId;
        this.classId = classId;
        this.kinderId = kinderId;
        this.teacherId = teacherId;
        this.studentTime = studentTime;
        this.className = className;
    }

    @Override
    public String toString() {
        return "PickupInfo{" +
                "studentName='" + studentName + '\'' +
                ", teacherName='" + teacherName + '\'' +
                ", studentSex='" + studentSex + '\'' +
                ", studentId=" + studentId +
                ", classId=" + classId +
                ", kinderId=" + kinderId +
                ", teacherId=" + teacherId +
                ", studentTime='" + studentTime + '\'' +
                ", className='" + className + '\'' +
                '}';
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getStudentSex() {
        return studentSex;
    }

    public void setStudentSex(String studentSex) {
        this.studentSex = studentSex;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public int getKinderId() {
        return kinderId;
    }

    public void setKinderId(int kinderId) {
        this.kinderId = kinderId;
    }

    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    public String getStudentTime() {
        return studentTime;
    }

    public void setStudentTime(String studentTime) {
        this.studentTime = studentTime;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }
}
