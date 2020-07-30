package com.kindergarten.bean;



public class Parents {
   private String parentsTel;
   private String parentsName;
   private String parentsSex;
   private int parentsStatus;
   private String parentsPwd;
   private int roleID;




   private String roleName;


    public Parents(String parentsTel, String parentsName, String parentsSex, int parentsStatus, String parentsPwd, int roleID, String roleName) {
        this.parentsTel = parentsTel;
        this.parentsName = parentsName;
        this.parentsSex = parentsSex;
        this.parentsStatus = parentsStatus;
        this.parentsPwd = parentsPwd;
        this.roleID = roleID;
        this.roleName = roleName;
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

    public Parents() {
    }

    public String getParentsPwd() {
        return parentsPwd;
    }

    public void setParentsPwd(String parentsPwd) {
        this.parentsPwd = parentsPwd;
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

    @Override
    public String toString() {
        return "Parents{" +
                "parentsTel='" + parentsTel + '\'' +
                ", parentsName='" + parentsName + '\'' +
                ", parentsSex='" + parentsSex + '\'' +
                ", parentsStatus=" + parentsStatus +
                ", parentsPwd='" + parentsPwd + '\'' +
                ", roleID=" + roleID +
                ", roleName='" + roleName + '\'' +
                '}';
    }
}
