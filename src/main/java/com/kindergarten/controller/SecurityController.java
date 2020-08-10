package com.kindergarten.controller;


import com.alibaba.fastjson.JSON;
import com.kindergarten.bean.FaceReturn;
import com.kindergarten.bean.FaceUserList;
import com.kindergarten.bean.Location;
import com.kindergarten.bean.Security;
import com.kindergarten.service.FaceService;
import com.kindergarten.service.SecurityService;
import com.kindergarten.service.SmsService;
import com.kindergarten.util.AuthService;
import com.kindergarten.util.FaceAdd;
import com.kindergarten.util.FaceSearch;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@Controller
@RequestMapping("/sc")
public class SecurityController {

    @Autowired
    private SecurityService securityService;

    @Autowired
    private FaceService faceService;

    @Autowired
    private SmsService smsService;



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

        System.out.println("data:"+request.getParameter("data"));
        Security security = new Security();
        security=JSON.parseObject(String.valueOf(request.getParameter("data")),Security.class);
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

    @RequestMapping(value = "/faceSearch")
    @ResponseBody
    public String faceSearch(HttpServletRequest request, HttpServletResponse response) throws IOException {

        //获取base64
        String base64=new String(request.getParameter("base64").getBytes("ISO8859-1"), "UTF-8");
        System.out.println("base64 after:"+base64);
        //获取base64数据内容部分，去掉文件头和标识"data:image/jpeg;base64,"
        base64=base64.split("base64,")[1];
        System.out.println("base64 final:"+base64);

        return faceService.faceSearch(base64);
    }

    @RequestMapping(value = "/addFace")
    @ResponseBody
    public String addFace(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //获取base64
        String base64=new String(request.getParameter("base64").getBytes("ISO8859-1"), "UTF-8");
        System.out.println("base64 after:"+base64);
        //获取base64数据内容部分，去掉文件头和标识"data:image/jpeg;base64,"
        base64=base64.split("base64,")[1];
        System.out.println("base64 final:"+base64);

        //TODO 加入用户组信息 FaceUserList类 以实现，未对接
        FaceUserList faceUserList=new FaceUserList();

        //获取session域新增教师数据
        if (request.getSession().getAttribute("user_id")!=""&&request.getSession().getAttribute("user_id")!=null){
            faceUserList.setUser_id((String) request.getSession().getAttribute("user_id"));
        }else {
            return "未获取到新增教师的id！";
        }

        if (request.getSession().getAttribute("user_info")!=""&&request.getSession().getAttribute("user_info")!=null){
            faceUserList.setUser_info((String) request.getSession().getAttribute("user_info"));
        }else {
            return "未获取到新增教师的名字！";
        }

        if (request.getSession().getAttribute("group_id")!=""&&request.getSession().getAttribute("group_id")!=null){
            faceUserList.setGroup_id((String) request.getSession().getAttribute("group_id"));
        }else {
            return "未获取到新增教师的分组信息！";
        }


        return faceService.faceAdd(base64,faceUserList);
    }

    @RequestMapping(value = "/getPoint")
    @ResponseBody
    public String getPoint(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Location> locations=securityService.getPoint();
        System.out.println("locations:"+locations);
        return JSON.toJSONString(locations);
    }

    @RequestMapping(value = "/sendAlter")
    @ResponseBody
    public String sendAlter(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("sendAlter ing...");
        Location location=JSON.parseObject(request.getParameter("alertMsg"),Location.class);

        //TODO 短信
        smsService.sendSms(location.getStudentName());

        return securityService.insertAlert(location)>0?"报警记录成功！":location.getStudentName()+"的报警记录失败！";
    }
}
