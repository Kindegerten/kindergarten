package com.kindergarten.service.impl;


import com.kindergarten.bean.LayuiData;
import com.kindergarten.bean.TblTeachers;
import com.kindergarten.bean.TblWorkrelease;
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
    public TblTeachers login(String tel)
    {
        TblTeachers tblTeachers = null;
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
}
