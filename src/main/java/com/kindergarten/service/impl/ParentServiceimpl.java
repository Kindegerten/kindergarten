package com.kindergarten.service.impl;

import com.kindergarten.bean.CampusInfo;
import com.kindergarten.bean.LayuiData;
import com.kindergarten.bean.Parents;
import com.kindergarten.bean.PlatformInfo;
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
    public LayuiData<CampusInfo> CampusInfo(String tel, int curPage, int pageSize) {
        LayuiData<CampusInfo> layuiData = null;
        List<CampusInfo> list=parentsMapper.CampusInfo(tel, curPage, pageSize);
        int totalRecord=parentsMapper.CampusInfoCount(tel);
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
}
