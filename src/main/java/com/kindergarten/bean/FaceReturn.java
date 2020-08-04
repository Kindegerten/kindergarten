package com.kindergarten.bean;

import java.util.List;

public class FaceReturn {

    private String face_token;
    private List<FaceUserList> user_list;

    public FaceReturn() {
    }

    public FaceReturn(String face_token, List<FaceUserList> user_list) {
        this.face_token = face_token;
        this.user_list = user_list;
    }

    @Override
    public String toString() {
        return "FaceReturn{" +
                "face_token='" + face_token + '\'' +
                ", user_list=" + user_list +
                '}';
    }

    public String getFace_token() {
        return face_token;
    }

    public void setFace_token(String face_token) {
        this.face_token = face_token;
    }

    public List<FaceUserList> getUser_list() {
        return user_list;
    }

    public void setUser_list(List<FaceUserList> user_list) {
        this.user_list = user_list;
    }
}
