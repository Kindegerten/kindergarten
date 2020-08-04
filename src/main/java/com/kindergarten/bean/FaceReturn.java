package com.kindergarten.bean;

import java.util.List;

public class FaceReturn {

    private String face_token;  //人脸图片的唯一标识
    private List<FaceUserList> user_list;   //用户组信息
    private String log_id;  //请求标识码，随机数，唯一
    private List<FaceLocation> location;    //人脸在图片中的位置
    private int error_code;
    private String error_msg;

    public FaceReturn() {
    }

    public FaceReturn(String face_token, List<FaceUserList> user_list, String log_id, List<FaceLocation> location, int error_code, String error_msg) {
        this.face_token = face_token;
        this.user_list = user_list;
        this.log_id = log_id;
        this.location = location;
        this.error_code = error_code;
        this.error_msg = error_msg;
    }

    @Override
    public String toString() {
        return "FaceReturn{" +
                "face_token='" + face_token + '\'' +
                ", user_list=" + user_list +
                ", log_id='" + log_id + '\'' +
                ", location=" + location +
                ", error_code=" + error_code +
                ", error_msg='" + error_msg + '\'' +
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

    public String getLog_id() {
        return log_id;
    }

    public void setLog_id(String log_id) {
        this.log_id = log_id;
    }

    public List<FaceLocation> getLocation() {
        return location;
    }

    public void setLocation(List<FaceLocation> location) {
        this.location = location;
    }

    public int getError_code() {
        return error_code;
    }

    public void setError_code(int error_code) {
        this.error_code = error_code;
    }

    public String getError_msg() {
        return error_msg;
    }

    public void setError_msg(String error_msg) {
        this.error_msg = error_msg;
    }
}
