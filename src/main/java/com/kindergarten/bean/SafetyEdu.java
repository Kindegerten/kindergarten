package com.kindergarten.bean;

public class SafetyEdu
{

    private int id;
    private String name;
    private String startTime;
    private String endTime;
    private String route;
    private int teacherId;
    private int classId;

    public SafetyEdu(){

    }

    public SafetyEdu(int id, String name, String startTime, String endTime, String route, int teacherId, int classId) {
        this.id = id;
        this.name = name;
        this.startTime = startTime;
        this.endTime = endTime;
        this.route = route;
        this.teacherId = teacherId;
        this.classId = classId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getRoute() {
        return route;
    }

    public void setRoute(String route) {
        this.route = route;
    }

    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    @Override
    public String toString() {
        return "SafetyEdu{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", startTime='" + startTime + '\'' +
                ", endTime='" + endTime + '\'' +
                ", route='" + route + '\'' +
                ", teacherId=" + teacherId +
                ", classId=" + classId +
                '}';
    }
}
