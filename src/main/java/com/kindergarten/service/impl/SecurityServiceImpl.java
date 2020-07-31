package com.kindergarten.service.impl;


import com.kindergarten.bean.Security;
import com.kindergarten.mapper.SecurityMapper;
import com.kindergarten.service.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("securityServiceImpl")
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

}
