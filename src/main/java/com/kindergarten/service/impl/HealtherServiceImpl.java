package com.kindergarten.service.impl;

import com.kindergarten.bean.Examination;
import com.kindergarten.bean.Healther;
import com.kindergarten.bean.LayuiData;
import com.kindergarten.bean.Meal;
import com.kindergarten.mapper.HealtherMapper;
import com.kindergarten.service.HealtherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
@Transactional
@Service
public class HealtherServiceImpl implements HealtherService {
    @Autowired//注入相应mapper
            HealtherMapper healtherMapper;

    //保健员登录
    @Override
    public Healther login(String healtherPhone, String healtherPwd) {
        return healtherMapper.login(healtherPhone, healtherPwd);
    }

    //修改个人信息
    @Override
    public int updateSelf(Healther healther) {
        return healtherMapper.updateSelf(healther);
    }

    //体检列表
    @Override
    public LayuiData<Examination> bodyCheck(HashMap<String, Object> condition, int curPage, int pageSize) {
        LayuiData<Examination> layuiData = null;
        List<Examination> bodyChecklist = healtherMapper.bodyCheck(condition, curPage, pageSize);
        int totalRecord = healtherMapper.bodyCheckcount(condition);
        layuiData = new LayuiData<>(0, "", totalRecord, bodyChecklist);
        return layuiData;
    }

    //增加体检信息
    @Override
    public int addExamination(Examination examination) {
        return healtherMapper.addExamination(examination);
    }

    //更新体检信息
    @Override
    public int updateExamination(Examination examination) {
        return healtherMapper.updateExamination(examination);
    }

    //膳食列表
    @Override
    public LayuiData<Meal> meallist(int curPage, int pageSize) {
        LayuiData<Meal> layuiData = null;
        List<Meal> bodyChecklist = healtherMapper.meallist(curPage, pageSize);
        int totalRecord = healtherMapper.meallistcount();
        layuiData = new LayuiData<>(0, "", totalRecord, bodyChecklist);
        return layuiData;
    }

    //增加膳食
    @Override
    public int addmeal(Meal meal) {
        return healtherMapper.addmeal(meal);
    }

    //更新膳食
    @Override
    public int updatemeal(Meal meal) {
        return healtherMapper.updatemeal(meal);
    }

}
