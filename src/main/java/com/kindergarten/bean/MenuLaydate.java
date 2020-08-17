package com.kindergarten.bean;

import java.util.HashMap;

public class MenuLaydate {
    private int code;
    private String msg;
    private HashMap<String, HashMap<Integer,MenuDemoTwo>>data;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public HashMap<String, HashMap<Integer, MenuDemoTwo>> getData() {
        return data;
    }

    public void setData(HashMap<String, HashMap<Integer, MenuDemoTwo>> data) {
        this.data = data;
    }
}
