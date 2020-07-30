package com.kindergarten.controller;


import com.alibaba.fastjson.JSON;
import com.kindergarten.bean.Parents;
import com.kindergarten.mapper.ParentsMapper;
import com.kindergarten.service.ParentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@RequestMapping("/pt")
@Controller
public class parentController {
     @Autowired
     ParentService parentService;
     @Autowired
     ParentsMapper parentsMapper;


    @RequestMapping(value = "/login")
    @ResponseBody
    public String Login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tel = request.getParameter("tel");
        String password = request.getParameter("password");

        Parents parents=parentService.login(tel);
        if (parents!=null) {
            String roleName = parentsMapper.FindRole(parents.getRoleID());
            parents.setRoleName(roleName);
            return JSON.toJSONString(parents);
        }else {
            return null;
        }

    }






}
