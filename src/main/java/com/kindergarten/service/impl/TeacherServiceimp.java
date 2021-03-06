package com.kindergarten.service.impl;


import com.kindergarten.bean.*;
import com.kindergarten.mapper.TeacherMapper;
import com.kindergarten.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Transactional
@Service
public class TeacherServiceimp implements TeacherService {

    @Autowired
    private TeacherMapper teacherMapper;

    @Override
    public Teachers login(String tel)
    {
        Teachers tblTeachers = null;
        tblTeachers = teacherMapper.tologin(tel);
        return tblTeachers;
    }

    @Override
    public LayuiData publishJobList(TblWorkrelease tblWorkrelease, int page, int pageSize) {
        int start = (page - 1) * pageSize;//计算出起始查询位置
        if(start<0)
            start=0;
        List<TblWorkrelease> list = teacherMapper.publishJobList(tblWorkrelease, start, pageSize);
        int count = teacherMapper.publishJobListCount(tblWorkrelease);

        LayuiData layuiData = new LayuiData();
        if (list.size() > 0) {
            layuiData.setCode(0);
            layuiData.setMsg("");
            layuiData.setCount(count);
            layuiData.setData(list);
            layuiData.setMsg("查询成功");
        } else {
            layuiData.setCode(1);
            layuiData.setMsg("查询失败");
        }
        return layuiData;
    }

    @Override
    public int publishTaskAdd(TblWorkrelease tblWorkrelease) {
        int i=teacherMapper.publishTaskAdd(tblWorkrelease);
        return i;
    }

    @Override
    public int delPublishTask(TblWorkrelease tblWorkrelease) {
        int i=teacherMapper.delPublishTask(tblWorkrelease);
        return i;
    }

    @Override
    public LayuiData selectList(TblWorkrelease tblWorkrelease, int page, int pageSize)
    {
        int start = (page - 1) * pageSize;//计算出起始查询位置
        if(start<0)
            start=0;
        List<Work> list = teacherMapper.selectList( tblWorkrelease,start, pageSize);
        int count = teacherMapper.selectListCount(tblWorkrelease);

        LayuiData layuiData = new LayuiData();
        if (list.size() > 0) {
            layuiData.setCode(0);
            layuiData.setMsg("");
            layuiData.setCount(count);
            layuiData.setData(list);
            layuiData.setMsg("查询成功");
        } else {
            layuiData.setCode(1);
            layuiData.setMsg("查询失败");
        }
        return layuiData;
    }

    @Override
    public int updateTask(Work tblTask) {
        int i=teacherMapper.updateTask(tblTask);
        return i;
    }

    @Override
    public LayuiData phototSelectList(int idNum, int page, int pageSize) {
        int start = (page - 1) * pageSize;//计算出起始查询位置
        if(start<0)
            start=0;
        List<Photo> list = teacherMapper.photoSelectList( idNum,start, pageSize);
        int count = teacherMapper.photoSelectListCount();

        LayuiData layuiData = new LayuiData();
        if (list.size() > 0) {
            layuiData.setCode(0);
            layuiData.setMsg("");
            layuiData.setCount(count);
            layuiData.setData(list);
            layuiData.setMsg("查询成功");
        } else {
            layuiData.setCode(1);
            layuiData.setMsg("查无结果");
        }
        return layuiData;
    }

    @Override
    public int addClassPhoto(Photo classPhoto)
    {
        int i=teacherMapper.addClassPhoto(classPhoto);
        return i;
    }

    @Override
    public LayuiData classInfoSelectList(ClassInfo classInf, String endTime, int page, int pageSize)
    {
        int start = (page - 1) * pageSize;//计算出起始查询位置
        if(start<0)
            start=0;
        List<ClassInfo> list = teacherMapper.classInfoSelectList( classInf,endTime,start,pageSize);
        int count = teacherMapper.classInfoSelectListCount();

        LayuiData layuiData = new LayuiData();
        if (list.size() > 0) {
            layuiData.setCode(0);
            layuiData.setMsg("");
            layuiData.setCount(count);
            layuiData.setData(list);
            layuiData.setMsg("查询成功");
        } else {
            layuiData.setCode(1);
            layuiData.setMsg("查询失败");
        }
        return layuiData;
    }

//    班级通知
    @Override
    public LayuiData clamsgSelectList(Clamsg tblClassNotice, String endTime, int page, int pageSize) {
        int start = (page - 1) * pageSize;//计算出起始查询位置
        if(start<0)
            start=0;
        List<Clamsg> list = teacherMapper.clamsgSelectList( tblClassNotice,endTime,start,pageSize);
        int count = teacherMapper.clamsgSelectListCount();

        LayuiData layuiData = new LayuiData();
        if (list.size() > 0) {
            layuiData.setCode(0);
            layuiData.setMsg("");
            layuiData.setCount(count);
            layuiData.setData(list);
            layuiData.setMsg("查询成功");
        } else {
            layuiData.setCode(1);
            layuiData.setMsg("查询失败");
        }
        return layuiData;
    }

