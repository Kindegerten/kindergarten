package com.kindergarten.bean;

public class Meal {
    private int mealId;
    private String mealType;
    private String mealDatescope;
    private String monday;
    private String tuesday;
    private String wednesday;
    private String thursday;
    private String friday;

    public Meal() {
    }

    public Meal(int mealId, String mealType, String mealDatescope, String monday, String tuesday, String wednesday, String thursday, String friday) {
        this.mealId = mealId;
        this.mealType = mealType;
        this.mealDatescope = mealDatescope;
        this.monday = monday;
        this.tuesday = tuesday;
        this.wednesday = wednesday;
        this.thursday = thursday;
        this.friday = friday;

    }

    public int getMealId() {
        return mealId;
    }

    public void setMealId(int mealId) {
        this.mealId = mealId;
    }

    public String getMealType() {
        return mealType;
    }

    public void setMealType(String mealType) {
        this.mealType = mealType;
    }

    public String getMealDatescope() {
        return mealDatescope;
    }

    public void setMealDatescope(String mealDatescope) {
        this.mealDatescope = mealDatescope;
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
    @Override
    public String toString() {
        return mealDatescope;
    }

}
