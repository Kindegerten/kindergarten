package com.kindergarten.bean;

public class FaceLocation {

    private String rotation;    //人脸框相对于竖直方向的顺时针旋转角，[-180,180]
    private double left,top,width,height;

    public FaceLocation(String rotation, double left, double top, double width, double height) {
        this.rotation = rotation;
        this.left = left;
        this.top = top;
        this.width = width;
        this.height = height;
    }

    public FaceLocation() {
    }

    @Override
    public String toString() {
        return "FaceLocation{" +
                "rotation='" + rotation + '\'' +
                ", left=" + left +
                ", top=" + top +
                ", width=" + width +
                ", height=" + height +
                '}';
    }

    public String getRotation() {
        return rotation;
    }

    public void setRotation(String rotation) {
        this.rotation = rotation;
    }

    public double getLeft() {
        return left;
    }

    public void setLeft(double left) {
        this.left = left;
    }

    public double getTop() {
        return top;
    }

    public void setTop(double top) {
        this.top = top;
    }

    public double getWidth() {
        return width;
    }

    public void setWidth(double width) {
        this.width = width;
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }
}
