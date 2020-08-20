package com.kindergarten.service.impl;

import com.kindergarten.bean.*;
import com.kindergarten.mapper.RectorMapper;
import com.kindergarten.service.RectorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
@Transactional
@Service
public class RectorServiceImpl implements RectorService {
    @Autowired
    RectorMapper rectorMapper;

    //登录
    @Override
    public Rector login(String rectorTel, String rectorPwd) {
        return rectorMapper.login(rectorTel, rectorPwd);
    }

    //找到院长管理的班级
    @Override
    public List<Classes> findClasses(int kid) {
        return rectorMapper.findClasses(kid);
    }

    //更新个人信息
    @Override
    public int updateSelf(Rector rector) {
        return rectorMapper.updateSelf(rector);
    }

    //园所资格审批
    @Override
    public int addKinder(Kinder kinder) {
        return rectorMapper.addKinder(kinder);
    }

    //教职工列表
    @Override
    public LayuiData<Staffs> stafflist(HashMap<String, Object> condition, int curPage, int pageSize) {
        LayuiData<Staffs> layuiData = null;
        List<Staffs> stafflist = rectorMapper.stafflist(condition, curPage, pageSize);
        int totalRecord = rectorMapper.staffcount(condition);
        layuiData = new LayuiData<>(0, "", totalRecord, stafflist);
        return layuiData;
    }

    //删除教职工
    @Override
    public int deleteStaff(String tableName, String tableId, int teacherid) {
        return rectorMapper.deleteStaff(tableName, tableId, teacherid);
    }

    //增加教职工
    @Override
    public int addStaffs(String tableName, String column1, String column2, String column3, String column4, String teacherName, int roleid, String telphone, int kinderid) {
        return rectorMapper.addStaffs(tableName, column1, column2, column3, column4, teacherName, roleid, telphone, kinderid);
    }

    //查询新增教职工是否已在数据库添加
    @Override
    public Staffs checkNewStaff(String tableName, String column3, String telphone) {
        return rectorMapper.checkNewStaff(tableName, column3, telphone);
    }

    //幼儿列表
    @Override
    public LayuiData<Students> studentlist(HashMap<String, Object> condition, int curPage, int pageSize) {
        LayuiData<Students> layuiData = null;
        List<Students> studentlist = rectorMapper.studentlist(condition, curPage, pageSize);
        int totalRecord = rectorMapper.studentcount(condition);
        layuiData = new LayuiData<>(0, "", totalRecord, studentlist);
        return layuiData;
    }

    //增加幼儿
    @Override
    public int addBaby(Students students) {
        return rectorMapper.addBaby(students);
    }

    //修改幼儿
    @Override
    public int updateBaby(Students students) {
        return rectorMapper.updateBaby(students);
    }

    //删除幼儿
    @Override
    public int deleteStudent(String studentId) {
        return rectorMapper.deleteStudent(studentId);
    }

    //家长列表
    @Override
    public LayuiData<parentsinfo> parentsList(HashMap<String, Object> condition, int curPage, int pageSize) {
        LayuiData<parentsinfo> layuiData = null;
        List<parentsinfo> parentsList = rectorMapper.parentsList(condition, curPage, pageSize);
        int totalRecord = rectorMapper.parentscount(condition);
        layuiData = new LayuiData<>(0, "", totalRecord, parentsList);
        return layuiData;
    }

    //更新家长列表及相应亲子关系表
    @Override
    @Transactional
    public int updateParents(parentsinfo parentsinfo) {
        int flag1 = rectorMapper.updateParents(parentsinfo);
        int flag2 = rectorMapper.updateTps(parentsinfo);
        if (flag1 > 0 && flag2 > 0) {
            return 1;
        } else {
            return 0;
        }
    }

    //删除家长和相应亲子关系
    @Override
    @Transactional
    public int deleteParents(String parentsId) {
        int flag1 = rectorMapper.deleteParents(parentsId);
        int flag2 = rectorMapper.deleteTps(parentsId);
        if (flag1 > 0 && flag2 > 0) {
            return 1;
        } else {
            return 0;
        }
    }

