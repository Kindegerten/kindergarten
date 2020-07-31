package com.kindergarten.service;


import com.kindergarten.bean.Admin;

public interface AdminService {
    Admin login(String adminTel, String adminPwd);
    String  updatePwd(Admin admin);
}
