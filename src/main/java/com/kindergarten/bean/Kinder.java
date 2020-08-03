package com.kindergarten.bean;

public class Kinder {
    private int kinderId;
    private String kinderName;
    private String kinderLp;
    private String kinderLpid;
    private String kinderLpadd;
    private String kinderLptel;
    private String schoolpermit;
    private String healthpermit;
    private String firepermit;
    private String grouppermit;
    private String registrationpermit;
    private String kinderState;

    public Kinder() {
    }

    public Kinder(int kinderId, String kinderName, String kinderLp, String kinderLpid, String kinderLpadd, String kinderLptel, String schoolpermit, String healthpermit, String firepermit, String grouppermit, String registrationpermit, String kinderState) {
        this.kinderId = kinderId;
        this.kinderName = kinderName;
        this.kinderLp = kinderLp;
        this.kinderLpid = kinderLpid;
        this.kinderLpadd = kinderLpadd;
        this.kinderLptel = kinderLptel;
        this.schoolpermit = schoolpermit;
        this.healthpermit = healthpermit;
        this.firepermit = firepermit;
        this.grouppermit = grouppermit;
        this.registrationpermit = registrationpermit;
        this.kinderState = kinderState;
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

    public String getKinderLp() {
        return kinderLp;
    }

    public void setKinderLp(String kinderLp) {
        this.kinderLp = kinderLp;
    }

    public String getKinderLpid() {
        return kinderLpid;
    }

    public void setKinderLpid(String kinderLpid) {
        this.kinderLpid = kinderLpid;
    }

    public String getKinderLpadd() {
        return kinderLpadd;
    }

    public void setKinderLpadd(String kinderLpadd) {
        this.kinderLpadd = kinderLpadd;
    }

    public String getKinderLptel() {
        return kinderLptel;
    }

    public void setKinderLptel(String kinderLptel) {
        this.kinderLptel = kinderLptel;
    }

    public String getSchoolpermit() {
        return schoolpermit;
    }

    public void setSchoolpermit(String schoolpermit) {
        this.schoolpermit = schoolpermit;
    }

    public String getHealthpermit() {
        return healthpermit;
    }

    public void setHealthpermit(String healthpermit) {
        this.healthpermit = healthpermit;
    }

    public String getFirepermit() {
        return firepermit;
    }

    public void setFirepermit(String firepermit) {
        this.firepermit = firepermit;
    }

    public String getGrouppermit() {
        return grouppermit;
    }

    public void setGrouppermit(String grouppermit) {
        this.grouppermit = grouppermit;
    }

    public String getRegistrationpermit() {
        return registrationpermit;
    }

    public void setRegistrationpermit(String registrationpermit) {
        this.registrationpermit = registrationpermit;
    }

    public String getKinderState() {
        return kinderState;
    }

    public void setKinderState(String kinderState) {
        this.kinderState = kinderState;
    }
}
