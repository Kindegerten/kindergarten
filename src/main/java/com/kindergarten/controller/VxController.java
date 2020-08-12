package com.kindergarten.controller;

import com.alibaba.fastjson.JSON;
import com.kindergarten.bean.*;
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
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/vx")
public class VxController {
    @Autowired
    ParentService parentService;
    @Autowired
    ParentsMapper parentsMapper;


    @RequestMapping(value = "/login")
    @ResponseBody
    public String Login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tel = request.getParameter("tel");
        String password = request.getParameter("password");



        request.getSession().removeAttribute("vcode"); //错了就换新的验证码：

            Parents parents=parentService.login(tel);
            if (parents!=null) {
                if (password.equals(parents.getParentsPwd())){

                    if (parents.getParentsStatus()==2){
                        return "登陆失败,账户被封禁！";
                    }else {
                        String roleName = parentsMapper.FindRole(parents.getRoleID());
                        parents.setRoleName(roleName);
                        request.getSession().setAttribute("parents",parents);


                        //查该家长的孩子list
                        List<Students> studentlist=parentService.studentsList(parents.getParentsId());
                        request.getSession().setAttribute("MyChild",studentlist);
                        System.out.println(JSON.toJSONString(studentlist));

                        return parents.getParentsId()+"";
                    }

                }else {

                    return "账号或密码错误";
                }

            }else {
                return "无此账号";
            }


    }

    @RequestMapping(value = "/findkid")
    @ResponseBody
    public String findkid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("ssss");
        String parentId=request.getParameter("parentId");
        List<Students> studentlist=parentService.studentsList(Integer.parseInt(parentId));

        return JSON.toJSONString(studentlist);
    }

    @RequestMapping(value = "/addkid")
    @ResponseBody
    public String addkid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentId=request.getParameter("studentId");

        String studentName=request.getParameter("studentName");
        System.out.println(studentId);
        System.out.println(studentName);
//
//            request.getSession().setAttribute("studentId",studentId);
//            request.getSession().setAttribute("studentName",studentName);
        HashMap<String,String> map =new HashMap<>();
        map.put("studentId",studentId);
        map.put("studentName",studentName);

        return JSON.toJSONString(map);
    }

    @RequestMapping(value = "/babyhealth")
    @ResponseBody
    public String babyhealth(HttpServletRequest request) throws ServletException, IOException {
        int curPage;
        if(request.getParameter("curPage")!=null){
            curPage = Integer.parseInt(request.getParameter("curPage"));
        }else{
            curPage = 1;
        }


            String studentId=request.getParameter("studentId");
        int pageSize=parentsMapper.SearchBabyHeathCount(Integer.parseInt(studentId));


        LayuiData<Examination> examinations=parentService.examination(Integer.parseInt(studentId),curPage,pageSize);

        return JSON.toJSONString(examinations);
    }

    @RequestMapping(value = "/searchmeal")
    @ResponseBody
    public String searchmeal(HttpServletRequest request) throws ServletException, IOException {
        String studentid= request.getParameter("studentId");

        int curPage;
        if(request.getParameter("curPage")!=null){
            curPage = Integer.parseInt(request.getParameter("curPage"));
        }else{
            curPage = 1;
        }


        PageBean<Meal> pageBean=parentService.meals(Integer.parseInt(studentid),curPage,3);

//        return JSON.toJSONString(examinations);
        request.setAttribute("meals",pageBean);
        System.out.println(JSON.toJSONString(pageBean));
        return JSON.toJSONString(pageBean);
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
        String studentID= request.getParameter("studentId");
        int pageSize=parentsMapper.CampusInfoCount(Integer.parseInt(studentID));
//        Students students= (Students) request.getSession().getAttribute("students");

//        int studentID= (int)

        LayuiData<CampusInfo> layuiData=parentService.CampusInfo(Integer.parseInt(studentID),curPage,5);
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
//        int pageSize=Integer.parseInt(request.getParameter("pageSize"));
        LayuiData<PlatformInfo> layuiData=parentService.PlatformInfo(curPage,5);
        System.out.println(JSON.toJSONString(layuiData.getData()));
        return JSON.toJSONString(layuiData);
    }


}
