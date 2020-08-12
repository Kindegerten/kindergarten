package com.kindergarten.mapper;


import com.kindergarten.bean.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface RectorMapper {
    //登录
    Rector login(String rectorTel, String rectorPwd);
    //找到园长管理的所有班级
    List<Classes> findClasses(int kid);
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
    //添加教职工
    int addStaffs(String tableName,String column1,String column2,String column3,String column4,String teacherName,int roleid,String telphone,int kinderid);
    //查询新增教职工
    Staffs checkNewStaff(String tableName,String column3,String telphone);
    //幼儿列表
    List<Students> studentlist(@Param("condition") HashMap<String, Object> condition, @Param("curPage") int curPage, @Param("pageSize") int pageSize);
    //幼儿列表总条数
    int studentcount(HashMap<String, Object> condition);
//增加幼儿
    int addBaby(Students students);
//修改幼儿
    int updateBaby(Students students);
//删除幼儿
    int deleteStudent(String studentId);
    //家长列表
    List<parentsinfo> parentsList(@Param("condition") HashMap<String, Object> condition, @Param("curPage") int curPage, @Param("pageSize") int pageSize);
  //家长列表总数
  int parentscount(HashMap<String, Object> condition);
    //修改家长
    int updateParents(parentsinfo parentsinfo);
    //删除家长
    int deleteParents(String parentsId);
    //删除家长学生关系表信息
    int deleteTps(String parentsId);
    //更改家长学生关系表信息
    int updateTps(parentsinfo parentsinfo);
     //增加家长
    int addParents(parentsinfo parentsinfo);
    //查询学生是否存在
    List<Students> checkStudent(String studentName);
    //增加家长学生关系表信息
    int addTps(parentsinfo parentsinfo);
    //教职工考勤管理列表
    List<staffAttendance> attendanceList(@Param("condition") HashMap<String, Object> condition, @Param("curPage") int curPage, @Param("pageSize") int pageSize);
    //教职工考勤列表总数
    int attendancecount(HashMap<String, Object> condition);
    //考勤详情列表
    List<staffAttendance> findAttendance(@Param("condition") HashMap<String, Object> condition, @Param("curPage") int curPage, @Param("pageSize") int pageSize);
    //考勤详情列表总数
    int attendanceCount(HashMap<String, Object> condition);
    //班级列表
    List<Classes> classList(HashMap<String, Object> condition, int curPage, int pageSize);
    //班级列表总数
    int classCount(HashMap<String, Object> condition);
    //检测教师是否存在
    List<Teachers> checkTeacher(String teacherName);
    //增加班级
    int addClasses(Classes classes);
    //修改班级信息
    int updateClass(Classes classes);
    //删除班级
    int deleteClass(String classId);
    //课程详情
    List<Course> findCourse(HashMap<String, Object> condition, int curPage, int pageSize);
    //课程详情表总数
    int courseCount(HashMap<String, Object> condition);
    //班级成员列表
    List<ClassMember> classMemberList(HashMap<String, Object> condition, int curPage, int pageSize);
    //班级成员总数
    int classMemberCount(HashMap<String, Object> condition);
    //校园公告列表
    List<CampusInfo> campusNewsList(HashMap<String, Object> condition, int curPage, int pageSize);
    //校园公告列表总数
    int campusNewsCount(HashMap<String, Object> condition);
    //增加公告
    int addNews(CampusInfo campusInfo);
    //修改公告
    int updateNews(CampusInfo campusInfo);
    //删除公告
    int deleteNews(String campusInfoId);
}
