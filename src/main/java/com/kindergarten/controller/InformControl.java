package com.kindergarten.controller;


import com.kindergarten.service.HealtherService;
import com.kindergarten.service.InformService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@RequestMapping("InformControl")
@Controller
public class InformControl extends HttpServlet {
    @Autowired
    InformService informService;
    //最新消息通知
    @RequestMapping(value = "/findInform")
    @ResponseBody
    public String findInform(HttpServletRequest request, HttpServletResponse response, String kinderId) throws ServletException, IOException {
        System.out.println(kinderId);
        String inform = informService.findInform(kinderId);
        return inform;
    }
}
