package com.kindergarten.controller;

import com.google.gson.Gson;
import com.kindergarten.bean.*;
import com.kindergarten.mapper.RectorMapper;
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
import java.util.List;


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
                    List<Classes> classesList = rectorService.findClasses(rector.getKinderId());
                    session.setAttribute("classesList", classesList);
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
            request.getSession().setAttribute("rector", rector);
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
        System.out.println(condition);
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
    public String deleteStaff(HttpServletRequest request, HttpServletResponse response, String teacherId, String roleName) throws ServletException, IOException {
        System.out.println(teacherId + roleName);
        String tableName = null;
        String tableId = null;
        if (roleName.equals("班主任")) {
            tableName = "tbl_teachers";
            tableId = "teacher_id";
        } else if (roleName.equals("保健员")) {
            tableName = "tbl_healther";
            tableId = "healther_id";
        } else if (roleName.equals("安防员")) {
            tableName = "tbl_security";
            tableId = "security_id";
        }
        int teacherid = Integer.valueOf(teacherId);
        int flag = rectorService.deleteStaff(tableName, tableId, teacherid);
        if (flag > 0) {
            return "success";
        } else {
            return "error";
        }
    }

    //增加教职工
    @RequestMapping(value = "/addStaffs")
    @ResponseBody
    public String addStaffs(HttpServletRequest request, HttpServletResponse response, String teacherName, String roleId, String telphone, int kinderid) throws ServletException, IOException {
        System.out.println(teacherName + "," + roleId + "," + telphone + "," + kinderid);
        String tableName = null;
        String column1 = null;
        String column2 = null;
        String column3 = null;
        String column4 = null;
        if (roleId.equals("5")) {
            tableName = "tbl_teachers";
            column1 = "teacher_name";
            column2 = "rid";
            column3 = "teacher_tel";
            column4 = "kinder_id";
        } else if (roleId.equals("4")) {
            tableName = "tbl_healther";
            column1 = "healther_name";
            column2 = "rid";
            column3 = "healther_phone";
            column4 = "kid";
        } else if (roleId.equals("3")) {
            tableName = "tbl_security";
            column1 = "security_name";
            column2 = "rid";
            column3 = "security_phone";
            column4 = "kid";
        }
        int roleid = Integer.valueOf(roleId);
        int flag = rectorService.addStaffs(tableName, column1, column2, column3, column4, teacherName, roleid, telphone, kinderid);
        if (flag > 0) {
            //TODO
            Staffs staffs = rectorService.checkNewStaff(tableName, column3, telphone);
            request.getSession().setAttribute("group_id", "teacher");
            request.getSession().setAttribute("user_id", staffs.getTeacherId());
            request.getSession().setAttribute("user_info", teacherName);
            return "success";
        } else {
            return "error";
        }
    }

    //幼儿列表
    @RequestMapping(value = "studentlist")
    @ResponseBody
    public Object studentlist(HttpServletRequest request, HttpServletResponse response, String studentName, String startDate, String endDate, String kinderId) throws ServletException, IOException {
        System.out.println(studentName + "," + startDate + "," + endDate + "," + kinderId);
        int curPage;
        if (request.getParameter("curPage") != null && !"".equals(request.getParameter("curPage").trim())) {
            curPage = Integer.parseInt(request.getParameter("curPage"));
        } else {
            curPage = 1;
        }
        int pageSize;
        if (request.getParameter("pageSize") != null && !"".equals(request.getParameter("pageSize").trim())) {
            pageSize = Integer.parseInt(request.getParameter("pageSize"));
        } else {
            pageSize = 5;
        }
        HashMap<String, Object> condition = new HashMap<>();
        if (kinderId != null && !kinderId.trim().equals("")) {
            condition.put("kinderId", kinderId);
        }
        if (studentName != null && !studentName.trim().equals("")) {
            condition.put("studentName", studentName);
        }
        if (startDate != null && !startDate.trim().equals("")) {
            condition.put("startDate", startDate);
        }
        if (endDate != null && !endDate.trim().equals("")) {
            condition.put("endDate", endDate);
        }
        System.out.println(condition);
        LayuiData<Students> layuiData = rectorService.studentlist(condition, curPage, pageSize);
        return new Gson().toJson(layuiData);
    }

    //增加幼儿
    @RequestMapping(value = "/addBaby")
    @ResponseBody
    public String addBaby(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        String value = request.getParameter("value");
        System.out.println(value);
        Students students = gson.fromJson(value, Students.class);
        int flag = rectorService.addBaby(students);
        if (flag > 0) {
            return "success";
        } else {
            return "error";
        }
    }

    //修改幼儿信息
    @RequestMapping(value = "/updateBaby")
    @ResponseBody
    public String updateBaby(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        String value = request.getParameter("value");
        System.out.println(value);
        Students students = gson.fromJson(value, Students.class);
        int flag = rectorService.updateBaby(students);
        if (flag > 0) {
            return "success";
        } else {
            return "error";
        }
    }

    //删除幼儿
    @RequestMapping(value = "/deleteStudent")
    @ResponseBody
    public String deleteStudent(HttpServletRequest request, HttpServletResponse response, String studentId) throws ServletException, IOException {
        System.out.println(studentId);
        int flag = rectorService.deleteStudent(studentId);
        if (flag > 0) {
            return "success";
        } else {
            return "error";
        }
    }

    //家长列表
    @RequestMapping(value = "parentsList")
    @ResponseBody
    public Object parentsList(HttpServletRequest request, HttpServletResponse response, String parentsName, String startDate, String endDate, String kinderId) throws ServletException, IOException {
        System.out.println(parentsName + "," + startDate + "," + endDate + "," + kinderId);
        int curPage;
        if (request.getParameter("curPage") != null && !"".equals(request.getParameter("curPage").trim())) {
            curPage = Integer.parseInt(request.getParameter("curPage"));
        } else {
            curPage = 1;
        }
        int pageSize;
        if (request.getParameter("pageSize") != null && !"".equals(request.getParameter("pageSize").trim())) {
            pageSize = Integer.parseInt(request.getParameter("pageSize"));
        } else {
            pageSize = 5;
        }
        HashMap<String, Object> condition = new HashMap<>();
        if (kinderId != null && !kinderId.trim().equals("")) {
            condition.put("kinderId", kinderId);
        }
        if (parentsName != null && !parentsName.trim().equals("")) {
            condition.put("parentsName", parentsName);
        }
        if (startDate != null && !startDate.trim().equals("")) {
            condition.put("startDate", startDate);
        }
        if (endDate != null && !endDate.trim().equals("")) {
            condition.put("endDate", endDate);
        }
        System.out.println(condition);
        LayuiData<parentsinfo> layuiData = rectorService.parentsList(condition, curPage, pageSize);
        return new Gson().toJson(layuiData);
    }

    //修改家长信息及相应关系表信息
    @RequestMapping(value = "/updateParents")
    @ResponseBody
    public String updateParents(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        String value = request.getParameter("value");
        System.out.println(value);
        parentsinfo parentsinfo = gson.fromJson(value, parentsinfo.class);
        int flag = rectorService.updateParents(parentsinfo);
        if (flag == 1) {
            return "success";
        } else {
            return "error";
        }
    }

    //删除家长及相应关系表信息
    @RequestMapping(value = "/deleteParents")
    @ResponseBody
    public String deleteParents(HttpServletRequest request, HttpServletResponse response, String parentsId) throws ServletException, IOException {
        System.out.println(parentsId);
        int flag = rectorService.deleteParents(parentsId);
        if (flag == 1) {
            return "success";
        } else {
            return "error";
        }
    }

    //检测学生是否存在
    @RequestMapping(value = "/checkStudent")
    @ResponseBody
    public String checkStudent(HttpServletRequest request, HttpServletResponse response, String studentName) throws ServletException, IOException {
        System.out.println(studentName);
        List<Students> studentsList = rectorService.checkStudent(studentName);
        if (studentsList.size() > 0) {
            return "success";
        } else {
            return "error";
        }
    }

    //增加家长及相应关系表信息
    @RequestMapping(value = "/addParents")
    @ResponseBody
    public String addParents(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        String value = request.getParameter("value");
        System.out.println(value);
        parentsinfo parentsinfo = gson.fromJson(value, parentsinfo.class);
        int flag = rectorService.addParents(parentsinfo);
        if (flag == 1) {
            return "success";
        } else {
            return "error";
        }
    }

    //教师考勤管理列表
    @RequestMapping(value = "attendanceList")
    @ResponseBody
    public Object attendanceList(HttpServletRequest request, HttpServletResponse response, String saStaffname, String saRolename, String kinderId) throws ServletException, IOException {
        System.out.println(saStaffname + "," + saRolename + "," + kinderId);
        int curPage;
        if (request.getParameter("curPage") != null && !"".equals(request.getParameter("curPage").trim())) {
            curPage = Integer.parseInt(request.getParameter("curPage"));
        } else {
            curPage = 1;
        }
        int pageSize;
        if (request.getParameter("pageSize") != null && !"".equals(request.getParameter("pageSize").trim())) {
            pageSize = Integer.parseInt(request.getParameter("pageSize"));
        } else {
            pageSize = 5;
        }
        HashMap<String, Object> condition = new HashMap<>();
        if (kinderId != null && !kinderId.trim().equals("")) {
            condition.put("kinderId", kinderId);
        }
        if (saStaffname != null && !saStaffname.trim().equals("")) {
            condition.put("saStaffname", saStaffname);
        }
        if (saRolename != null && !saRolename.trim().equals("")) {
            condition.put("saRolename", saRolename);
        }
        System.out.println(condition);
        LayuiData<staffAttendance> layuiData = rectorService.attendanceList(condition, curPage, pageSize);
        return new Gson().toJson(layuiData);
    }

    //考勤信息列表
    @RequestMapping(value = "findAttendance")
    @ResponseBody
    public Object findAttendance(HttpServletRequest request, HttpServletResponse response, String staffId, String saRolename, String kinderId) throws ServletException, IOException {
        System.out.println(staffId + "," + saRolename + "," + kinderId);
        int curPage;
        if (request.getParameter("curPage") != null && !"".equals(request.getParameter("curPage").trim())) {
            curPage = Integer.parseInt(request.getParameter("curPage"));
        } else {
            curPage = 1;
        }
        int pageSize;
        if (request.getParameter("pageSize") != null && !"".equals(request.getParameter("pageSize").trim())) {
            pageSize = Integer.parseInt(request.getParameter("pageSize"));
        } else {
            pageSize = 5;
        }
        HashMap<String, Object> condition = new HashMap<>();
        if (kinderId != null && !kinderId.trim().equals("")) {
            condition.put("kinderId", kinderId);
        }
        if (staffId != null && !staffId.trim().equals("")) {
            condition.put("staffId", staffId);
        }
        if (saRolename != null && !saRolename.trim().equals("")) {
            condition.put("saRolename", saRolename);
        }
        System.out.println(condition);
        LayuiData<staffAttendance> layuiData = rectorService.findAttendance(condition, curPage, pageSize);
        return new Gson().toJson(layuiData);
    }

    //班级列表
    @RequestMapping("classList")
    @ResponseBody
    public Object classList(HttpServletRequest request, HttpServletResponse response, String className, String startDate, String endDate, String kinderId) throws ServletException, IOException {
        System.out.println(className + "," + startDate + "," + endDate + "," + kinderId);
        int curPage;
        if (request.getParameter("curPage") != null && !"".equals(request.getParameter("curPage").trim())) {
            curPage = Integer.parseInt(request.getParameter("curPage"));
        } else {
            curPage = 1;
        }
        int pageSize;
        if (request.getParameter("pageSize") != null && !"".equals(request.getParameter("pageSize").trim())) {
            pageSize = Integer.parseInt(request.getParameter("pageSize"));
        } else {
            pageSize = 5;
        }
        HashMap<String, Object> condition = new HashMap<>();
        if (kinderId != null && !kinderId.trim().equals("")) {
            condition.put("kinderId", kinderId);
        }
        if (className != null && !className.trim().equals("")) {
            condition.put("className", className);
        }
        if (startDate != null && !startDate.trim().equals("")) {
            condition.put("startDate", startDate);
        }
        if (endDate != null && !endDate.trim().equals("")) {
            condition.put("endDate", endDate);
        }
        System.out.println(condition);
        LayuiData<Classes> layuiData = rectorService.classList(condition, curPage, pageSize);
        return new Gson().toJson(layuiData);
    }

    //检测班主任是否存在
    @RequestMapping(value = "checkTeacher")
    @ResponseBody
    public String checkTeacher(HttpServletRequest request, HttpServletResponse response, String teacherName) throws ServletException, IOException {
        System.out.println(teacherName);
        List<Teachers> list = rectorService.checkTeacher(teacherName);
        System.out.println(list);
        if (list.size() > 0) {
            return "success";
        } else {
            return "error";
        }
    }

    //增加班级
    @RequestMapping(value = "/addClasses")
    @ResponseBody
    public String addClasses(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        String value = request.getParameter("value");
        System.out.println(value);
        Classes classes = gson.fromJson(value, Classes.class);
        int flag = rectorService.addClasses(classes);
        System.out.println(flag);
        if (flag > 0) {
            return "success";
        } else {
            return "error";
        }
    }

    //修改班级信息
    @RequestMapping(value = "updateClass")
    @ResponseBody
    public String updateClass(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        String value = request.getParameter("value");
        System.out.println(value);
        Classes classes = gson.fromJson(value, Classes.class);
        int flag = rectorService.updateClass(classes);
        if (flag > 0) {
            return "success";
        } else {
            return "error";
        }
    }

    //删除班级
    @RequestMapping(value = "/deleteClass")
    @ResponseBody
    public String deleteClass(HttpServletRequest request, HttpServletResponse response, String classId) throws ServletException, IOException {
        System.out.println(classId);
        int flag = rectorService.deleteClass(classId);
        if (flag > 0) {
            return "success";
        } else {
            return "error";
        }
    }

    //配置课程
    @RequestMapping("findCourse")
    @ResponseBody
    public Object findCourse(HttpServletRequest request, HttpServletResponse response, String kinderId, String classId, String courseTimescope) throws ServletException, IOException {
        System.out.println(kinderId + "," + classId + "," + courseTimescope);
        int curPage;
        if (request.getParameter("curPage") != null && !"".equals(request.getParameter("curPage").trim())) {
            curPage = Integer.parseInt(request.getParameter("curPage"));
        } else {
            curPage = 1;
        }
        int pageSize;
        if (request.getParameter("pageSize") != null && !"".equals(request.getParameter("pageSize").trim())) {
            pageSize = Integer.parseInt(request.getParameter("pageSize"));
        } else {
            pageSize = 5;
        }
        HashMap<String, Object> condition = new HashMap<>();
        if (kinderId != null && !kinderId.trim().equals("")) {
            condition.put("kinderId", kinderId);
        }
        if (classId != null && !classId.trim().equals("")) {
            condition.put("classId", classId);
        }
        if (courseTimescope != null && !courseTimescope.trim().equals("")) {
            condition.put("courseTimescope", courseTimescope);
        }
        System.out.println(condition);
        LayuiData<Course> layuiData = rectorService.findCourse(condition, curPage, pageSize);
        return new Gson().toJson(layuiData);
    }

    //班级成员列表
    @RequestMapping("classMemberList")
    @ResponseBody
    public Object classMemberList(HttpServletRequest request, HttpServletResponse response, String studentName, String className, String startDate, String endDate, String kinderId) throws ServletException, IOException {
        System.out.println(className + "," + studentName + "," + startDate + "," + endDate + "," + kinderId);
        int curPage;
        if (request.getParameter("curPage") != null && !"".equals(request.getParameter("curPage").trim())) {
            curPage = Integer.parseInt(request.getParameter("curPage"));
        } else {
            curPage = 1;
        }
        int pageSize;
        if (request.getParameter("pageSize") != null && !"".equals(request.getParameter("pageSize").trim())) {
            pageSize = Integer.parseInt(request.getParameter("pageSize"));
        } else {
            pageSize = 5;
        }
        HashMap<String, Object> condition = new HashMap<>();
        if (kinderId != null && !kinderId.trim().equals("")) {
            condition.put("kinderId", kinderId);
        }
        if (className != null && !className.trim().equals("")) {
            condition.put("className", className);
        }
        if (studentName != null && !studentName.trim().equals("")) {
            condition.put("studentName", studentName);
        }
        if (startDate != null && !startDate.trim().equals("")) {
            condition.put("startDate", startDate);
        }
        if (endDate != null && !endDate.trim().equals("")) {
            condition.put("endDate", endDate);
        }
        System.out.println(condition);
        LayuiData<ClassMember> layuiData = rectorService.classMemberList(condition, curPage, pageSize);
        return new Gson().toJson(layuiData);
    }

    //校园公告列表
    @RequestMapping("campusNewsList")
    @ResponseBody
    public Object campusNewsList(HttpServletRequest request, HttpServletResponse response, String campusInfoName, String startDate, String endDate, String kinderId) throws ServletException, IOException {
        System.out.println(campusInfoName + "," + startDate + "," + endDate + "," + kinderId);
        int curPage;
        if (request.getParameter("curPage") != null && !"".equals(request.getParameter("curPage").trim())) {
            curPage = Integer.parseInt(request.getParameter("curPage"));
        } else {
            curPage = 1;
        }
        int pageSize;
        if (request.getParameter("pageSize") != null && !"".equals(request.getParameter("pageSize").trim())) {
            pageSize = Integer.parseInt(request.getParameter("pageSize"));
        } else {
            pageSize = 5;
        }
        HashMap<String, Object> condition = new HashMap<>();
        if (kinderId != null && !kinderId.trim().equals("")) {
            condition.put("kinderId", kinderId);
        }
        if (campusInfoName != null && !campusInfoName.trim().equals("")) {
            condition.put("campusInfoName", campusInfoName);
        }
        if (startDate != null && !startDate.trim().equals("")) {
            condition.put("startDate", startDate);
        }
        if (endDate != null && !endDate.trim().equals("")) {
            condition.put("endDate", endDate);
        }
        System.out.println(condition);
        LayuiData<CampusInfo> layuiData = rectorService.campusNewsList(condition, curPage, pageSize);
        return new Gson().toJson(layuiData);
    }

    //增加公告
    @RequestMapping(value = "/addNews")
    @ResponseBody
    public String addNews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        String value = request.getParameter("value");
        System.out.println(value);
        CampusInfo campusInfo = gson.fromJson(value, CampusInfo.class);
        int flag = rectorService.addNews(campusInfo);
        if (flag > 0) {
            return "success";
        } else {
            return "error";
        }
    }

    //修改公告
    @RequestMapping(value = "/updateNews")
    @ResponseBody
    public String updateNews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        String value = request.getParameter("value");
        System.out.println(value);
        CampusInfo campusInfo = gson.fromJson(value, CampusInfo.class);
        int flag = rectorService.updateNews(campusInfo);
        if (flag > 0) {
            return "success";
        } else {
            return "error";
        }
    }

    //删除公告
    @RequestMapping(value = "/deleteNews")
    @ResponseBody
    public String deleteNews(HttpServletRequest request, HttpServletResponse response, String campusInfoId) throws ServletException, IOException {
        System.out.println(campusInfoId);
        int flag = rectorService.deleteNews(campusInfoId);
        if (flag > 0) {
            return "success";
        } else {
            return "error";
        }
    }
    //增加通知
    @RequestMapping(value = "/addInform")
    @ResponseBody
    public String addInform(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        String value = request.getParameter("value");
        System.out.println(value);
        Inform inform = gson.fromJson(value, Inform.class);
        int flag = rectorService.addInform(inform);
        if (flag > 0) {
            return "success";
        } else {
            return "error";
        }
    }
}

