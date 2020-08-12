package com.kindergarten.bean;

public class ReadmagPhoto {
    private int readmagId;
    private int readmagPhotoId;
    private String alt;//描述内容
    private int pid;//页码
    private String src;//图片路径
    private String thumb;

    public ReadmagPhoto() {
    }

    public int getReadmagId() {
        return readmagId;
    }

    public void setReadmagId(int readmagId) {
        this.readmagId = readmagId;
    }

    public int getReadmagPhotoId() {
        return readmagPhotoId;
    }

    public void setReadmagPhotoId(int readmagPhotoId) {
        this.readmagPhotoId = readmagPhotoId;
    }

    public String getAlt() {
        return alt;
    }

    public void setAlt(String alt) {
        this.alt = alt;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public String getThumb() {
        return thumb;
    }

    public void setThumb(String thumb) {
        this.thumb = thumb;
    }
}
