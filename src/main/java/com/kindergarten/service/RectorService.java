package com.kindergarten.service;

import com.kindergarten.bean.*;

import java.util.HashMap;

public interface RectorService {
    //登录
    Rector login(String rectorTel, String rectorPwd);

    //修改个人信息
    int updateSelf(Rector rector);

    //院所资格提交审批
    int addKinder(Kinder kinder);

    //教职工列表
    LayuiData<Staffs> stafflist(HashMap<String, Object> condition, int curPage, int pageSize);

  //删除教职工
    int deleteStaff( String tableName,String tableId,int teacherid);
}
