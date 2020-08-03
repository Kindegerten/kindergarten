package com.kindergarten.service;

import com.kindergarten.bean.Examination;
import com.kindergarten.bean.Healther;
import com.kindergarten.bean.LayuiData;
import com.kindergarten.bean.Meal;

import java.util.HashMap;

public interface HealtherService {
    Healther login(String healtherPhone, String healtherPwd);
    //体检列表
     LayuiData<Examination> bodyCheck(HashMap<String, Object> condition, int curPage, int pageSize);
     //新增体检情况
    int addExamination(Examination examination);
// 修改体检情况
    int updateExamination(Examination examination);
//膳食管理列表
    LayuiData<Meal> meallist(int curPage, int pageSize);
//添加膳食信息
    int addmeal(Meal meal);
//更新膳食信息
    int updatemeal(Meal meal);
}
