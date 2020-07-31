package com.kindergarten.controller;


import com.alibaba.fastjson.JSON;
import com.kindergarten.bean.Security;
import com.kindergarten.service.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.io.IOException;


@Controller
@RequestMapping("/securityController")
public class SecurityController {

    @Autowired
    private SecurityService securityService;


    @RequestMapping(value = "/login")
    @ResponseBody
    public String login(String phone,String pwd,String vCode) throws IOException {
        System.out.println("SecurityController login ing...");
//        response.setContentType("text/html;charset=utf-8");
        Security security= new Security();


        System.out.println("2222222   security="+phone+"+"+pwd+"+"+vCode);
        security.setvCode(vCode);
        security.setSecurityPhone(phone);
        security.setSecurityPwd(pwd);

//        return null;
        return securityService.login(security) != null ? "success" : "error";
    }

    @RequestMapping(value = "/update")
    @ResponseBody
    public String update(String phone,String pwd,String vCode) throws IOException {

        Security security= new Security();
        return securityService.update(security)>0?"success":"error";
    }

    @RequestMapping(value = "/getInfo")
    @ResponseBody
    public String getInfo(String phone,String pwd,String vCode) throws IOException {

        Security security= new Security();
        return securityService.getInfo(security)!=null?JSON.toJSONString(security):"error";
    }

}
