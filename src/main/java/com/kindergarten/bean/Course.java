package com.kindergarten.bean;

public class Course
{

    private int courseId;
    private String courseName;
    private int courseWeek;
    private int courseJieci;
    private String courseBanji;
    private int teacherId;
    private String courseZhouyi;
    private String courseZhouer;
    private String courseZhousan;
    private String courseZhousi;
    private String courseZhouwu;
    private String courseTimescope;
    public Course(){

    }

    public Course(int courseId, String courseName, int courseWeek, int courseJieci, String courseBanji, int teacherId, String courseZhouyi, String courseZhouer, String courseZhousan, String courseZhousi, String courseZhouwu, String courseTimescope) {
        this.courseId = courseId;
        this.courseName = courseName;
        this.courseWeek = courseWeek;
        this.courseJieci = courseJieci;
        this.courseBanji = courseBanji;
        this.teacherId = teacherId;
        this.courseZhouyi = courseZhouyi;
        this.courseZhouer = courseZhouer;
        this.courseZhousan = courseZhousan;
        this.courseZhousi = courseZhousi;
        this.courseZhouwu = courseZhouwu;
        this.courseTimescope = courseTimescope;
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

    public String getCourseTimescope() {
        return courseTimescope;
    }

    public void setCourseTimescope(String courseTimescope) {
        this.courseTimescope = courseTimescope;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public int getCourseWeek() {
        return courseWeek;
    }

    public void setCourseWeek(int courseWeek) {
        this.courseWeek = courseWeek;
    }

    public int getCourseJieci() {
        return courseJieci;
    }

    public void setCourseJieci(int courseJieci) {
        this.courseJieci = courseJieci;
    }

    public String getCourseBanji() {
        return courseBanji;
    }

    public void setCourseBanji(String courseBanji) {
        this.courseBanji = courseBanji;
    }

    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    @Override
    public String toString() {
        return "TblCourse{" +
                "courseId=" + courseId +
                ", courseName='" + courseName + '\'' +
                ", courseWeek=" + courseWeek +
                ", courseJieci=" + courseJieci +
                ", courseBanji='" + courseBanji + '\'' +
                ", teacherId=" + teacherId +
                '}';
    }
}
