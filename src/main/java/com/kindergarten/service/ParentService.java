package com.kindergarten.service;


import com.kindergarten.bean.CampusInfo;
import com.kindergarten.bean.LayuiData;
import com.kindergarten.bean.Parents;
import com.kindergarten.bean.PlatformInfo;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface ParentService {

    public Parents login(String tel);
    public LayuiData<CampusInfo> CampusInfo(String tel,int curPage, int pageSize);
    public LayuiData<PlatformInfo> PlatformInfo(int curPage, int pageSize);

}
