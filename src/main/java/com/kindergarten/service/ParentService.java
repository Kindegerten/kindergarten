package com.kindergarten.service;


import com.kindergarten.bean.*;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface ParentService {

    public Parents login(String tel);
    public LayuiData<CampusInfo> CampusInfo(int kinderId,int curPage, int pageSize);
    public LayuiData<PlatformInfo> PlatformInfo(int curPage, int pageSize);
    public List<Students> studentsList(int parentId);
    public  LayuiData<Examination> examination(int studentId);
    public  LayuiData<Monitor> monitors(int studentId);


}
