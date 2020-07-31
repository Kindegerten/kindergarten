package com.kindergarten.service.impl;


import com.kindergarten.bean.TblTeachers;
import com.kindergarten.mapper.TeacherMapper;
import com.kindergarten.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
