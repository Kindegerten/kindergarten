package com.kindergarten.bean;

public class staffAttendance {
    private int saId;
    private String saType;
    private String saStaffname;
    private String saRolename;
    private String saTimescope;
    private int kinderId;
    private String monday;
    private String tuesday;
    private String wednesday;
    private String thursday;
    private String friday;
    private String staffId;

    public staffAttendance() {
    }

    public staffAttendance(int saId, String saType, String saStaffname, String saRolename, String saTimescope, int kinderId, String monday, String tuesday, String wednesday, String thursday, String friday,String staffId) {
        this.saId = saId;
        this.saType = saType;
        this.saStaffname = saStaffname;
        this.saRolename = saRolename;
        this.saTimescope = saTimescope;
        this.kinderId = kinderId;
        this.monday = monday;
        this.tuesday = tuesday;
        this.wednesday = wednesday;
        this.thursday = thursday;
        this.friday = friday;
        this.staffId = staffId;
    }

    public String getStaffId() {
        return staffId;
    }

    public void setStaffId(String staffId) {
        this.staffId = staffId;
    }

    public int getSaId() {
        return saId;
    }

    public void setSaId(int saId) {
        this.saId = saId;
    }

    public String getSaType() {
        return saType;
    }

    public void setSaType(String saType) {
        this.saType = saType;
    }

    public String getSaStaffname() {
        return saStaffname;
    }

    public void setSaStaffname(String saStaffname) {
        this.saStaffname = saStaffname;
    }

    public String getSaRolename() {
        return saRolename;
    }

    public void setSaRolename(String saRolename) {
        this.saRolename = saRolename;
    }

    public String getSaTimescope() {
        return saTimescope;
    }

    public void setSaTimescope(String saTimescope) {
        this.saTimescope = saTimescope;
    }

    public int getKinderId() {
        return kinderId;
    }

    public void setKinderId(int kinderId) {
        this.kinderId = kinderId;
    }

    public String getMonday() {
        return monday;
    }

    public void setMonday(String monday) {
        this.monday = monday;
    }

    public String getTuesday() {
        return tuesday;
    }

    public void setTuesday(String tuesday) {
        this.tuesday = tuesday;
    }

    public String getWednesday() {
        return wednesday;
    }

    public void setWednesday(String wednesday) {
        this.wednesday = wednesday;
    }

    public String getThursday() {
        return thursday;
    }

    public void setThursday(String thursday) {
        this.thursday = thursday;
    }

    public String getFriday() {
        return friday;
    }

    public void setFriday(String friday) {
        this.friday = friday;
    }
}
