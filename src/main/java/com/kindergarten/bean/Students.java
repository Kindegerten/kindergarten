package com.kindergarten.bean;

<<<<<<< HEAD
import java.util.Date;

=======
>>>>>>> origin/master
public class Students {
    private int studentId;
    private String studentName;
    private String studentSex;
    private String studentBirth;
    private String studentAdd;
<<<<<<< HEAD
    private Date studentTime;
    private int classId;
    private String className;
    private int  kinderId;
    private String kinderName;
=======
    private String studentTime;
    private int classId;
    private int kinderId;

>>>>>>> origin/master

    public Students() {
    }

<<<<<<< HEAD
=======
    public Students(int studentId, String studentName, String studentSex, String studentBirth, String studentAdd, String studentTime, int classId, int kinderId) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.studentSex = studentSex;
        this.studentBirth = studentBirth;
        this.studentAdd = studentAdd;
        this.studentTime = studentTime;
        this.classId = classId;
        this.kinderId = kinderId;
    }

>>>>>>> origin/master
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

    public String getStudentBirth() {
        return studentBirth;
    }

    public void setStudentBirth(String studentBirth) {
        this.studentBirth = studentBirth;
    }

    public String getStudentAdd() {
        return studentAdd;
    }

    public void setStudentAdd(String studentAdd) {
        this.studentAdd = studentAdd;
    }

<<<<<<< HEAD
    public Date getStudentTime() {
        return studentTime;
    }

    public void setStudentTime(Date studentTime) {
=======
    public String getStudentTime() {
        return studentTime;
    }

    public void setStudentTime(String studentTime) {
>>>>>>> origin/master
        this.studentTime = studentTime;
    }

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

<<<<<<< HEAD
    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

=======
>>>>>>> origin/master
    public int getKinderId() {
        return kinderId;
    }

    public void setKinderId(int kinderId) {
        this.kinderId = kinderId;
    }
<<<<<<< HEAD

    public String getKinderName() {
        return kinderName;
    }

    public void setKinderName(String kinderName) {
        this.kinderName = kinderName;
    }
=======
>>>>>>> origin/master
}
