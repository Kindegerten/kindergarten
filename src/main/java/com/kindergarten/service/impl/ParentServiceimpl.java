package com.kindergarten.service.impl;

import com.kindergarten.bean.*;
import com.kindergarten.mapper.ParentsMapper;
import com.kindergarten.service.ParentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ParentServiceimpl implements ParentService {
    @Autowired
    ParentsMapper parentsMapper;

    @Override
    public Parents login(String tel) {
        Parents parents=null;

        parents=parentsMapper.login(tel);

        return parents;
    }

    @Override
    public LayuiData<CampusInfo> CampusInfo(int kinderId, int curPage, int pageSize) {
        LayuiData<CampusInfo> layuiData = null;
        List<CampusInfo> list=parentsMapper.CampusInfo(kinderId, curPage, pageSize);
        int totalRecord=parentsMapper.CampusInfoCount(kinderId);
        layuiData = new LayuiData<>(0,"",totalRecord,list);
        return layuiData;
    }

    @Override
    public LayuiData<PlatformInfo> PlatformInfo(int curPage, int pageSize) {
        LayuiData<PlatformInfo> layuiData = null;
        List<PlatformInfo> list=parentsMapper.PlatformInfo( curPage, pageSize);
        int totalRecord=parentsMapper.PlatformInfoCount();
        layuiData = new LayuiData<>(0,"",totalRecord,list);
        return layuiData;
    }

    @Override
    public List<Students> studentsList(int parentId) {
        return parentsMapper.SerchStudent(parentId);
    }

    @Override
    public LayuiData<Examination> examination(int studentId) {
//        parentsMapper.SearchBabyHeath(studentId)
        LayuiData<Examination> layuiData=null;
        List<Examination> examinations=parentsMapper.SearchBabyHeath(studentId);
        int totalRecord=parentsMapper.SearchBabyHeathCount(studentId);
        layuiData=new LayuiData<>(0,"",totalRecord,examinations);

        return layuiData;
    }

    @Override
    public LayuiData<Monitor> monitors(int studentId) {
        LayuiData<Monitor> layuiData=null;
        List<Monitor> examinations=parentsMapper.SearchVideo(studentId);
        int totalRecord=parentsMapper.SearchVideoCount(studentId);
        layuiData=new LayuiData<>(0,"",totalRecord,examinations);

        return layuiData;
    }
}
