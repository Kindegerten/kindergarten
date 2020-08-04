package com.kindergarten.bean;

public class ParentShowSafeQue {
    private int safetyVideoId;
    private String safetyVideoName;
    private String safetyVideoStar;
    private String videoAdd;


    private String safetyTestScore="0";
    private String safetyTestResult="未完成";

    public ParentShowSafeQue(int safetyVideoId, String safetyVideoName, String safetyVideoStar, String videoAdd, String safetyTestScore, String safetyTestResult) {
        this.safetyVideoId = safetyVideoId;
        this.safetyVideoName = safetyVideoName;
        this.safetyVideoStar = safetyVideoStar;
        this.videoAdd = videoAdd;
        this.safetyTestScore = safetyTestScore;
        this.safetyTestResult = safetyTestResult;
    }

    public ParentShowSafeQue() {
    }


    public String getSafetyTestScore() {
        return safetyTestScore;
    }

    public void setSafetyTestScore(String safetyTestScore) {
        this.safetyTestScore = safetyTestScore;
    }

    public int getSafetyVideoId() {
        return safetyVideoId;
    }

    public void setSafetyVideoId(int safetyVideoId) {
        this.safetyVideoId = safetyVideoId;
    }

    public String getSafetyVideoName() {
        return safetyVideoName;
    }

    public void setSafetyVideoName(String safetyVideoName) {
        this.safetyVideoName = safetyVideoName;
    }

    public String getSafetyVideoStar() {
        return safetyVideoStar;
    }

    public void setSafetyVideoStar(String safetyVideoStar) {
        this.safetyVideoStar = safetyVideoStar;
    }

    public String getVideoAdd() {
        return videoAdd;
    }

    public void setVideoAdd(String videoAdd) {
        this.videoAdd = videoAdd;
    }



    public String getSafetyTestResult() {
        return safetyTestResult;
    }

    public void setSafetyTestResult(String safetyTestResult) {
        this.safetyTestResult = safetyTestResult;
    }
}
