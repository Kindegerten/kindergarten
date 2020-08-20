package com.kindergarten.service;

import com.kindergarten.bean.*;

import java.util.HashMap;
import java.util.List;

public interface RectorService {
    //登录
    Rector login(String rectorTel, String rectorPwd);

    //找到园长管理的班级
    List<Classes> findClasses(int kid);

    //修改个人信息
    int updateSelf(Rector rector);

    //院所资格提交审批
    int addKinder(Kinder kinder);

    //教职工列表
    LayuiData<Staffs> stafflist(HashMap<String, Object> condition, int curPage, int pageSize);

    //删除教职工
    int deleteStaff(String tableName, String tableId, int teacherid);

    //添加教职工
    int addStaffs(String tableName, String column1, String column2, String column3, String column4, String teacherName, int roleid, String telphone, int kinderid);

    //查询新增教职工
    Staffs checkNewStaff(String tableName, String column3, String telphone);

    //幼儿列表
    LayuiData<Students> studentlist(HashMap<String, Object> condition, int curPage, int pageSize);

    //增加幼儿
    int addBaby(Students students);

    //修改幼儿
    int updateBaby(Students students);

    //删除幼儿
    int deleteStudent(String studentId);

    //家长列表
    LayuiData<parentsinfo> parentsList(HashMap<String, Object> condition, int curPage, int pageSize);

    //修改家长及关系表信息
    int updateParents(parentsinfo parentsinfo);

    //删除家长及关系表信息
    int deleteParents(String parentsId);

    //增加家长及相应关系表信息
    int addParents(parentsinfo parentsinfo);

    //检测学生是否存在
    List<Students> checkStudent(String studentName);

    //教师考勤管理列表
    LayuiData<staffAttendance> attendanceList(HashMap<String, Object> condition, int curPage, int pageSize);

    //考勤详情表
    LayuiData<staffAttendance> findAttendance(HashMap<String, Object> condition, int curPage, int pageSize);

    //班级列表
    LayuiData<Classes> classList(HashMap<String, Object> condition, int curPage, int pageSize);

    //检测教师是否存在
    List<Teachers> checkTeacher(String teacherName);

    //增加班级
    int addClasses(Classes classes);

    //修改班级信息
    int updateClass(Classes classes);

    //删除班级信息
    int deleteClass(String classId);

    //详细课程表
    LayuiData<Course> findCourse(HashMap<String, Object> condition, int curPage, int pageSize);

    //班级成员列表
    LayuiData<ClassMember> classMemberList(HashMap<String, Object> condition, int curPage, int pageSize);

    //校园公告列表
    LayuiData<CampusInfo> campusNewsList(HashMap<String, Object> condition, int curPage, int pageSize);

    //增加公告
    int addNews(CampusInfo campusInfo);

    //修改公告
    int updateNews(CampusInfo campusInfo);

    //删除公告
    int deleteNews(String campusInfoId);
    //增加通知
    int addInform(Inform inform);


    //账单列表
    LayuiData<SchoolBill> bills(int kinderId,HashMap<String, Object> condition, int curPage, int pageSize);

    //缴费查看
    LayuiData<StudentBill> studnetBills(int classId,int schoolbillId);


}
