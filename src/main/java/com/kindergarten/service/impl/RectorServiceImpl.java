package com.kindergarten.service.impl;

import com.kindergarten.bean.*;
import com.kindergarten.mapper.RectorMapper;
import com.kindergarten.service.RectorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class RectorServiceImpl implements RectorService {
    @Autowired
    RectorMapper rectorMapper;
//登录
    @Override
    public Rector login(String rectorTel,String rectorPwd) {
        return rectorMapper.login(rectorTel, rectorPwd);
    }
   //更新个人信息
    @Override
    public int updateSelf(Rector rector) {
        return rectorMapper.updateSelf(rector);
    }
    //园所资格审批
    @Override
    public int  addKinder(Kinder kinder) {
        return rectorMapper.addKinder(kinder);
    }
    //教职工列表
    @Override
    public LayuiData<Staffs> stafflist(HashMap<String, Object> condition, int curPage, int pageSize) {
        LayuiData<Staffs> layuiData = null;
        List<Staffs> stafflist = rectorMapper.stafflist(condition, curPage, pageSize);
        int totalRecord = rectorMapper.staffcount(condition);
        layuiData = new LayuiData<>(0,"",totalRecord,stafflist);
        return layuiData;
    }

    @Override
    public int deleteStaff(String tableName,String tableId,int teacherid) {
        return rectorMapper.deleteStaff(tableName,tableId,teacherid);
    }

    @Override
    public int addStaffs(String tableName,String column1,String column2,String column3,String teacherName,int roleid,String telphone) {
        return rectorMapper.addStaffs(tableName,column1,column2,column2,teacherName,roleid,telphone);
    }
    //查询新增教职工
    @Override
    public Staffs checkNewStaff(String tableName,String column3,String telphone){
        return rectorMapper.checkNewStaff(tableName,column3,telphone);
    }
//
//    @Override
//    public int addExamination(Examination examination) {
//        return healtherMapper.addExamination(examination);
//    }
//
//    @Override
//    public int updateExamination(Examination examination) {
//        return healtherMapper.updateExamination(examination);
//    }
//
//    @Override
//    public LayuiData<Meal> meallist(int curPage, int pageSize) {
//        LayuiData<Meal> layuiData = null;
//        List<Meal> bodyChecklist = healtherMapper.meallist(curPage, pageSize);
//        int totalRecord = healtherMapper.meallistcount();
//        layuiData = new LayuiData<>(0,"",totalRecord,bodyChecklist);
//        return layuiData;
//    }
//
//    @Override
//    public int addmeal(Meal meal) {
//        return healtherMapper.addmeal(meal);
//    }
//
//    @Override
//    public int updatemeal(Meal meal) {
//        return healtherMapper.updatemeal(meal);
//    }


}
