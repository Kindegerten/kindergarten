package com.kindergarten.service;


import com.kindergarten.bean.Security;

public interface SecurityService {

    Security login(Security security);

    int update(Security security);

    Security getInfo(Security security);

}
