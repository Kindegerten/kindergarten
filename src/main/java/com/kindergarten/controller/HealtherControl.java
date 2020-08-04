package com.kindergarten.controller;

import com.google.gson.Gson;
import com.kindergarten.bean.Examination;
import com.kindergarten.bean.Healther;
import com.kindergarten.bean.LayuiData;
import com.kindergarten.bean.Meal;
import com.kindergarten.service.HealtherService;
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


@RequestMapping("HealtherControl")
@Controller
public class HealtherControl extends HttpServlet {
    @Autowired
    HealtherService healtherService;
//保健员登录
    @RequestMapping("login")
    @ResponseBody
    public String login(String healtherPhone, String healtherPwd, String vCode, HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println(healtherPhone + healtherPwd + vCode);
        String vCodeServer = (String) request.getSession().getAttribute("vCode");
        System.out.println(vCodeServer);
        request.getSession().removeAttribute("vCode");
        if (vCode.equalsIgnoreCase(vCodeServer)) {
            Healther healther = healtherService.login(healtherPhone, healtherPwd);
            if (healther != null) {
                if(healther.getHealtherStatus().equals(2)){
                    return "登陆失败,账户被封禁！";
                }else {
                    HttpSession session = request.getSession();
                    session.setAttribute("healther", healther);
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
        Gson gson=new Gson();
        String value=request.getParameter("value");
        String oldpwd=request.getParameter("oldhealtherPwd");
        System.out.println(oldpwd);
        System.out.println(value);
        Healther newhealther=gson.fromJson(value, Healther.class);
        System.out.println(gson.toJson(newhealther));
        int flag=healtherService.updateSelf(newhealther);
        if (flag>0){
            request.getSession().setAttribute("healther",newhealther);
            return "success";
        }else{
            return "error";
        }
    }
    //体检管理列表
    @RequestMapping(value = "bodyCheck")
    @ResponseBody
    public Object bodyCheck(HttpServletRequest request, HttpServletResponse response,String kinderName,String className) throws ServletException, IOException {
        int curPage;
        if(request.getParameter("curPage")!=null&&!"".equals(request.getParameter("curPage").trim())){
            curPage = Integer.parseInt(request.getParameter("curPage"));
        }else{
            curPage = 1;
        }
        HashMap<String,Object> condition = new HashMap<>();
        if (kinderName!=null&&!kinderName.trim().equals("")){
            condition.put("kinderName",kinderName);
        }
        if (className!=null&&!className.trim().equals("")){
            condition.put("className",className);
        }
        int pageSize;
        if(request.getParameter("pageSize")!=null&&!"".equals(request.getParameter("pageSize").trim())){
            pageSize=Integer.parseInt(request.getParameter("pageSize"));
        }else{
            pageSize = 5;
        }
        LayuiData<Examination> layuiData = healtherService.bodyCheck(condition,curPage,pageSize);
        return new Gson().toJson(layuiData);
    }

    @RequestMapping(value = "/addExamination")
    @ResponseBody
    public String addExamination(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson=new Gson();
        String value=request.getParameter("value");
        Examination examination=gson.fromJson(value, Examination.class);
        int flag=healtherService.addExamination(examination);
        if (flag>0){
            return "success";
        }else{
            return "error";
        }
    }
    @RequestMapping(value = "/updateExamination")
    @ResponseBody
    public String updateExamination(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson=new Gson();
        String value=request.getParameter("value");
        Examination examination=gson.fromJson(value, Examination.class);
        int flag=healtherService.updateExamination(examination);
        if (flag>0){
            return "success";
        }else{
            return "error";
        }
    }

    @RequestMapping(value = "meallist")
    @ResponseBody
    public Object meallist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int curPage;
        if(request.getParameter("curPage")!=null&&!"".equals(request.getParameter("curPage").trim())){
            curPage = Integer.parseInt(request.getParameter("curPage"));
        }else{
            curPage = 1;
        }
        int pageSize;
        if(request.getParameter("pageSize")!=null&&!"".equals(request.getParameter("pageSize").trim())){
            pageSize=Integer.parseInt(request.getParameter("pageSize"));
        }else{
            pageSize = 5;
        }
        LayuiData<Meal> layuiData = healtherService.meallist(curPage,pageSize);
        return new Gson().toJson(layuiData);
    }
    @RequestMapping(value = "/addmeal")
    @ResponseBody
    public String addmeal(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson=new Gson();
        String value=request.getParameter("value");
        Meal meal=gson.fromJson(value, Meal.class);
        int flag=healtherService.addmeal(meal);
        if (flag>0){
            return "success";
        }else{
            return "error";
        }
    }
    @RequestMapping(value = "/updatemeal")
    @ResponseBody
    public String updatemeal(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        String value = request.getParameter("value");
        Meal meal = gson.fromJson(value, Meal.class);
        int flag = healtherService.updatemeal(meal);
        if (flag > 0) {
            return "success";
        } else {
            return "error";
        }
    }
}

