package com.kindergarten.mapper;

import com.kindergarten.bean.Examination;
import com.kindergarten.bean.Healther;
import com.kindergarten.bean.Meal;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;


@Mapper
public interface HealtherMapper {
    //登录
    Healther login(String healtherPhone, String healtherPwd);

    //体检列表
    List<Examination> bodyCheck(@Param("condition") HashMap<String, Object> condition, @Param("curPage") int curPage, @Param("pageSize") int pageSize);
    //体检列表数据总条数
    int bodyCheckcount(HashMap<String, Object> condition);

    //添加体检信息
    int addExamination(Examination examination);

    //修改体检信息
    int updateExamination(Examination examination);

    //膳食列表
    List<Meal> meallist(int curPage, int pageSize);

    //膳食列表数据总条数
    int meallistcount();

    //增加膳食信息
    int addmeal(Meal meal);

    //修改膳食信息
    int updatemeal(Meal meal);


}
