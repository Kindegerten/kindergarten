package com.kindergarten.controller;


import com.alibaba.fastjson.JSON;
import com.kindergarten.bean.Security;
import com.kindergarten.service.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@Controller
@RequestMapping("/sc")
public class SecurityController {

    @Autowired
    private SecurityService securityService;


    @RequestMapping(value = "/login")
    @ResponseBody
    public String login(String phone, String pwd, String vCode, HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("SecurityController login ing...");
//        response.setContentType("text/html;charset=utf-8");
        Security security = new Security();


        System.out.println("security=" + phone + "+" + pwd + "+" + vCode);
        security.setvCode(vCode);
        security.setSecurityPhone(phone);
        security.setSecurityPwd(pwd);

        security = securityService.login(security);

        if (security != null) {
            request.getSession().setAttribute("account", security.getSecurityPhone());
        }

        return security != null ? "success" : "error";
    }

    @RequestMapping(value = "/update")
    @ResponseBody
    public String update(HttpServletRequest request, HttpServletResponse response) throws IOException {

        Security security = new Security();
        return securityService.update(security) > 0 ? "success" : "error";
    }

    @RequestMapping(value = "/getInfo")
    @ResponseBody
    public String getInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("SecurityController getInfo ing...");
        Security security = new Security();

        security.setSecurityPhone(request.getParameter("account"));

        security = securityService.getInfo(security);

        return security != null ? JSON.toJSONString(security) : "error";

    }


}
