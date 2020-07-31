package com.kindergarten.controller;

import com.kindergarten.bean.TblTeachers;
import com.kindergarten.mapper.TeacherMapper;
import com.kindergarten.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@RequestMapping("/tc")
@Controller
public class TeacherController {

    @Autowired
    private TeacherService teacherService;
    @Autowired
    private TeacherMapper teacherMapper;

    @RequestMapping("/login")
    @ResponseBody
    public String teachersLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tel = request.getParameter("tel");
        System.out.println("tel:"+tel);
        String password = request.getParameter("password");
        System.out.println("password:"+password);
        TblTeachers tblTeachers = teacherService.login(tel);
        System.out.println("tblTeachers.....:"+tblTeachers);
        String res = "";
        if (tblTeachers != null) {

//            String roleName = teacherMapper.FindRole(tblTeachers.getTeacherId());
//            tblTeachers.setTeacherName(roleName);
            System.out.println("成功......");

            if (password.equals(tblTeachers.getTeacherPwd())) {

                HttpSession session = request.getSession();
                session.setAttribute("tblTeachers", tblTeachers);
                session.setAttribute("name", tblTeachers.getTeacherName());
                System.out.println("1111111:");
                res = "1";

                return res;

            }else{
                System.out.println("密码错误！");
                res = "0";
                return res;
            }
        } else {
            System.out.println("账号错误");
            res = "0";
            return res;
        }

    }

    @RequestMapping(value = "/UpdatePwd")
    @ResponseBody
    public String UpdatePwd(String oldpwd,String newpwd,HttpServletRequest request) throws ServletException, IOException {

        TblTeachers tblTeachers = (TblTeachers) request.getSession().getAttribute("tblTeachers");

        if (oldpwd.equals(tblTeachers.getTeacherPwd())){

            int pwd = teacherMapper.updatePwd(tblTeachers.getTeacherTel(), newpwd);

            if (pwd>0){
                tblTeachers.setTeacherPwd(newpwd);
                request.getSession().setAttribute("tblTeachers",tblTeachers);
                return "success";
            }else {
                return "error";
            }
        }else {
            return "error";
        }

    }

}
