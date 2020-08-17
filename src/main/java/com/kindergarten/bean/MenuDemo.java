package com.kindergarten.bean;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MenuDemo {
    private int regionId; //当前菜单id
    private int regionPid;  //父id
    private String regionName;//菜单名
    private int region_type;
    private List<Map<Integer,Object>>_child;

    public MenuDemo() {
    }

    public MenuDemo(int regionId, int regionPid, String regionName, List<Map<Integer, Object>> _child) {
        this.regionId = regionId;
        this.regionPid = regionPid;
        this.regionName = regionName;
        this._child = _child;
    }

    public int getRegion_type() {
        return region_type;
    }

    public void setRegion_type(int region_type) {
        this.region_type = region_type;
    }

    public int getRegionId() {
        return regionId;
    }

    public void setRegionId(int regionId) {
        this.regionId = regionId;
    }

    public int getRegionPid() {
        return regionPid;
    }

    public void setRegionPid(int regionPid) {
        this.regionPid = regionPid;
    }

    public String getRegionName() {
        return regionName;
    }

    public void setRegionName(String regionName) {
        this.regionName = regionName;
    }

    public List<Map<Integer, Object>> get_child() {
        return _child;
    }

    public void set_child(List<Map<Integer, Object>> _child) {
        this._child = _child;
    }

    @Override
    public String toString() {
        return "MenuDemo{" +
                "regionId=" + regionId +
                ", regionPid=" + regionPid +
                ", regionName='" + regionName + '\'' +
                ", _child=" + _child +
                '}';
    }
}
