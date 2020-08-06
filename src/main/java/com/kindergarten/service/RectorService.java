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
   //添加教职工
    int addStaffs(String tableName,String column1,String column2,String column3,String teacherName,int roleid,String telphone);
    //查询新增教职工
    Staffs checkNewStaff(String tableName,String column3,String telphone);









}
