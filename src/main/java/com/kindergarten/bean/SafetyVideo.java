package com.kindergarten.bean;

import java.util.Date;

public class SafetyVideo
{

    private int safetyVideoId;
    private String safetyVideoName;//视频名称
    private String videoName;//文件名称，例如 啊啊啊.MP4
    private Date safetyVideoTime;
    private String safetyVideoStar;
    private String safetyVideoEnd;
    private String videoAdd;//文件存储路径
    private  String safetyAnswer;
    public SafetyVideo(){}

    public SafetyVideo(int safetyVideoId, String safetyVideoName) {
        this.safetyVideoId = safetyVideoId;
        this.safetyVideoName = safetyVideoName;
    }

    public String getSafetyAnswer() {
        return safetyAnswer;
    }

    public void setSafetyAnswer(String safetyAnswer) {
        this.safetyAnswer = safetyAnswer;
    }

    public String getVideoName() {
        return videoName;
    }

    public void setVideoName(String videoName) {
        this.videoName = videoName;
    }

    public Date getSafetyVideoTime() {
        return safetyVideoTime;
    }

    public void setSafetyVideoTime(Date safetyVideoTime) {
        this.safetyVideoTime = safetyVideoTime;
    }

    public String getSafetyVideoStar() {
        return safetyVideoStar;
    }

    public void setSafetyVideoStar(String safetyVideoStar) {
        this.safetyVideoStar = safetyVideoStar;
    }

    public String getSafetyVideoEnd() {
        return safetyVideoEnd;
    }

    public void setSafetyVideoEnd(String safetyVideoEnd) {
        this.safetyVideoEnd = safetyVideoEnd;
    }

    public String getVideoAdd() {
        return videoAdd;
    }

    public void setVideoAdd(String videoAdd) {
        this.videoAdd = videoAdd;
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

    @Override
    public String toString() {
        return "SafetyVideo{" +
                "safetyVideoId=" + safetyVideoId +
                ", safetyVideoName='" + safetyVideoName + '\'' +
                '}';
    }
}
