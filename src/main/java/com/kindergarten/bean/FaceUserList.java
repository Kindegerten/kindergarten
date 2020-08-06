package com.kindergarten.bean;

public class FaceUserList {

    private String group_id,user_id,user_info,photo_url;
    private Double score;

    public FaceUserList() {
    }

    public FaceUserList(String group_id, String user_id, String user_info, Double score) {
        this.group_id = group_id;
        this.user_id = user_id;
        this.user_info = user_info;
        this.score = score;
    }

    public FaceUserList(String group_id, String user_id, String user_info, String photo_url, Double score) {
        this.group_id = group_id;
        this.user_id = user_id;
        this.user_info = user_info;
        this.photo_url = photo_url;
        this.score = score;
    }

    @Override
    public String toString() {
        return "FaceUserList{" +
                "group_id='" + group_id + '\'' +
                ", user_id='" + user_id + '\'' +
                ", user_info='" + user_info + '\'' +
                ", score=" + score +
                '}';
    }

    public String getGroup_id() {
        return group_id;
    }

    public void setGroup_id(String group_id) {
        this.group_id = group_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_info() {
        return user_info;
    }

    public void setUser_info(String user_info) {
        this.user_info = user_info;
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

    public String getPhoto_url() {
        return photo_url;
    }

    public void setPhoto_url(String photo_url) {
        this.photo_url = photo_url;
    }
}
