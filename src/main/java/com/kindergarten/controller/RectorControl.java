package com.kindergarten.controller;

import com.google.gson.Gson;
import com.kindergarten.bean.*;
import com.kindergarten.service.RectorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;


@RequestMapping("RectorControl")
@Controller
public class RectorControl extends HttpServlet {
    @Autowired
    RectorService rectorService;

    //园长登录
    @RequestMapping("login")
    @ResponseBody
    public String login(String rectorTel, String rectorPwd, String vCode, HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println(rectorTel + rectorPwd + vCode);
        String vCodeServer = (String) request.getSession().getAttribute("vCode");
        System.out.println(vCodeServer);
        request.getSession().removeAttribute("vCode");
        if (vCode.equalsIgnoreCase(vCodeServer)) {
            Rector rector = rectorService.login(rectorTel, rectorPwd);
            if (rector != null) {
                if (rector.getRectorStatus() == (2)) {
                    return "登陆失败,账户被封禁！";
                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("rector", rector);
                    return "登陆成功";
                }
            } else {
                return "手机号或密码错误";
            }
        } else {
            return "验证码错误";
        }
    }

    //个人信息修改
    @RequestMapping(value = "/updateSelf")
    @ResponseBody
    public String updateSelf(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        String value = request.getParameter("value");
        System.out.println(value);
        Rector rector = gson.fromJson(value, Rector.class);
        System.out.println(gson.toJson(rector));
        int flag = rectorService.updateSelf(rector);
        if (flag > 0) {
            request.getSession().setAttribute("healther", rector);
            return "success";
        } else {
            return "error";
        }
    }

    //园所资格审批
    @RequestMapping(value = "/addKinder")
    @ResponseBody
    public String addKinder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        String value = request.getParameter("value");
        System.out.println(value);
        Kinder kinder = gson.fromJson(value, Kinder.class);
        System.out.println(gson.toJson(kinder));
        int flag = rectorService.addKinder(kinder);
        if (flag > 0) {
            return "success";
        } else {
            return "error";
        }
    }

    //教职工列表
    @RequestMapping(value = "stafflist")
    @ResponseBody
    public Object stafflist(HttpServletRequest request, HttpServletResponse response, String teacherName, String kinderId) throws ServletException, IOException {
        int curPage;
        if (request.getParameter("curPage") != null && !"".equals(request.getParameter("curPage").trim())) {
            curPage = Integer.parseInt(request.getParameter("curPage"));
        } else {
            curPage = 1;
        }
        HashMap<String, Object> condition = new HashMap<>();
        if (teacherName != null && !teacherName.trim().equals("")) {
            condition.put("teacherName", teacherName);
        }
        if (kinderId != null && !kinderId.trim().equals("")) {
            condition.put("kinderId", kinderId);
        }
        int pageSize;
        if (request.getParameter("pageSize") != null && !"".equals(request.getParameter("pageSize").trim())) {
            pageSize = Integer.parseInt(request.getParameter("pageSize"));
        } else {
            pageSize = 5;
        }
        LayuiData<Staffs> layuiData = rectorService.stafflist(condition, curPage, pageSize);
        return new Gson().toJson(layuiData);
    }

    //删除教职工
    @RequestMapping(value = "deleteStaff")
    @ResponseBody
    public String deleteStaff(HttpServletRequest request, HttpServletResponse response,String teacherId,String roleName) throws ServletException, IOException {
        System.out.println(teacherId+roleName);
        String tableName =null;
        String tableId =null;
        if(roleName.equals("班主任")){
            tableName="tbl_teachers";
            tableId="teacher_id";
        }else if(roleName.equals("保健员")){
            tableName="tbl_healther";
            tableId="healther_id";
        }else if(roleName.equals("安防员")){
            tableName="tbl_security";
            tableId="security_id";
        }
        int teacherid=Integer.valueOf(teacherId);
        int flag=rectorService.deleteStaff(tableName,tableId,teacherid);
        if (flag>0){
            return "success";
        }else{
            return "error";
        }
    }

    //    @RequestMapping(value = "/addExamination")
//    @ResponseBody
//    public String addExamination(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        Gson gson=new Gson();
//        String value=request.getParameter("value");
//        Examination examination=gson.fromJson(value, Examination.class);
//        int flag=healtherService.addExamination(examination);
//        if (flag>0){
//            return "success";
//        }else{
//            return "error";
//        }
//    }
//    @RequestMapping(value = "meallist")
//    @ResponseBody
//    public Object meallist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int curPage;
//        if(request.getParameter("curPage")!=null&&!"".equals(request.getParameter("curPage").trim())){
//            curPage = Integer.parseInt(request.getParameter("curPage"));
//        }else{
//            curPage = 1;
//        }
//        int pageSize;
//        if(request.getParameter("pageSize")!=null&&!"".equals(request.getParameter("pageSize").trim())){
//            pageSize=Integer.parseInt(request.getParameter("pageSize"));
//        }else{
//            pageSize = 5;
//        }
//        LayuiData<Meal> layuiData = healtherService.meallist(curPage,pageSize);
//        return new Gson().toJson(layuiData);
//    }
//    @RequestMapping(value = "/addmeal")
//    @ResponseBody
//    public String addmeal(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        Gson gson=new Gson();
//        String value=request.getParameter("value");
//        Meal meal=gson.fromJson(value, Meal.class);
//        int flag=healtherService.addmeal(meal);
//        if (flag>0){
//            return "success";
//        }else{
//            return "error";
//        }
//    }
//    @RequestMapping(value = "/updatemeal")
//    @ResponseBody
//    public String updatemeal(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        Gson gson = new Gson();
//        String value = request.getParameter("value");
//        Meal meal = gson.fromJson(value, Meal.class);
//        int flag = healtherService.updatemeal(meal);
//        if (flag > 0) {
//            return "success";
//        } else {
//            return "error";
//        }
//    }
}

