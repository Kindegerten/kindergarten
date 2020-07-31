package com.kindergarten.service.impl;


import com.kindergarten.bean.Admin;
import com.kindergarten.mapper.AdminMapper;
import com.kindergarten.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminService")
public class AdminServiceImp implements AdminService {

    @Autowired
    AdminMapper adminMapper;
    @Override
    public Admin login(String adminTel, String adminPwd) {
        return adminMapper.login(adminTel,adminPwd);
    }

    @Override
    public String updatePwd(Admin admin) {
        int a=adminMapper.updatePwd(admin);
        if (a>0){
            return "success";
        }else {
            return "failed";
        }
    }
}
