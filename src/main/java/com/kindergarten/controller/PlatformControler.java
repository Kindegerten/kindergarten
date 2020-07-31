package com.kindergarten.controller;


import com.alibaba.fastjson.JSON;
import com.kindergarten.bean.Admin;
import com.kindergarten.bean.Menu;
import com.kindergarten.service.AdminService;
import com.kindergarten.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("platformController")
public class PlatformControler {

    @Autowired
    AdminService adminService;

    @Autowired
    MenuService menuService;


    @RequestMapping(value = "/login")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String login(HttpServletRequest request, HttpServletResponse response, String adminTel, String adminPwd) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");

        Admin admin1 = adminService.login(adminTel,adminPwd);
        if (admin1 != null) {
            //菜单列表
            List<Menu> menu = menuService.findMenuList(adminTel);
//            System.out.println(menu);
//            System.out.println("菜单信息："+menu.size());
            System.out.println("admin1:"+ JSON.toJSONString(admin1));
            request.getSession().setAttribute("menu", menu);
            request.getSession().setAttribute("admin", admin1);


            return "success";
        } else {
            return " 账号或密码不正确";
        }


    }
    @RequestMapping(value = "/updatePwd")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String updatePwd( Admin admin) throws ServletException, IOException {

    String msg=null;
    msg=adminService.updatePwd(admin);

    return msg;

    }
}

