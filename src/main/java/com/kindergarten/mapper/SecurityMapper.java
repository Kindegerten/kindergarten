package com.kindergarten.mapper;


import com.kindergarten.bean.Security;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SecurityMapper {

    Security login(Security security);

    int update(Security security);

    Security getInfo(Security security);

}
