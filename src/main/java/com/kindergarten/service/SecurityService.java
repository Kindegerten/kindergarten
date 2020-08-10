package com.kindergarten.service;


import com.kindergarten.bean.Location;
import com.kindergarten.bean.Security;

import java.util.List;

public interface SecurityService {

    Security login(Security security);

    int update(Security security);

    Security getInfo(Security security);

    List<Location> getPoint();

    int insertAlert(Location location);

}
