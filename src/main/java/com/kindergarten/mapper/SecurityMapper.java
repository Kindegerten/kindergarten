package com.kindergarten.mapper;


import com.kindergarten.bean.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface SecurityMapper {

    Security login(Security security);

    int update(Security security);

    Security getInfo(Security security);

    List<Location> getPoint();

    int insertAlert(Location location);

    List<AlertInfo> getAlert(@Param("alertInfo") AlertInfo alertInfo,@Param("limit") int limit,@Param("curPage") int curPage);

    int countAlert(AlertInfo alertInfo);

    List<Classes> getClassSelect();

    List<PickupInfo> getStudentPickup(@Param("pickupInfo") PickupInfo pickupInfo,@Param("limit") int limit,@Param("curPage") int curPage);

    int countPickup(PickupInfo pickupInfo);

    List<PickupDetail> getPickupDetail(PickupDetail pickupDetail);

    int countPickupDetail(PickupDetail pickupDetail);

    List<Monitor> getMonitor();

    int countMonitor();
}
