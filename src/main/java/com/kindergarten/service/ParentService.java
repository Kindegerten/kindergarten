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
    public  LayuiData<Examination> examination(int studentId,int curPage, int pageSize);
    public  LayuiData<Monitor> monitors(int studentId,int curPage, int pageSize);
    public PageBean<Meal> meals(int studentId,int curPage, int pageSize);
    public LayuiData<Workrelease> studentWork(int studentId,int curPage, int pageSize);

    public LayuiData<ParentShowSafeQue> AllSafeEducation(int studentId,int curPage, int pageSize);

    public ReadmagData<ReadmagPhoto> AllPitcures(String photoTitle,int readMagId);

    public PageBean<Readmag> ParentRead(int curPage, int pageSize);

    public LayuiData<StuAttendance> stuAttendance(int studentId,int curPage, int pageSize);

    public LayuiData<SchoolBill> Mybills(int studentId,int curPage, int pageSize);
}