    @Override
    public int clamsgAdd(Clamsg tblClassNotice) {
        int i=teacherMapper.clamsgAdd(tblClassNotice);
        return i;
    }

    @Override
    public int delClamsg(Clamsg tblClassNotice) {
        int i=teacherMapper.delClamsg(tblClassNotice);
        return i;
    }

    @Override
    public int updateClamsg(Clamsg tblClassNotice) {
        int i=teacherMapper.updateClamsg(tblClassNotice);
        return i;
    }

    //安全试题配置
    @Override
    public LayuiData safetyEduSelectList(int idNum, int page, int pageSize) {
        int start = (page - 1) * pageSize;//计算出起始查询位置
        if(start<0)
            start=0;
        List<SafetyEdu> list = teacherMapper.safetyEduSelectList(idNum,start, pageSize);
        int count = teacherMapper.safetyEduSelectListCount();

        LayuiData layuiData = new LayuiData();
        if (list.size() > 0) {
            layuiData.setCode(0);
            layuiData.setMsg("");
            layuiData.setCount(count);
            layuiData.setData(list);
            layuiData.setMsg("查询成功");
        } else {
            layuiData.setCode(1);
            layuiData.setMsg("查询失败");
        }
        return layuiData;
    }

    @Override
    public int addSafetyEdu(SafetyEdu tblSafetyEdu) {
        int i=teacherMapper.addSafetyEdu(tblSafetyEdu);
        return i;
    }

    @Override
    public int updateSafetyEdu(SafetyEdu tblSafetyEdu) {
        int i=teacherMapper.updateSafetyEdu(tblSafetyEdu);
        return i;
    }

    @Override
    public LayuiData safetyVideoSelectList() {
        List<SafetyVideo> list = teacherMapper.safetyVideoSelectList();
        LayuiData layuiData = new LayuiData();
        if (list.size() > 0) {
            layuiData.setCode(0);
            layuiData.setMsg("");
            layuiData.setCount(0);
            layuiData.setData(list);
            layuiData.setMsg("查询成功");
        } else {
            layuiData.setCode(1);
            layuiData.setMsg("查询失败");
        }
        return layuiData;
    }

    @Override
    public LayuiData safetyTestCompleteSelectList(SafetyTestComplete safetyTestOut, String endTime, int page, int pageSize) {
        int start = (page - 1) * pageSize;//计算出起始查询位置
        if(start<0)
            start=0;
        List<SafetyTestComplete> list = teacherMapper.safetyTestCompleteSelectList( safetyTestOut,endTime,start,pageSize);
        int count = teacherMapper.safetyTestCompleteSelectListCount();

        LayuiData layuiData = new LayuiData();
        if (list.size() > 0) {
            layuiData.setCode(0);
            layuiData.setMsg("");
            layuiData.setCount(count);
            layuiData.setData(list);
            layuiData.setMsg("查询成功");
        } else {
            layuiData.setCode(1);
            layuiData.setMsg("查询失败");
        }
        return layuiData;
    }

    @Override
    public LayuiData courseTeacher(Course course, int page, int pageSize) {
        int start = (page - 1) * pageSize;//计算出起始查询位置
        if(start<0)
            start=0;
        List<Course> list = teacherMapper.courseTeacher(course,start, pageSize);
        int count = teacherMapper.courseTeacherCount();

        LayuiData layuiData = new LayuiData();
        if (list.size() > 0) {
            layuiData.setCode(0);
            layuiData.setMsg("");
            layuiData.setCount(count);
            layuiData.setData(list);
            layuiData.setMsg("查询成功");
        } else {
            layuiData.setCode(1);
            layuiData.setMsg("查询失败");
        }
        return layuiData;
    }
}
