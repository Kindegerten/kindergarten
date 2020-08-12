package com.kindergarten.bean;

import java.util.List;

public class ClassMember {
    private int classId;
    private int studentId;
    private String studentName;
    private String className;
    private String classRegtime;
    private int kinderId;
    private String kinderName;
    private String classRoom;
    private int teacherId;
    private String teacherName;
    private List<ClassMember>classes;

    public ClassMember() {

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

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    public String getClassRoom() {
        return classRoom;
    }

    public void setClassRoom(String classRoom) {
        this.classRoom = classRoom;
    }

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getClassRegtime() {
        return classRegtime;
    }

    public void setClassRegtime(String classRegtime) {
        this.classRegtime = classRegtime;
    }

    public int getKinderId() {
        return kinderId;
    }

    public void setKinderId(int kinderId) {
        this.kinderId = kinderId;
    }

    public String getKinderName() {
        return kinderName;
    }

    public void setKinderName(String kinderName) {
        this.kinderName = kinderName;
    }

    public List<ClassMember> getClasses() {
        return classes;
    }

    public void setClasses(List<ClassMember> classes) {
        this.classes = classes;
    }
}
