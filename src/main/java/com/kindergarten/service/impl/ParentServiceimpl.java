package com.kindergarten.service.impl;

import com.kindergarten.bean.Parents;
import com.kindergarten.mapper.ParentsMapper;
import com.kindergarten.service.ParentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ParentServiceimpl implements ParentService {
    @Autowired
    ParentsMapper parentsMapper;

    @Override
    public Parents login(String tel) {
        Parents parents=null;

        parents=parentsMapper.login(tel);

        return parents;
    }
}
