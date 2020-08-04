package com.kindergarten.service.impl;


import com.kindergarten.bean.LayuiData;
import com.kindergarten.bean.Teachers;
import com.kindergarten.bean.Workrelease;
import com.kindergarten.mapper.TeacherMapper;
import com.kindergarten.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
    public LayuiData publishJobList(Workrelease workrelease, int page, int pageSize) {
        int start = (page - 1) * pageSize;//计算出起始查询位置
        if(start<0)
            start=0;
        List<Workrelease> list = teacherMapper.publishJobList(workrelease, start, pageSize);
        int count = teacherMapper.publishJobListCount(workrelease);

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
    public int publishTaskAdd(Workrelease workrelease) {
        int i=teacherMapper.publishTaskAdd(workrelease);
        return i;
    }

    @Override
    public int delPublishTask(Workrelease workrelease) {
        int i=teacherMapper.delPublishTask(workrelease);
        return i;
    }
}
