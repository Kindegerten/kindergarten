package com.kindergarten.mapper;


import com.kindergarten.bean.Parents;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ParentsMapper {

    public Parents login(String tel);
    public String FindRole(int roleid);

}
