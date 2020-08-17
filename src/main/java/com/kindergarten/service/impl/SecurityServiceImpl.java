package com.kindergarten.service.impl;


import com.kindergarten.bean.*;
import com.kindergarten.mapper.SecurityMapper;
import com.kindergarten.service.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SecurityServiceImpl implements SecurityService {

    @Autowired
    private SecurityMapper securityMapper;

    @Override
    public Security login(Security security) {
        return securityMapper.login(security);
    }

    @Override
    public int update(Security security) {
        return securityMapper.update(security);
    }

    @Override
    public Security getInfo(Security security) {
        return securityMapper.getInfo(security);
    }

    @Override
    public List<Location> getPoint() {
        return securityMapper.getPoint();
    }

    @Override
    public int insertAlert(Location location) {
        return securityMapper.insertAlert(location);
    }

    @Override
    public List<AlertInfo> getAlert(AlertInfo alertInfo,int limit,int curPage) {
        return securityMapper.getAlert(alertInfo,limit,curPage);
    }

    @Override
    public int countAlert(AlertInfo alertInfo) {
        return securityMapper.countAlert(alertInfo);
    }

    @Override
    public List<Classes> getClassSelect() {
        return securityMapper.getClassSelect();
    }

    @Override
    public List<PickupInfo> getPickup(PickupInfo pickupInfo,int limit,int curPage) {
        return securityMapper.getStudentPickup(pickupInfo,limit,curPage);
    }

    @Override
    public int countPickup(PickupInfo pickupInfo) {
        return securityMapper.countPickup(pickupInfo);
    }

    @Override
    public List<PickupDetail> getPickupDetail(PickupDetail pickupDetail) {
        return securityMapper.getPickupDetail(pickupDetail);
    }

    @Override
    public int countPickupDetail(PickupDetail pickupDetail) {
        return securityMapper.countPickupDetail(pickupDetail);
    }

    @Override
    public List<Monitor> getMonitor() {
        return securityMapper.getMonitor();
    }

    @Override
    public int countMonitor() {
        return securityMapper.countMonitor();
    }

    @Override
    public List<MonitorVideo> getMonitorVideo(MonitorVideo monitorVideo,int limit,int curPage) {
        return securityMapper.getMonitorVideo(monitorVideo,limit,curPage);
    }

    @Override
    public int countMonitorVideo(MonitorVideo monitorVideo) {
        return securityMapper.countMonitorVideo(monitorVideo);
    }


}
