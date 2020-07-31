package com.kindergarten.mapper;


import com.kindergarten.bean.CampusInfo;
import com.kindergarten.bean.Parents;
import com.kindergarten.bean.PlatformInfo;
import com.kindergarten.bean.Students;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface ParentsMapper {

    public Parents login(String tel);
    public String FindRole(int roleid);
    public int updatePwd(@Param("tel") String tel,@Param("pwd") String password);

    //校园资讯
    public List<CampusInfo> CampusInfo(@Param("kinderId") int kinderId, @Param("curPage") int curPage, @Param("pageSize") int pageSize);
    public int CampusInfoCount(@Param("kinderId") int kinderId);

    //平台资讯
    public List<PlatformInfo> PlatformInfo(@Param("curPage") int curPage, @Param("pageSize") int pageSize);
    public int PlatformInfoCount();

    //登陆后选择哪个孩子的管理
    public List<Students> SerchStudent(int parentId);


}
