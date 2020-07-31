package com.kindergarten.controller;


import com.alibaba.fastjson.JSON;
import com.kindergarten.bean.CampusInfo;
import com.kindergarten.bean.LayuiData;
import com.kindergarten.bean.Parents;
import com.kindergarten.bean.PlatformInfo;
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
        String sessionCode = (String) request.getSession().getAttribute("vCode");
        String paramCode=request.getParameter("code");
        System.out.println(paramCode);
        System.out.println(sessionCode);

        request.getSession().removeAttribute("vcode"); //错了就换新的验证码：

        if (paramCode.equalsIgnoreCase(sessionCode)){
        Parents parents=parentService.login(tel);
        if (parents!=null) {
            if (password.equals(parents.getParentsPwd())){
                String roleName = parentsMapper.FindRole(parents.getRoleID());
                parents.setRoleName(roleName);
                request.getSession().setAttribute("parents",parents);
                return "success";
            }else {

                return "账号或密码错误";
            }

        }else {
            return "无此账号";
        }
        }else {
            return "验证码错误";
        }
    }

    @RequestMapping(value = "/UpdatePwd")
    @ResponseBody
    public String UpdatePwd(String oldpwd,String newpwd,HttpServletRequest request) throws ServletException, IOException {

        Parents parents= (Parents) request.getSession().getAttribute("parents");
        if (oldpwd.equals(parents.getParentsPwd())){

            int a=parentsMapper.updatePwd(parents.getParentsTel(),newpwd);
            if (a>0){
                parents.setParentsPwd(newpwd);
                request.getSession().setAttribute("parents",parents);
                return "success";
            }else {
                return "error";
            }

        }else {

            return "error";
        }
    }

    //校园资讯
    @RequestMapping(value = "/SchoolInfo")
    @ResponseBody
    public String SchoolInfo(HttpServletRequest request) throws ServletException, IOException {
        int curPage;
        if(request.getParameter("curPage")!=null){
            curPage = Integer.parseInt(request.getParameter("curPage"));
        }else{
            curPage = 1;
        }
        int pageSize=Integer.parseInt(request.getParameter("pageSize"));
        Parents parents= (Parents) request.getSession().getAttribute("parents");
        LayuiData<CampusInfo> layuiData=parentService.CampusInfo(parents.getParentsTel(),curPage,pageSize);
        System.out.println(JSON.toJSONString(layuiData.getData()));
        return JSON.toJSONString(layuiData);
    }

    //平台资讯
    @RequestMapping(value = "/PlatformInfo")
    @ResponseBody
    public String PlatformInfo(HttpServletRequest request) throws ServletException, IOException {
        int curPage;
        if(request.getParameter("curPage")!=null){
            curPage = Integer.parseInt(request.getParameter("curPage"));
        }else{
            curPage = 1;
        }
        int pageSize=Integer.parseInt(request.getParameter("pageSize"));
        LayuiData<PlatformInfo> layuiData=parentService.PlatformInfo(curPage,pageSize);
        System.out.println(JSON.toJSONString(layuiData.getData()));
        return JSON.toJSONString(layuiData);
    }




}
