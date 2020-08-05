package com.kindergarten.mapper;


import com.kindergarten.bean.Kinder;
import com.kindergarten.bean.Rector;
import com.kindergarten.bean.Staffs;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface RectorMapper {
    //登录
    Rector login(String rectorTel, String rectorPwd);

    //修改个人信息
    int updateSelf(Rector rector);

    //园所提交审批
    int addKinder(Kinder kinder);

    //教职工列表
    List<Staffs> stafflist(@Param("condition") HashMap<String, Object> condition, @Param("curPage") int curPage, @Param("pageSize") int pageSize);

    //教职工列表总条数
    int staffcount(HashMap<String, Object> condition);

    //删除教职工
    int deleteStaff(@Param("tableName")String tableName,@Param("tableId")String tableId,@Param("teacherid")int teacherid);
}
