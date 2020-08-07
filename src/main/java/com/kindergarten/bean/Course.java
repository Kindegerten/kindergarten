package com.kindergarten.bean;

public class Course
{

    private int courseId;
    private String courseZhouyi;
    private String courseZhouer;
    private String courseZhousan;
    private String courseZhousi;
    private String courseZhouwu;
    private String courseJieci;
    private int teacherId;

    public Course(){

    }

    public Course(int courseId, String courseZhouyi, String courseZhouer, String courseZhousan, String courseZhousi, String courseZhouwu, String courseJieci, int teacherId) {
        this.courseId = courseId;
        this.courseZhouyi = courseZhouyi;
        this.courseZhouer = courseZhouer;
        this.courseZhousan = courseZhousan;
        this.courseZhousi = courseZhousi;
        this.courseZhouwu = courseZhouwu;
        this.courseJieci = courseJieci;
        this.teacherId = teacherId;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getCourseZhouyi() {
        return courseZhouyi;
    }

    public void setCourseZhouyi(String courseZhouyi) {
        this.courseZhouyi = courseZhouyi;
    }

    public String getCourseZhouer() {
        return courseZhouer;
    }

    public void setCourseZhouer(String courseZhouer) {
        this.courseZhouer = courseZhouer;
    }

    public String getCourseZhousan() {
        return courseZhousan;
    }

    public void setCourseZhousan(String courseZhousan) {
        this.courseZhousan = courseZhousan;
    }

    public String getCourseZhousi() {
        return courseZhousi;
    }

    public void setCourseZhousi(String courseZhousi) {
        this.courseZhousi = courseZhousi;
    }

    public String getCourseZhouwu() {
        return courseZhouwu;
    }

    public void setCourseZhouwu(String courseZhouwu) {
        this.courseZhouwu = courseZhouwu;
    }

    public String getCourseJieci() {
        return courseJieci;
    }

    public void setCourseJieci(String courseJieci) {
        this.courseJieci = courseJieci;
    }

    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    @Override
    public String toString() {
        return "Course{" +
                "courseId=" + courseId +
                ", courseZhouyi='" + courseZhouyi + '\'' +
                ", courseZhouer='" + courseZhouer + '\'' +
                ", courseZhousan='" + courseZhousan + '\'' +
                ", courseZhousi='" + courseZhousi + '\'' +
                ", courseZhouwu='" + courseZhouwu + '\'' +
                ", courseJieci='" + courseJieci + '\'' +
                ", teacherId=" + teacherId +
                '}';
    }
}
