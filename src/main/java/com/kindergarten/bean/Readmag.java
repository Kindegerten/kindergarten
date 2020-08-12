package com.kindergarten.bean;

public class Readmag {
    private int readmagId;
    private String readmagName;//绘本名称
    private String readmagTime;//绘本上传时间
    private String readmagDocumentUrl;//绘本路径
    private String readmagPic;//封面图片路径

    public Readmag() {
    }

    public int getReadmagId() {
        return readmagId;
    }

    public void setReadmagId(int readmagId) {
        this.readmagId = readmagId;
    }

    public String getReadmagName() {
        return readmagName;
    }

    public void setReadmagName(String readmagName) {
        this.readmagName = readmagName;
    }

    public String getReadmagTime() {
        return readmagTime;
    }

    public void setReadmagTime(String readmagTime) {
        this.readmagTime = readmagTime;
    }

    public String getReadmagDocumentUrl() {
        return readmagDocumentUrl;
    }

    public void setReadmagDocumentUrl(String readmagDocumentUrl) {
        this.readmagDocumentUrl = readmagDocumentUrl;
    }

    public String getReadmagPic() {
        return readmagPic;
    }

    public void setReadmagPic(String readmagPic) {
        this.readmagPic = readmagPic;
    }
}
