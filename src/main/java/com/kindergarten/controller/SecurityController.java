package com.kindergarten.controller;


import com.alibaba.fastjson.JSON;
import com.kindergarten.bean.*;
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
//        System.out.println("base64 after:"+base64);
        //获取base64数据内容部分，去掉文件头和标识"data:image/jpeg;base64,"
        base64=base64.split("base64,")[1];
//        System.out.println("base64 final:"+base64);

        FaceUserList faceUserList=new FaceUserList();

        if(request.getParameter("user_group")!=""&&request.getParameter("user_group")!=null){
            System.out.println("security add teacher ing...");
            faceUserList.setGroup_id(request.getParameter("user_group"));
            faceUserList.setUser_info(request.getParameter("user_info"));
            String phone=request.getParameter("user_phone");
            switch (faceUserList.getGroup_id()){
                case "teacher":
                    Teachers teachers=new Teachers();
                    teachers.setTeacherName(faceUserList.getUser_info());
                    teachers.setTeacherTel(phone);
                    securityService.insertTeacher(teachers);
                    faceUserList.setUser_id(String.valueOf(teachers.getTeacherId()));
                    System.out.println(faceUserList.toString());
                    break;
                case "student":
                    System.out.println(faceUserList.toString());
                    break;
                case "parent":
                    System.out.println(faceUserList.toString());
                    break;
                case "security":
                    System.out.println(faceUserList.toString());
                    break;
                default:
                    System.out.println("未开放");
                    break;
            }
            if (faceUserList.getUser_id()!=""&&faceUserList.getUser_id()!=null){
                return faceService.faceAdd(base64,faceUserList);
            }else {
                return "未开放";
            }


        }else {
            //获取session域新增教师数据
            if (request.getSession().getAttribute("user_id")!=""&&request.getSession().getAttribute("user_id")!=null){
                faceUserList.setUser_id(String.valueOf(request.getSession().getAttribute("user_id")));
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
        }

        //JSON解析
        JSONObject jsonObject = new JSONObject(faceService.faceAdd(base64,faceUserList));
        String error_msg = jsonObject.getString("error_msg");
        System.out.println("error_msg:"+error_msg);

        return error_msg;
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
        smsService.sendSms(location.getStudentId());

        return securityService.insertAlert(location)>0?"报警记录成功！":location.getStudentName()+"的报警记录失败！";
    }

    @RequestMapping(value = "/getAlert")
    @ResponseBody
    public String getAlert(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("getAlert ing...");

        AlertInfo alertInfo=new AlertInfo();
        alertInfo.setStudentName(request.getParameter("name"));
        alertInfo.setStartDate(request.getParameter("startDate"));
        alertInfo.setEndDate(request.getParameter("endDate"));


        int curPage;
        if (request.getParameter("page") != null) {
            curPage = Integer.parseInt(request.getParameter("page"));
        } else {
            curPage = 1;
        }

        Integer limit = Integer.parseInt(request.getParameter("limit"));

        System.out.println("alertInfo:"+alertInfo.toString()+"  "+curPage+"  "+limit);


        LayuiData layuiData=new LayuiData();
        layuiData.setCount(securityService.countAlert(alertInfo));
        layuiData.setData(securityService.getAlert(alertInfo,limit,curPage));
        System.out.println("layuiData:"+layuiData);

        return JSON.toJSONString(layuiData);
    }

    @RequestMapping(value = "/getClassSelect")
    @ResponseBody
    public String getClassSelect(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("getClassSelect ing ...");
        return JSON.toJSONString(securityService.getClassSelect());
    }

    @RequestMapping(value = "/getPickup")
    @ResponseBody
    public String getPickup(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("getPickup ing ...");
        PickupInfo pickupInfo=new PickupInfo();

        int curPage;
        if (request.getParameter("page") != null) {
            curPage = Integer.parseInt(request.getParameter("page"));
        } else {
            curPage = 1;
        }

        Integer limit = Integer.parseInt(request.getParameter("limit"));

        System.out.println("curPage : "+curPage+"limit : "+limit);

        if (request.getParameter("class")!=null&&request.getParameter("class")!=""){
            pickupInfo.setClassId(Integer.parseInt(request.getParameter("class")));
        }

        pickupInfo.setStudentName(request.getParameter("name"));

        System.out.println("pickupInfo:"+pickupInfo.toString());

        LayuiData layuiData=new LayuiData();
        layuiData.setData(securityService.getPickup(pickupInfo,limit,curPage));
        layuiData.setCount(securityService.countPickup(pickupInfo));
        System.out.println("LayuiData:"+layuiData.toString());

        return JSON.toJSONString(layuiData);
    }

    @RequestMapping(value = "/getPickupDetail")
    @ResponseBody
    public String getPickupDetail(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("getPickupDetail ing ...");

        int curPage;
        if (request.getParameter("page") != null) {
            curPage = Integer.parseInt(request.getParameter("page"));
        } else {
            curPage = 1;
        }

        Integer limit = Integer.parseInt(request.getParameter("limit"));

        System.out.println("curPage : "+curPage+"limit : "+limit);

        PickupDetail pickupDetail=new PickupDetail();
        pickupDetail.setStudentsId(Integer.parseInt(request.getParameter("studentsId")));
        System.out.println("pickupDetail:"+pickupDetail.toString());

        List<PickupDetail> pickupDetails=securityService.getPickupDetail(pickupDetail);
        System.out.println("List<PickupDetail>:"+JSON.toJSONString(pickupDetails));

        LayuiData layuiData=new LayuiData();
        layuiData.setData(pickupDetails);
        layuiData.setCount(securityService.countPickupDetail(pickupDetail));

        return JSON.toJSONString(layuiData);
    }

    @RequestMapping(value = "/getMonitor")
    @ResponseBody
    public String getMonitor(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("getMonitor ing ...");
        LayuiData layuiData=new LayuiData();
        layuiData.setData(securityService.getMonitor());
        layuiData.setCount(securityService.countMonitor());
        System.err.println("layuiData:"+layuiData.toString());

        return JSON.toJSONString(layuiData);
    }

    @RequestMapping(value = "/getMonitorVideo")
    @ResponseBody
    public String getMonitorVideo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("getMonitorVideo ing ...");

        int curPage;
        if (request.getParameter("page") != null) {
            curPage = Integer.parseInt(request.getParameter("page"));
        } else {
            curPage = 1;
        }

        Integer limit = Integer.parseInt(request.getParameter("limit"));

        System.out.println("curPage : "+curPage+"limit : "+limit);

        MonitorVideo monitorVideo=new MonitorVideo();
        monitorVideo.setVideoName(request.getParameter("name"));
        monitorVideo.setStart(request.getParameter("start"));
        monitorVideo.setEnd(request.getParameter("end"));
        System.out.println("condition monitorVideo:"+monitorVideo.toString());

        LayuiData layuiData=new LayuiData();
        layuiData.setCount(securityService.countMonitorVideo(monitorVideo));
        layuiData.setData(securityService.getMonitorVideo(monitorVideo,limit,curPage));
        System.out.println("layuiData:"+layuiData.toString());

        return JSON.toJSONString(layuiData);
    }

}
