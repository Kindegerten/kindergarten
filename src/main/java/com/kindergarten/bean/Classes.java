package com.kindergarten.bean;


import java.util.Date;
import java.util.List;

public class Classes {
    private int classId;
    private String className;
    private Date classRegtime;
    private int kinderId;
    private String kinderName;
    private List<Classes>classes;

    public Classes() {

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

    public Date getClassRegtime() {
        return classRegtime;
    }

    public void setClassRegtime(Date classRegtime) {
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

    public List<Classes> getClasses() {
        return classes;
    }

    public void setClasses(List<Classes> classes) {
        this.classes = classes;
    }
}
