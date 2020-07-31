package com.kindergarten.mapper;


import com.kindergarten.bean.Admin;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMapper {
    //输入输出参数以及方法名和xml对应，接口里面的方法不需要用public
    Admin login(String adminTel, String adminPwd);
    int updatePwd(Admin admin);
}
