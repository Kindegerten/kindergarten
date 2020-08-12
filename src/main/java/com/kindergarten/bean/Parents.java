package com.kindergarten.bean;



public class Parents {
   private int parentsId;
    private String parentsTel;
   private String parentsName;
   private String parentsSex;
   private int parentsStatus;
   private String parentsPwd;
    private String job;
    private String parentsRegtime;
   private int roleID;
   private int kinderId;

   private String roleName;


    public Parents() {
    }

    public Parents(int parentsId, String parentsTel, String parentsName, String parentsSex, int parentsStatus, String parentsPwd, String job, String parentsRegtime, int roleID, int kinderId, String roleName) {
        this.parentsId = parentsId;
        this.parentsTel = parentsTel;
        this.parentsName = parentsName;
        this.parentsSex = parentsSex;
        this.parentsStatus = parentsStatus;
        this.parentsPwd = parentsPwd;
        this.job = job;
        this.parentsRegtime = parentsRegtime;
        this.roleID = roleID;
        this.kinderId = kinderId;
        this.roleName = roleName;
    }

    public int getKinderId() {
        return kinderId;
    }

    public void setKinderId(int kinderId) {
        this.kinderId = kinderId;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getParentsRegtime() {
        return parentsRegtime;
    }

    public void setParentsRegtime(String parentsRegtime) {
        this.parentsRegtime = parentsRegtime;
    }

    public String getParentsTel() {
        return parentsTel;
    }

    public void setParentsTel(String parentsTel) {
        this.parentsTel = parentsTel;
    }

    public String getParentsName() {
        return parentsName;
    }

    public void setParentsName(String parentsName) {
        this.parentsName = parentsName;
    }

    public String getParentsSex() {
        return parentsSex;
    }

    public void setParentsSex(String parentsSex) {
        this.parentsSex = parentsSex;
    }

    public int getParentsStatus() {
        return parentsStatus;
    }

    public void setParentsStatus(int parentsStatus) {
        this.parentsStatus = parentsStatus;
    }

    public String getParentsPwd() {
        return parentsPwd;
    }

    public void setParentsPwd(String parentsPwd) {
        this.parentsPwd = parentsPwd;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public int getParentsId() {
        return parentsId;
    }

    public void setParentsId(int parentsId) {
        this.parentsId = parentsId;
    }


}
