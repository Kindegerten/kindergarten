package com.kindergarten.bean;

import java.util.Date;

public class Photo
{

    private int photoId;
    private String photoName;
    private String photoDetail;
    private String photoUrl;
    private String photoTime;
    private int classId;

    public Photo(){
    }

    public Photo(int photoId, String photoName, String photoDetail, String photoUrl, String photoTime, int classId) {
        this.photoId = photoId;
        this.photoName = photoName;
        this.photoDetail = photoDetail;
        this.photoUrl = photoUrl;
        this.photoTime = photoTime;
        this.classId = classId;
    }

    public int getPhotoId() {
        return photoId;
    }

    public void setPhotoId(int photoId) {
        this.photoId = photoId;
    }

    public String getPhotoName() {
        return photoName;
    }

    public void setPhotoName(String photoName) {
        this.photoName = photoName;
    }

    public String getPhotoDetail() {
        return photoDetail;
    }

    public void setPhotoDetail(String photoDetail) {
        this.photoDetail = photoDetail;
    }

    public String getPhotoUrl() {
        return photoUrl;
    }

    public void setPhotoUrl(String photoUrl) {
        this.photoUrl = photoUrl;
    }

    public String getPhotoTime() {
        return photoTime;
    }

    public void setPhotoTime(String photoTime) {
        this.photoTime = photoTime;
    }

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    @Override
    public String toString() {
        return "Photo{" +
                "photoId=" + photoId +
                ", photoName='" + photoName + '\'' +
                ", photoDetail='" + photoDetail + '\'' +
                ", photoUrl='" + photoUrl + '\'' +
                ", photoTime='" + photoTime + '\'' +
                ", classId=" + classId +
                '}';
    }
}
