package com.kindergarten.bean;

public class AlertInfo {

    private int alertId,studentId;
    private String alert,studentName;//报警时间，名字
    private double lng,lat;//经度，纬度
    private String startDate,endDate;//其实日期，结束日期

    public AlertInfo() {
    }

    public AlertInfo(int alertId, int studentId, String alert, String studentName, double lng, double lat) {
        this.alertId = alertId;
        this.studentId = studentId;
        this.alert = alert;
        this.studentName = studentName;
        this.lng = lng;
        this.lat = lat;
    }

    public AlertInfo(int alertId, int studentId, String alert, String studentName, double lng, double lat, String startDate, String endDate) {
        this.alertId = alertId;
        this.studentId = studentId;
        this.alert = alert;
        this.studentName = studentName;
        this.lng = lng;
        this.lat = lat;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    @Override
    public String toString() {
        return "AlertInfo{" +
                "alertId=" + alertId +
                ", studentId=" + studentId +
                ", alert='" + alert + '\'' +
                ", studentName='" + studentName + '\'' +
                ", lng=" + lng +
                ", lat=" + lat +
                '}';
    }

    public int getAlertId() {
        return alertId;
    }

    public void setAlertId(int alertId) {
        this.alertId = alertId;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getAlert() {
        return alert;
    }

    public void setAlert(String alert) {
        this.alert = alert;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
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

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }
}