    //增加家长和相应亲子关系
    @Override
    @Transactional
    public int addParents(parentsinfo parentsinfo) {
        int flag1 = rectorMapper.addParents(parentsinfo);
        int flag2 = rectorMapper.addTps(parentsinfo);
        if (flag1 > 0 && flag2 > 0) {
            return 1;
        } else {
            return 0;
        }
    }

    //检测幼儿是否已在数据库
    @Override
    public List<Students> checkStudent(String studentName) {
        return rectorMapper.checkStudent(studentName);
    }

    //考勤管理列表
    @Override
    public LayuiData<staffAttendance> attendanceList(HashMap<String, Object> condition, int curPage, int pageSize) {
        LayuiData<staffAttendance> layuiData = null;
        List<staffAttendance> parentsList = rectorMapper.attendanceList(condition, curPage, pageSize);
        int totalRecord = rectorMapper.attendancecount(condition);
        layuiData = new LayuiData<>(0, "", totalRecord, parentsList);
        return layuiData;
    }

    //详细考勤信息
    @Override
    public LayuiData<staffAttendance> findAttendance(HashMap<String, Object> condition, int curPage, int pageSize) {
        LayuiData<staffAttendance> layuiData = null;
        List<staffAttendance> parentsList = rectorMapper.findAttendance(condition, curPage, pageSize);
        int totalRecord = rectorMapper.attendanceCount(condition);
        layuiData = new LayuiData<>(0, "", totalRecord, parentsList);
        return layuiData;
    }

    //班级列表
    @Override
    public LayuiData<Classes> classList(HashMap<String, Object> condition, int curPage, int pageSize) {
        LayuiData<Classes> layuiData = null;
        List<Classes> parentsList = rectorMapper.classList(condition, curPage, pageSize);
        int totalRecord = rectorMapper.classCount(condition);
        layuiData = new LayuiData<>(0, "", totalRecord, parentsList);
        return layuiData;
    }

    //检测教职工是否已添加到数据库
    @Override
    public List<Teachers> checkTeacher(String teacherName) {
        return rectorMapper.checkTeacher(teacherName);
    }

    //增加班级
    @Override
    public int addClasses(Classes classes) {
        return rectorMapper.addClasses(classes);
    }

    //更新班级
    @Override
    public int updateClass(Classes classes) {
        return rectorMapper.updateClass(classes);
    }

    //删除班级
    @Override
    public int deleteClass(String classId) {
        return rectorMapper.deleteClass(classId);
    }

    //配置课程
    @Override
    public LayuiData<Course> findCourse(HashMap<String, Object> condition, int curPage, int pageSize) {
        LayuiData<Course> layuiData = null;
        List<Course> list = rectorMapper.findCourse(condition, curPage, pageSize);
        int totalRecord = rectorMapper.courseCount(condition);
        layuiData = new LayuiData<>(0, "", totalRecord, list);
        return layuiData;
    }

    //班级成员列表
    @Override
    public LayuiData<ClassMember> classMemberList(HashMap<String, Object> condition, int curPage, int pageSize) {
        LayuiData<ClassMember> layuiData = null;
        List<ClassMember> list = rectorMapper.classMemberList(condition, curPage, pageSize);
        int totalRecord = rectorMapper.classMemberCount(condition);
        layuiData = new LayuiData<>(0, "", totalRecord, list);
        return layuiData;
    }

    //校园公告列表
    @Override
    public LayuiData<CampusInfo> campusNewsList(HashMap<String, Object> condition, int curPage, int pageSize) {
        LayuiData<CampusInfo> layuiData = null;
        List<CampusInfo> list = rectorMapper.campusNewsList(condition, curPage, pageSize);
        int totalRecord = rectorMapper.campusNewsCount(condition);
        layuiData = new LayuiData<>(0, "", totalRecord, list);
        return layuiData;
    }

    //增加公告
    @Override
    public int addNews(CampusInfo campusInfo) {
        return rectorMapper.addNews(campusInfo);
    }

    //修改公告
    @Override
    public int updateNews(CampusInfo campusInfo) {
        return rectorMapper.updateNews(campusInfo);
    }

    //删除公告
    @Override
    public int deleteNews(String campusInfoId) {
        return rectorMapper.deleteNews(campusInfoId);
    }
    //增加通知
    @Override
    public int addInform(Inform inform) {
        return rectorMapper.addInform(inform);
    }


}
