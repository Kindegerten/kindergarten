package com.kindergarten.mapper;


import com.kindergarten.bean.Location;
import com.kindergarten.bean.Security;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SecurityMapper {

    Security login(Security security);

    int update(Security security);

    Security getInfo(Security security);

    List<Location> getPoint();

    int insertAlert(Location location);

}
