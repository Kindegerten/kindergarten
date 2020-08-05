package com.kindergarten.bean;

import java.util.List;

public class ReadmagData<T> {
    private String title;
    private int id;
    private int start;
    private List<T> data;


    public ReadmagData() {
    }

    public ReadmagData(String title, int id, int start, List<T> data) {
        this.title = title;
        this.id = id;
        this.start = start;
        this.data = data;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }
}
