package com.kindergarten.service;


import com.kindergarten.bean.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SecurityService {

    Security login(Security security);

    int update(Security security);

    Security getInfo(Security security);

    List<Location> getPoint();

    int insertAlert(Location location);

    List<AlertInfo> getAlert(AlertInfo alertInfo, @Param("limit") int limit, @Param("curPage") int curPage);

    int countAlert(AlertInfo alertInfo);

    List<Classes> getClassSelect();

    List<PickupInfo> getPickup(PickupInfo pickupInfo, @Param("limit") int limit, @Param("curPage") int curPage);

    int countPickup(PickupInfo pickupInfo);

    List<PickupDetail> getPickupDetail(PickupDetail pickupDetail);

    int countPickupDetail(PickupDetail pickupDetail);

    List<Monitor> getMonitor();

    int countMonitor();

    List<MonitorVideo> getMonitorVideo(MonitorVideo monitorVideo, @Param("limit") int limit, @Param("curPage") int curPage);

    int countMonitorVideo(MonitorVideo monitorVideo);
}
