package com.kindergarten.controller;


import com.alibaba.fastjson.JSON;
import com.kindergarten.bean.*;
import com.kindergarten.service.AdminService;
import com.kindergarten.service.MenuService;
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
@RequestMapping("platformController")
public class PlatformControler {

    @Autowired
    AdminService adminService;

    @Autowired
    MenuService menuService;


    @RequestMapping(value = "/login")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String login(HttpServletRequest request, HttpServletResponse response, String adminTel, String adminPwd) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");

        Admin admin1 = adminService.login(adminTel,adminPwd);
        if (admin1 != null) {
            //菜单列表
            List<Menu> menu = menuService.findMenuList(adminTel);
//            System.out.println(menu);
//            System.out.println("菜单信息："+menu.size());
            System.out.println("admin1:"+ JSON.toJSONString(admin1));
            request.getSession().setAttribute("menu", menu);
            request.getSession().setAttribute("admin", admin1);


            return "success";
        } else {
            return " 账号或密码不正确";
        }


    }
    @RequestMapping(value = "/updatePwd")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String updatePwd( Admin admin) throws ServletException, IOException {

    String msg=null;
    msg=adminService.updatePwd(admin);

    return msg;

    }
    @RequestMapping(value = "/selectParents")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String selectParents(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        response.setCharacterEncoding("utf-8");//前端数据转发的格式
        response.setContentType("text/html;charset=utf-8");
//        System.out.println("分页查询");
        LayuiData<Parents> layuiData=null;
        HashMap<String, Object> condition = new HashMap<>();
      int roleID = Integer.parseInt(request.getParameter("roleID"));//获取前端给的角色id
        int curPage;
        if (request.getParameter("curPage") != null) {
            curPage = Integer.parseInt(request.getParameter("curPage"));
        } else {
            curPage = 1;
        }
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
//        System.out.println("从第几页：" + curPage + "   查询页数：" + pageSize);
        String parentsName = request.getParameter("parentsName");

        if (parentsName != null && parentsName.trim() != "") {
            condition.put("parentsName", parentsName);
        }
        String teacherName=request.getParameter("teacherName");
        if(teacherName != null && teacherName.trim() != "") {
            condition.put("teacherName", teacherName);
        }
        String healtherName=request.getParameter("healtherName");
        if(healtherName != null && healtherName.trim() != "") {
            condition.put("healtherName", healtherName);
        }

        String securityName=request.getParameter("securityName");
        if(securityName != null && securityName.trim() != "") {
            condition.put("securityName", securityName);
        }
        String rectorName=request.getParameter("rectorName");
        if(rectorName != null && rectorName.trim() != "") {
            condition.put("rectorName", rectorName);
        }
        layuiData = adminService.selectParent(condition, curPage, pageSize,roleID);
        return JSON.toJSONString(layuiData);
    }
    //禁用/启用
    @RequestMapping(value = "/updateParents")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String updateParents(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String title = " ";
        response.setContentType("text/html;charset=utf-8");
        int roleId=Integer.parseInt(request.getParameter("roleId"));
        String msg = request.getParameter("id");
        String type = request.getParameter("type");
        System.out.println("msg:" + msg + "   type:" + type);
        if (type != null && type.trim() != "") {
            int typeMath = Integer.parseInt(request.getParameter("type"));
            if (msg != null && msg.trim() != "") {
                int id = Integer.parseInt(msg);
                int a = adminService.updateParents( id,typeMath,roleId);
                if (a > 0) {
                    title = "success";
                }
            }
        }
        return title;
    }
    //禁用/启用
    @RequestMapping(value = "/insertParents")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String insertParents(Parents parents) throws IOException {
        //判断是偶存在
        String msg=null;
        if (parents.getParentsTel()!=null && parents.getParentsTel().trim()!=""){
            boolean b=adminService.selectOneByparents(parents.getParentsTel());
            if (b){
                msg= adminService.insertParents(parents);
            }else {
                msg="该账号已存在";
            }
        }
        return msg;
    }

    @RequestMapping(value = "/insertTeacher")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String insertTeacher(Teachers teachers) throws IOException {
        String msg=null;
        msg=adminService.insertTeacher(teachers);
        return msg;
    }

    @RequestMapping(value = "/insertHealther")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String insertHealther(Healther healther) throws IOException {
        String msg=null;
        msg=adminService.insertHealther(healther);
        return msg;
    }

    @RequestMapping(value = "/insertSecurity")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String insertSecurity(Security security) throws IOException {
        String msg=null;
        msg=adminService.insertSercurity(security);
        return msg;
    }
    @RequestMapping(value = "/insertRector")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String insertRector(Rector rector) throws IOException {
        String msg=null;
        msg=adminService.insertRector(rector);
        return msg;
    }
    @RequestMapping(value = "/selectStudent")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String selectStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        response.setCharacterEncoding("utf-8");//前端数据转发的格式
        response.setContentType("text/html;charset=utf-8");
//        System.out.println("分页查询");
        LayuiData<Students> layuiData=null;
        HashMap<String, Object> condition = new HashMap<>();
        int curPage;
        if (request.getParameter("curPage") != null) {
            curPage = Integer.parseInt(request.getParameter("curPage"));
        } else {
            curPage = 1;
        }
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));

        String studentName=request.getParameter("studentName");
        if(studentName != null && studentName.trim() != "") {
            condition.put("studentName", studentName);
        }
        layuiData = adminService.selectStudent(condition, curPage, pageSize);
        return JSON.toJSONString(layuiData);
    }
    @RequestMapping(value = "/selectClassName")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String selectClassName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Students>list=adminService.selectClassName();
//        request.getSession().setAttribute("students",students);
     return JSON.toJSONString(list);
    }
    @RequestMapping(value = "/findClassesList")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String findClassesList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Classes>list=adminService.findClassesList();
//        request.getSession().setAttribute("students",students);
        System.out.println(JSON.toJSONString(list));
        return JSON.toJSONString(list);
    }

    @RequestMapping(value = "/selectClasses")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String selectClasses(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int kinderId=Integer.parseInt(request.getParameter("kinderId"));
        List<Classes>list=adminService.selectClasses(kinderId);
//        request.getSession().setAttribute("students",students);
        System.out.println(JSON.toJSONString(list));
        return JSON.toJSONString(list);
    }

    @RequestMapping(value = "/insertStudent")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String insertStudent(Students students) throws IOException {
        String msg=null;
       msg=adminService.insertStudent(students);
//        System.out.println("students"+JSON.toJSONString(students));
        return msg;
    }
}

