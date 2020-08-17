package com.kindergarten.service.impl;

import com.kindergarten.mapper.InformMapper;
import com.kindergarten.service.InformService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InformServiceImp implements InformService {
    @Autowired//注入相应mapper
            InformMapper informMapper;
    @Override
    public String findInform(String kinderId) {
        return informMapper.findInform(kinderId);
    }
}
