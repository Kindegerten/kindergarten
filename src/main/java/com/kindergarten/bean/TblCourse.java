package com.kindergarten.bean;

public class TblCourse
{

    private int courseId;
    private String courseName;
    private int courseWeek;
    private int courseJieci;
    private String courseBanji;
    private int teacherId;

    public TblCourse(){

    }

    public TblCourse(int courseId, String courseName, int courseWeek, int courseJieci, String courseBanji, int teacherId) {
        this.courseId = courseId;
        this.courseName = courseName;
        this.courseWeek = courseWeek;
        this.courseJieci = courseJieci;
        this.courseBanji = courseBanji;
        this.teacherId = teacherId;
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
