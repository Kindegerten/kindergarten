package com.kindergarten.bean;

public class Location {

    private String studentName,studentId;
    private double lng,lat;

    public Location() {
    }

    public Location(String studentName, String studentId, double lng, double lat) {
        this.studentName = studentName;
        this.studentId = studentId;
        this.lng = lng;
        this.lat = lat;
    }

    @Override
    public String toString() {
        return "Location{" +
                "studentName='" + studentName + '\'' +
                ", studentId='" + studentId + '\'' +
                ", lng=" + lng +
                ", lat=" + lat +
                '}';
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public double getLng() {
        return lng;
    }

    public void setLng(double lng) {
        this.lng = lng;
    }

    public double getLat() {
        return lat;
    }

    public void setLat(double lat) {
        this.lat = lat;
    }
}
