package com.kindergarten.controller;


import com.alibaba.fastjson.JSON;
import com.google.gson.Gson;
import com.kindergarten.bean.*;
import com.kindergarten.mapper.MenuMapper;
import com.kindergarten.service.AdminService;
import com.kindergarten.service.MenuService;
import com.kindergarten.service.ParameterService;
import com.kindergarten.util.FtpUtil;
import com.kindergarten.util.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("platformController")
public class PlatformControler {

    @Autowired
    AdminService adminService;

    @Autowired
    MenuService menuService;

    @Autowired
    ParameterService parameterService;

    @Autowired
    MenuMapper menuMapper;

    @RequestMapping(value = "/login")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String login(HttpServletRequest request, HttpServletResponse response, String adminTel, String adminPwd) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        String md5Pwd = MD5Utils.md5(adminPwd);
        Admin admin1 = adminService.login(adminTel, md5Pwd);//默认密码为1234
        if (admin1 != null) {
            //菜单列表
            List<Menu> menu = menuService.findMenuList(adminTel);
//            System.out.println("admin1:" + JSON.toJSONString(admin1));
            request.getSession().setAttribute("menu", menu);
            request.getSession().setAttribute("admin", admin1);
//            System.out.println("menu"+JSON.toJSONString(menu));
            return "success";
            //  return JSON.toJSONString(menu);
        } else {
            return " 账号或密码不正确";
        }


    }

    @RequestMapping(value = "/updatePwd")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String updatePwd(Admin admin) throws ServletException, IOException {

        String msg = null;
        msg = adminService.updatePwd(admin);

        return msg;

    }

    @RequestMapping(value = "/selectParents")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String selectParents(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        response.setCharacterEncoding("utf-8");//前端数据转发的格式
        response.setContentType("text/html;charset=utf-8");
//        System.out.println("分页查询");
        LayuiData<Parents> layuiData = null;
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
        String teacherName = request.getParameter("teacherName");
        if (teacherName != null && teacherName.trim() != "") {
            condition.put("teacherName", teacherName);
        }
        String healtherName = request.getParameter("healtherName");
        if (healtherName != null && healtherName.trim() != "") {
            condition.put("healtherName", healtherName);
        }

        String securityName = request.getParameter("securityName");
        if (securityName != null && securityName.trim() != "") {
            condition.put("securityName", securityName);
        }
        String rectorName = request.getParameter("rectorName");
        if (rectorName != null && rectorName.trim() != "") {
            condition.put("rectorName", rectorName);
        }
        layuiData = adminService.selectParent(condition, curPage, pageSize, roleID);
        System.out.println("layuiData" + JSON.toJSONString(layuiData));
        return JSON.toJSONString(layuiData);
    }

    @RequestMapping(value = "/selectPlatformInfo")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String selectPlatformInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        response.setCharacterEncoding("utf-8");//前端数据转发的格式
        response.setContentType("text/html;charset=utf-8");

        LayuiData<PlatformInfo> layuiData = null;
        HashMap<String, Object> condition = new HashMap<>();
        String start = request.getParameter("start");

        if (start != null && start.trim() != "") {
            condition.put("start", start);
        }
        String end = request.getParameter("end");

        if (end != null && end.trim() != "") {
            condition.put("end", end);
        }
        System.out.println("start" + start + "end" + end);
        int curPage;
        if (request.getParameter("curPage") != null) {
            curPage = Integer.parseInt(request.getParameter("curPage"));
        } else {
            curPage = 1;
        }
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
//        System.out.println("从第几页：" + curPage + "   查询页数：" + pageSize);
        String platformInfoName = request.getParameter("platformInfoName");

        if (platformInfoName != null && platformInfoName.trim() != "") {
            condition.put("platformInfoName", platformInfoName);
        }
        layuiData = adminService.selectPlatformInfo(condition, curPage, pageSize);
        return JSON.toJSONString(layuiData);
    }

    //禁用/启用
    @RequestMapping(value = "/updateParents")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String updateParents(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String title = " ";
        response.setContentType("text/html;charset=utf-8");
        int roleId = Integer.parseInt(request.getParameter("roleId"));
        String msg = request.getParameter("id");
        String type = request.getParameter("type");
        System.out.println("msg:" + msg + "   type:" + type);
        if (type != null && type.trim() != "") {
            int typeMath = Integer.parseInt(request.getParameter("type"));
            if (msg != null && msg.trim() != "") {
                int id = Integer.parseInt(msg);
                int a = adminService.updateParents(id, typeMath, roleId);
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
        String msg = null;
        if (parents.getParentsTel() != null && parents.getParentsTel().trim() != "") {
            boolean b = adminService.selectOneByparents(parents.getParentsTel());
            if (b) {
                msg = adminService.insertParents(parents);
            } else {
                msg = "该账号已存在";
            }
        }
        return msg;
    }

    @RequestMapping(value = "/insertTeacher")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String insertTeacher(Teachers teachers) throws IOException {
        String msg = null;
        msg = adminService.insertTeacher(teachers);
        return msg;
    }

    @RequestMapping(value = "/insertHealther")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String insertHealther(Healther healther) throws IOException {
        String msg = null;
        msg = adminService.insertHealther(healther);
        return msg;
    }

    @RequestMapping(value = "/insertSecurity")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String insertSecurity(Security security) throws IOException {
        String msg = null;
        msg = adminService.insertSercurity(security);
        return msg;
    }

    @RequestMapping(value = "/insertRector")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String insertRector(Rector rector) throws IOException {
        String msg = null;
        msg = adminService.insertRector(rector);
        return msg;
    }

    @RequestMapping(value = "/selectStudent")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String selectStudent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        response.setCharacterEncoding("utf-8");//前端数据转发的格式
        response.setContentType("text/html;charset=utf-8");
//        System.out.println("分页查询");
        LayuiData<Students> layuiData = null;
        HashMap<String, Object> condition = new HashMap<>();

        int curPage;
        if (request.getParameter("curPage") != null) {
            curPage = Integer.parseInt(request.getParameter("curPage"));
        } else {
            curPage = 1;
        }
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));

        String studentName = request.getParameter("studentName");
        if (studentName != null && studentName.trim() != "") {
            condition.put("studentName", studentName);
        }
        layuiData = adminService.selectStudent(condition, curPage, pageSize);
        return JSON.toJSONString(layuiData);
    }

    @RequestMapping(value = "/selectClassName")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String selectClassName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Students> list = adminService.selectClassName();
//        request.getSession().setAttribute("students",students);
        return JSON.toJSONString(list);
    }

    @RequestMapping(value = "/findClassesList")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String findClassesList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Classes> list = adminService.findClassesList();
//        request.getSession().setAttribute("students",students);
        System.out.println(JSON.toJSONString(list));
        return JSON.toJSONString(list);
    }

    @RequestMapping(value = "/selectClasses")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String selectClasses(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int kinderId = Integer.parseInt(request.getParameter("kinderId"));
        List<Classes> list = adminService.selectClasses(kinderId);
//        request.getSession().setAttribute("students",students);
        System.out.println(JSON.toJSONString(list));
        return JSON.toJSONString(list);
    }

    @RequestMapping(value = "/insertStudent")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String insertStudent(Students students) throws IOException {
        String msg = null;
        msg = adminService.insertStudent(students);
//        System.out.println("students"+JSON.toJSONString(students));
        return msg;
    }

    @RequestMapping(value = "/deletePlatformInfo")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String deletePlatformInfo(int platformInfoId) throws IOException {
        String msg = null;
        msg = adminService.deletePlatformInfo(platformInfoId);
//        System.out.println("students"+JSON.toJSONString(students));
        return msg;
    }

    @RequestMapping(value = "/releaseOrCancel")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String releaseOrCancel(int platformInfoId, String title) throws IOException {
        String msg = null;
        msg = adminService.releaseOrCancel(platformInfoId, title);
//        System.out.println("students"+JSON.toJSONString(students));
        return msg;
    }

    @RequestMapping(value = "/updatePlatformInfo")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String updatePlatformInfo(PlatformInfo platformInfo) throws IOException {
        String msg = null;
        msg = adminService.updatePlatformInfo(platformInfo);
//        System.out.println("students"+JSON.toJSONString(students));
        return msg;
    }

    @RequestMapping(value = "/insertPlatformInfo")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String insertPlatformInfo(PlatformInfo platformInfo) throws IOException {
        System.out.println("platformInfo" + JSON.toJSONString(platformInfo));
        String msg = null;
        msg = adminService.insertPlatformInfo(platformInfo);
//        System.out.println("students"+JSON.toJSONString(students));
        return msg;
    }

    @RequestMapping(value = "/selectOneMenu")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String selectOneMenu() throws IOException {
        List<Menu> list = null;
        list = menuService.selectOneMenu();
//        System.out.println("students"+JSON.toJSONString(students));
        return JSON.toJSONString(list);
    }

    @RequestMapping(value = "/selectMenuList")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String selectMenuList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
//        System.out.println("分页查询");
        LayuiData<Students> layuiData = null;
        HashMap<String, Object> condition = new HashMap<>();

        int curPage;
        if (request.getParameter("curPage") != null) {
            curPage = Integer.parseInt(request.getParameter("curPage"));
        } else {
            curPage = 1;
        }
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));

        String menuName = request.getParameter("menuName");
        if (menuName != null && menuName.trim() != "") {
            condition.put("menuName", menuName);
        }
        String parentId = request.getParameter("parentId");
        if (parentId != null && parentId.trim() != "") {
            condition.put("parentId", Integer.parseInt(parentId));
        }
        layuiData = menuService.selectMenuList(condition, curPage, pageSize);
        return JSON.toJSONString(layuiData);
    }

    @RequestMapping(value = "/deleteMenu")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String deleteMenu(int menuId) throws IOException {

        String msg = null;
        msg = menuService.deleteMenu(menuId);
        return msg;
    }

    @RequestMapping(value = "/updateMenu")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String updateMenu(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        System.out.println("menu"+JSON.toJSONString(menu));
        HashMap<String, Object> condition = new HashMap<>();
        String menuId = request.getParameter("menuId");
        if (menuId != null && menuId.trim() != "") {
            condition.put("menuId", Integer.parseInt(menuId));
        }
        String parentId = request.getParameter("parentId");
        if (parentId != null && parentId.trim() != "") {
            condition.put("parentId", Integer.parseInt(parentId));
        }
        String menuName = request.getParameter("menuName");
        if (menuName != null && menuName.trim() != "") {
            condition.put("menuName", menuName);
        }
        String menuUrl = request.getParameter("menuUrl");
        if (menuUrl != null && menuUrl.trim() != "") {
            condition.put("menuUrl", menuUrl);
        }
        String orderId = request.getParameter("orderId");
        if (orderId != null && orderId.trim() != "") {
            condition.put("orderId", Integer.parseInt(orderId));
        }
        String msg = null;
        msg = menuService.updateMenu(condition);
        return msg;
    }

    @RequestMapping(value = "/insertMenu")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String insertMenu(Menu menu) throws IOException {
//        String parentIdMsg=menu.getParentId();
        System.out.println("menu" + JSON.toJSONString(menu));
        String msg = null;
        msg = menuService.insertMenu(menu);
        return msg;
    }

    @RequestMapping(value = "/selectParameterList")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String selectParameterList(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        System.out.println("menu"+JSON.toJSONString(menu));
        HashMap<String, Object> condition = new HashMap<>();
        LayuiData layuiData = null;
        String parameterText = request.getParameter("parameterText");
        if (parameterText != null && parameterText.trim() != "") {
            condition.put("parameterText", parameterText);
        }
        String parameterType = request.getParameter("parameterType");
        if (parameterType != null && parameterType.trim() != "") {
            condition.put("parameterType", parameterType);
        }
        int curPage;
        if (request.getParameter("curPage") != null) {
            curPage = Integer.parseInt(request.getParameter("curPage"));
        } else {
            curPage = 1;
        }
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        layuiData = parameterService.selectParameterList(condition, curPage, pageSize);

        return JSON.toJSONString(layuiData);
    }

    @RequestMapping(value = "/selectParameterType")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String selectParameterType(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<Parameter> list = null;
        list = parameterService.selectParameterType();
        System.out.println("JSON.toJSONString(list)" + JSON.toJSONString(list));
        return JSON.toJSONString(list);
    }

    @RequestMapping(value = "/deleteParameter")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String deleteParameter(int parameterId) throws IOException {
        String msg = null;
        msg = parameterService.deleteParameter(parameterId);
        return msg;
    }

    @RequestMapping(value = "/updateParameter")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String updateParameter(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        System.out.println("menu"+JSON.toJSONString(menu));
        HashMap<String, Object> condition = new HashMap<>();
        String parameterId = request.getParameter("parameterId");
        if (parameterId != null && parameterId.trim() != "") {
            condition.put("parameterId", Integer.parseInt(parameterId));
        }

        String parameterText = request.getParameter("parameterText");
        if (parameterText != null && parameterText.trim() != "") {
            condition.put("parameterText", parameterText);
        }
        //只有当用户点击下拉框有变的时候才会将参数类型与参数类型名改变
        String parameterType = request.getParameter("parameterType");
        if (parameterType != null && parameterType.trim() != "") {
            condition.put("parameterType", parameterType);
            String parameterName = request.getParameter("parameterName");
            if (parameterName != null && parameterName.trim() != "") {
                condition.put("parameterName", parameterName);
            }
        }
        String parameterValue = request.getParameter("parameterValue");
        if (parameterValue != null && parameterValue.trim() != "") {
            condition.put("parameterValue", Integer.parseInt(parameterValue));
        }
        String msg = null;
        msg = parameterService.updateParameter(condition);
        return msg;
    }

    @RequestMapping(value = "/insertParameter")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String insertParameter(Parameter parameter) throws IOException {
        System.out.println("parameter" + JSON.toJSONString(parameter));
        String msg = null;
        msg = parameterService.insertParameter(parameter);
        return msg;
    }

    @RequestMapping(value = "/selectSyslog")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String selectSyslog(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        response.setCharacterEncoding("utf-8");//前端数据转发的格式
        response.setContentType("text/html;charset=utf-8");

        LayuiData<Syslog> layuiData = null;
        HashMap<String, Object> condition = new HashMap<>();
        String start = request.getParameter("start");

        if (start != null && start.trim() != "") {
            condition.put("start", start);
        }
        String end = request.getParameter("end");

        if (end != null && end.trim() != "") {
            condition.put("end", end);
        }
        System.out.println("start" + start + "end" + end);
        int curPage;
        if (request.getParameter("curPage") != null) {
            curPage = Integer.parseInt(request.getParameter("curPage"));
        } else {
            curPage = 1;
        }
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        layuiData = adminService.selectSyslog(condition, curPage, pageSize);
        return JSON.toJSONString(layuiData);
    }

    @RequestMapping(value = "/videoUpload")
    @ResponseBody
    public Object videoUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile file,
            /*                              String videoName, String safetyVideoEnd, String safetyVideoName, String safetyVideoStar,*/
                              SafetyVideo safetyVideo) {
        LayuiData layuiData = null;
        try {
            //获取文件名
            String originalName = file.getOriginalFilename();
            //扩展名
            String prefix = originalName.substring(originalName.lastIndexOf(".") + 1);
            Date date = new Date();
            //使用UUID+后缀名保存文件名，防止中文乱码问题
            String uuid = UUID.randomUUID() + "";
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String dateStr = simpleDateFormat.format(date);
            String SQLprojectPath = "120.25.208.32" + File.separator + "upload" + File.separator + "safetyVideo" + File.separator + dateStr + File.separator + uuid + "." + prefix;


            boolean ftpupload = FtpUtil.uploadFile("120.25.208.32", 21, "jx1912", "jx1912", "/home/jx1912/", "/upload/safetyVideo/" + dateStr, uuid + "." + prefix, file.getInputStream());
            System.out.println("============================================================");
            System.out.println("安全教育视频上传:" + ftpupload);
            System.out.println("存储的到服务器的文件名：" + uuid + "." + prefix);
            System.out.println("================================================================");

            SafetyVideo safetyVideo1 = adminService.selectOneFile(safetyVideo);
            if (safetyVideo1 == null) {
                safetyVideo.setVideoAdd(SQLprojectPath);
                safetyVideo.setSafetyVideoTime(date);
//                File files = new File(projectPath);
                String msg = null;
                msg = adminService.insertVideo(safetyVideo);
                //将文件插入大到数据库中
                if (msg.equals("success")) {
                    layuiData = new LayuiData(0, "上传成功", 0, null);
                } else {
                    layuiData = new LayuiData(1, "上传失败", 0, null);
                }
            } else {
                layuiData = new LayuiData(1, "该文件已存在", 0, null);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
//        LayuiData layuiData=new LayuiData(0,"cc",0,null);
        return layuiData;
    }

    @RequestMapping(value = "/deleteSafetyVideo")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String deleteSafetyVideo(int safetyVideoId) throws IOException {

        String msg = null;
        msg = adminService.deleteSafetyVideo(safetyVideoId);
        return msg;
    }

    @RequestMapping(value = "/selectSafetyVideo")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String selectSafetyVideo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        response.setCharacterEncoding("utf-8");//前端数据转发的格式
        response.setContentType("text/html;charset=utf-8");

        LayuiData<SafetyVideo> layuiData = null;
        HashMap<String, Object> condition = new HashMap<>();
        String start = request.getParameter("start");

        if (start != null && start.trim() != "") {
            condition.put("start", start);
        }
        String end = request.getParameter("end");

        if (end != null && end.trim() != "") {
            condition.put("end", end);
        }
        System.out.println("start" + start + "end" + end);
        int curPage;
        if (request.getParameter("curPage") != null) {
            curPage = Integer.parseInt(request.getParameter("curPage"));
        } else {
            curPage = 1;
        }
        String safetyVideoName = request.getParameter("safetyVideoName");

        if (safetyVideoName != null && safetyVideoName.trim() != "") {
            condition.put("safetyVideoName", safetyVideoName);
        }

        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        layuiData = adminService.selectSafetyVideo(condition, curPage, pageSize);
        return JSON.toJSONString(layuiData);
    }

    @RequestMapping(value = "/againUpload")
    @ResponseBody
    public Object againUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile file, SafetyVideo safetyVideo) {
        LayuiData layuiData = null;
        String msg = null;
//        System.out.println("safetyVideo"+JSON.toJSONString(safetyVideo));
        try {
            //获取文件名
            String originalName = file.getOriginalFilename();
            System.out.println("文件名：" + originalName);
            //扩展名
            String prefix = originalName.substring(originalName.lastIndexOf(".") + 1);
            Date date = new Date();
            //使用UUID+后缀名保存文件名，防止中文乱码问题
            String uuid = UUID.randomUUID() + "";
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String dateStr = simpleDateFormat.format(date);
//            String savePath = request.getSession().getServletContext().getRealPath("/upload");//在文件下载的根目录下加上/upload
            String SQLprojectPath = "120.25.208.32" + File.separator + "upload" + File.separator + "safetyVideo" + File.separator + dateStr + File.separator + uuid + "." + prefix;

            boolean ftpupload = FtpUtil.uploadFile("120.25.208.32", 21, "jx1912", "jx1912", "/home/jx1912/", "/upload/safetyVideo/" + dateStr, uuid + "." + prefix, file.getInputStream());
            //要保存的问题件路径和名称
//            String projectPath = savePath + File.separator + dateStr + File.separator + uuid + "." + prefix;
//            String filePath = "\\upload" + File.separator + dateStr + File.separator + uuid + "." + prefix;
//            System.out.println("文件完整路径：" + projectPath);
            SafetyVideo safetyVideo1 = adminService.selectOneFile(safetyVideo);

            if (safetyVideo1 == null) {//文件不存在

//                System.out.println("存到数据库的文件路径："+filePath);
                safetyVideo.setVideoAdd(SQLprojectPath);
                safetyVideo.setSafetyVideoTime(date);
//                System.out.println("safetyVideo"+JSON.toJSONString(safetyVideo));
                msg = adminService.insertVideo(safetyVideo);
                //将文件插入大到数据库中

            } else {
//                layuiData = new LayuiData(1, "该文件已存在", 0, null);
//                String deletePath = savePath + safetyVideo1.getVideoAdd();
//                File file1 = new File(deletePath);
                File file1 = new File(safetyVideo1.getVideoAdd());
                file1.delete();
                safetyVideo.setSafetyVideoTime(date);
                safetyVideo.setVideoAdd(SQLprojectPath);
                safetyVideo.setSafetyVideoId(safetyVideo1.getSafetyVideoId());
                msg = adminService.updateSafetyVideo(safetyVideo);

            }
            if (msg.equals("success")) {
                layuiData = new LayuiData(0, "上传成功", 0, null);
            } else {
                layuiData = new LayuiData(1, "上传失败", 0, null);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
//        LayuiData layuiData=new LayuiData(0,"cc",0,null);
        return layuiData;
    }

    @RequestMapping(value = "/insertSafetyVtq")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String insertSafetyVtq(SafetyVtq safetyVtq) throws IOException {
//        System.out.println("safetyVtq"+JSON.toJSONString(safetyVtq));
        String msg = null;
        msg = adminService.insertSafetyVtq(safetyVtq);
        return msg;
    }

    @RequestMapping(value = "/deleteSafetyVtq")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String deleteSafetyVtq(int safetyVtqId) throws IOException {
//        System.out.println("safetyVtq"+JSON.toJSONString(safetyVtq));
        String msg = null;
        msg = adminService.deleteSafetyVtq(safetyVtqId);
        return msg;
    }

    @RequestMapping(value = "/updateSafetyVtq")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String updateSafetyVtq(SafetyVtq safetyVtq) throws IOException {
//        System.out.println("safetyVtq"+JSON.toJSONString(safetyVtq));
        String msg = null;
        System.out.println("safetyVtq" + JSON.toJSONString(safetyVtq));
        msg = adminService.updateSafetyVtq(safetyVtq);
        return msg;
    }

    @RequestMapping(value = "/SearchQuestion")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String SearchQuestion(HttpServletRequest request, HttpServletResponse response) throws IOException {
        LayuiData<SafetyVtq> layuiData = null;

        int curPage;
        if (request.getParameter("curPage") != null) {
            curPage = Integer.parseInt(request.getParameter("curPage"));
        } else {
            curPage = 1;
        }
        int videoId = 0;
        if (request.getParameter("videoId") != null) {
            videoId = Integer.parseInt(request.getParameter("videoId"));
        }
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
//        System.out.println("curPage" + curPage);
//        System.out.println("pageSize" + pageSize);
//        System.out.println("videoId" + videoId);
        layuiData = adminService.SearchQuestion(curPage, pageSize, videoId);
        return JSON.toJSONString(layuiData);
    }

    @RequestMapping(value = "/uploadReadmag")
    @ResponseBody
    public Object uploadReadmag(HttpServletRequest request, HttpServletResponse response, MultipartFile file, String readmagName) {
        LayuiData layuiData = null;
        String msg = null;
//        System.out.println("safetyVideo"+JSON.toJSONString(safetyVideo));
        try {
            //获取文件名
            String originalName = file.getOriginalFilename();
//            System.out.println("文件名：" + originalName);
            //扩展名
            String prefix = originalName.substring(originalName.lastIndexOf(".") + 1);
            Date date = new Date();
            //使用UUID+后缀名保存文件名，防止中文乱码问题
            String uuid = UUID.randomUUID() + "";
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String dateStr = simpleDateFormat.format(date);
            String SQLprojectPath = "120.25.208.32" + File.separator + "upload" + File.separator + "Readmag" + File.separator + dateStr + File.separator + uuid + "." + prefix;

            boolean ftpupload = FtpUtil.uploadFile("120.25.208.32", 21, "jx1912", "jx1912", "/home/jx1912/", "/upload/Readmag/" + dateStr, uuid + "." + prefix, file.getInputStream());
            System.out.println("============================================================");
            System.out.println("安全教育视频上传:" + ftpupload);
            System.out.println("存储的到服务器的文件名：" + uuid + "." + prefix);
            System.out.println("================================================================");
//            String savePath = request.getSession().getServletContext().getRealPath("/upload");//在文件下载的根目录下加上/upload
//            //要保存的问题件路径和名称
//            String projectPath = savePath + File.separator + dateStr + File.separator + uuid + "." + prefix;
//            //保存在数据库的封面图片路径
//            String filePath = "\\upload" + File.separator + dateStr + File.separator + uuid + "." + prefix;
//
//            File files = new File(projectPath);
//            //打印查看上传路径
//            if (!files.getParentFile().exists()) {//判断父目录是否存在
//
//                files.getParentFile().mkdirs(); //创建文件夹的父目录
//            }
//            file.transferTo(files); // 将接收的文件保存到指定文件中
            Readmag readmag = new Readmag();
            readmag.setReadmagName(readmagName);
            readmag.setReadmagPic(SQLprojectPath);
            msg = adminService.insertReadmsg(readmag);
//            msg = "success";
            if (msg.equals("success")) {
                layuiData = new LayuiData(0, "上传成功", 0, null);
            } else {
                layuiData = new LayuiData(1, "上传失败", 0, null);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return layuiData;
    }

    @RequestMapping(value = "/uploadReadmagPhoto")
    @ResponseBody
    public Object uploadReadmagPhoto(HttpServletRequest request, HttpServletResponse response, MultipartFile file, ReadmagPhoto readmagPhoto) {
        LayuiData layuiData = null;
        String msg = null;
        try {
            //获取文件名
            String originalName = file.getOriginalFilename();
//            System.out.println("文件名：" + originalName);
            //扩展名
            String prefix = originalName.substring(originalName.lastIndexOf(".") + 1);
            Date date = new Date();
            //使用UUID+后缀名保存文件名，防止中文乱码问题
            String uuid = UUID.randomUUID() + "";
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String dateStr = simpleDateFormat.format(date);
            String SQLprojectPath = "120.25.208.32" + File.separator + "upload" + File.separator + "ReadmagPhoto" + File.separator + dateStr + File.separator + uuid + "." + prefix;

            boolean ftpupload = FtpUtil.uploadFile("120.25.208.32", 21, "jx1912", "jx1912", "/home/jx1912/", "/upload/ReadmagPhoto/" + dateStr, uuid + "." + prefix, file.getInputStream());
//            String savePath = request.getSession().getServletContext().getRealPath("/upload");//在文件下载的根目录下加上/upload
//
////            System.out.println("savePath11"+savePath);
//            //要保存的问题件路径和名称
//            String projectPath = savePath + File.separator + dateStr + File.separator + uuid + "." + prefix;
//            //保存在数据库的封面图片路径
//            String filePath = "\\upload" + File.separator + dateStr + File.separator + uuid + "." + prefix;
//
//            File files = new File(projectPath);
//            //打印查看上传路径
//            if (!files.getParentFile().exists()) {//判断父目录是否存在
//
//                files.getParentFile().mkdirs(); //创建文件夹的父目录
//            }
//            file.transferTo(files); // 将接收的文件保存到指定文件中
            readmagPhoto.setSrc(SQLprojectPath);
            msg = adminService.insertReadmsgPhoto(readmagPhoto);
//            msg = "success";
            if (msg.equals("success")) {
                layuiData = new LayuiData(0, "新增成功", 0, null);
            } else {
                layuiData = new LayuiData(1, "上传失败", 0, null);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return layuiData;
    }

    @RequestMapping("/selectStudentSexAndHealth")
    @ResponseBody
    public String selectStudentSexAndHealth(HttpServletRequest request, Model model) {
        List<String> xAxis = new ArrayList<String>();

        xAxis.add("男");
        xAxis.add("女");

        xAxis.add("正常");
        xAxis.add("发烧");
//        List<Object> data = new ArrayList<Object>();
        HashMap<String, Object> hashMap = new HashMap();
        int a = adminService.selectStudentSex("男");
        int b = adminService.selectStudentSex("女");
        int c = adminService.selectStudentHealth("正常");
        int d = adminService.selectStudentHealth("发烧");


//        int b=teacherMapper.selectGirl();
        List<Integer> data = new ArrayList<>();
        data.add(a);
        data.add(b);
        data.add(c);
        data.add(d);

        hashMap.put("xAxis", xAxis);
        hashMap.put("data", data);
        return JSON.toJSONString(hashMap);
    }

    @RequestMapping(value = "/updateReadPhoto")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String updateReadPhoto(ReadmagPhoto readmagPhoto) throws IOException {
//        System.out.println("safetyVtq"+JSON.toJSONString(safetyVtq));
        String msg = null;

        msg = adminService.updateReadPhoto(readmagPhoto);
        return msg;
    }

    @RequestMapping(value = "/updateAnswer")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String updateAnswer(SafetyVideo safetyVideo) throws IOException {
//        System.out.println("safetyVtq"+JSON.toJSONString(safetyVtq));
        String msg = null;
//        if(safetyVideo.getSafetyAnswer()==null|| safetyVideo.getSafetyAnswer().trim().equals("")){
//            safetyVideo.setSafetyAnswer(" ");
//        }

        msg = adminService.updateAnswer(safetyVideo);
        return msg;
    }

    @RequestMapping(value = "/selectAnswer")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String selectAnswer(int safetyVideoId) throws IOException {
//        System.out.println("safetyVtq"+JSON.toJSONString(safetyVtq));
        String msg = null;

        msg = adminService.selectAnswer(safetyVideoId);
        return msg;
    }

    @RequestMapping(value = "/selectMenuDemoTwo")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String selectMenuDemo(int rid) throws IOException {
//        System.out.println("safetyVtq"+JSON.toJSONString(safetyVtq));

//        int rid=2;
        List<MenuDemo> list3 = menuService.selectParentMenu(rid);//父菜单
//        System.out.println("子菜单的父id："+JSON.toJSONString(list3));
        HashMap<Integer, MenuDemo> middleHahmap = new HashMap<>();
        List<HashMap<Integer, MenuDemo>> middleList = new ArrayList<>();
        for (int i = 0; i < list3.size(); i++) {
            MenuDemo parentMenu = list3.get(i);
            parentMenu.setRegion_type(1);
            List<MenuDemo> list = menuService.selectChileMenu(parentMenu.getRegionId());
            List<Map<Integer, Object>> list1 = new ArrayList<>();
            Map<Integer, Object> hashMap = new HashMap<>();
            for (MenuDemo childMenu : list) {
                childMenu.setRegion_type(2);
                hashMap.put(childMenu.getRegionId(), childMenu);

            }
            list1.add(hashMap);
            parentMenu.set_child(list1);
            middleHahmap.put(parentMenu.getRegionId(), parentMenu);
        }
        middleList.add(middleHahmap);
//        for (MenuDemo middleMenu:   list3     ) {
//
//            middleHahmap.put(middleMenu.getRegionId(), list3);
//
//        }
//        middleList.add(middleHahmap);
//
//
        MenuDemoTwo rootMenu = new MenuDemoTwo();

        rootMenu.setRegionId(0);
        rootMenu.setRegionName("菜单");
        rootMenu.setRegionPid(0);
        rootMenu.setRegion_type(0);
        rootMenu.set_child(middleList);

        HashMap<Integer, MenuDemoTwo> hashMapThree = new HashMap<>();
        hashMapThree.put(0, rootMenu);
        HashMap<String, HashMap<Integer, MenuDemoTwo>> hashMapFour = new HashMap<>();
        hashMapFour.put("list", hashMapThree);

        MenuLaydate menuLaydate = new MenuLaydate();
        menuLaydate.setCode(1);
        menuLaydate.setMsg("操作成功");
//        HashMap<String, HashMap<String, HashMap<Integer,MenuDemoTwo>>>data=new HashMap<>();
//        data.put("data",hashMapFour);
        menuLaydate.setData(hashMapFour);
        //   System.out.println(JSON.toJSONString(list3));
        Gson gson = new Gson();
        String menuJson = gson.toJson(menuLaydate);
//        System.out.println("hhh"+menuJson);
        menuJson = menuJson.replace("[", " ");//QString字符串分割函数
        menuJson = menuJson.replace("]", " ");//QString字符串分割函数
//        System.out.println(menuJson);
        return menuJson;
        // return JSON.toJSONString(menuLaydate);
    }

    @RequestMapping(value = "/selectMenuDemoThree")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String selectMenuDemoThree(int rid) throws IOException {
//        System.out.println("safetyVtq"+JSON.toJSONString(safetyVtq));

//        int rid=2;
        List<MenuDemo> list3 = menuMapper.selectAllMenu();//父菜单
//        System.out.println("子菜单的父id："+JSON.toJSONString(list3));
        HashMap<Integer, MenuDemo> middleHahmap = new HashMap<>();
        List<HashMap<Integer, MenuDemo>> middleList = new ArrayList<>();
        for (int i = 0; i < list3.size(); i++) {
            MenuDemo parentMenu = list3.get(i);
            parentMenu.setRegion_type(1);
            List<MenuDemo> list = menuService.selectChileMenu(parentMenu.getRegionId());
            List<Map<Integer, Object>> list1 = new ArrayList<>();
            Map<Integer, Object> hashMap = new HashMap<>();
            for (MenuDemo childMenu : list) {
                childMenu.setRegion_type(2);
                hashMap.put(childMenu.getRegionId(), childMenu);

            }
            list1.add(hashMap);
            parentMenu.set_child(list1);
            middleHahmap.put(parentMenu.getRegionId(), parentMenu);
        }
        middleList.add(middleHahmap);
//        for (MenuDemo middleMenu:   list3     ) {
//
//            middleHahmap.put(middleMenu.getRegionId(), list3);
//
//        }
//        middleList.add(middleHahmap);
//
//
        MenuDemoTwo rootMenu = new MenuDemoTwo();

        rootMenu.setRegionId(0);
        rootMenu.setRegionName("菜单");
        rootMenu.setRegionPid(0);
        rootMenu.setRegion_type(0);
        rootMenu.set_child(middleList);

        HashMap<Integer, MenuDemoTwo> hashMapThree = new HashMap<>();
        hashMapThree.put(0, rootMenu);
        HashMap<String, HashMap<Integer, MenuDemoTwo>> hashMapFour = new HashMap<>();
        hashMapFour.put("list", hashMapThree);

        MenuLaydate menuLaydate = new MenuLaydate();
        menuLaydate.setCode(1);
        menuLaydate.setMsg("操作成功");
//        HashMap<String, HashMap<String, HashMap<Integer,MenuDemoTwo>>>data=new HashMap<>();
//        data.put("data",hashMapFour);
        menuLaydate.setData(hashMapFour);
        //   System.out.println(JSON.toJSONString(list3));
        Gson gson = new Gson();
        String menuJson = gson.toJson(menuLaydate);
//        System.out.println("hhh"+menuJson);
        menuJson = menuJson.replace("[", " ");//QString字符串分割函数
        menuJson = menuJson.replace("]", " ");//QString字符串分割函数
//        System.out.println(menuJson);
        return menuJson;
        // return JSON.toJSONString(menuLaydate);
    }

    @RequestMapping(value = "/selectRole")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String selectRole() throws IOException {
//        System.out.println("safetyVtq"+JSON.toJSONString(safetyVtq));
        String msg = null;
        List<Role> list = menuMapper.selectRole();

        return JSON.toJSONString(list);
    }

    @RequestMapping(value = "/updatePermissions")
    @ResponseBody //直接返回数据而不是跳转拼接的页面
    public String updatePermissions(HttpServletRequest request, @RequestParam(value = "sourceArr2", required = true) List<String> sourceArr2, int rid) throws IOException {
//        String sourceArr2 = request.getParameter("sourceArr2");
//        System.out.println("sourceArr2"+JSON.toJSONString(sourceArr2));
        System.out.println(rid);
//        ArrayList<Menu>list=new ArrayList<>();
//        for (int i=0;i<sourceArr2.size();i++){
////            System.out.println(sourceArr2[i]);
//            Menu menu=new Menu();
//            menu.setOrderId(rid);
//            menu.setMenuId(Integer.parseInt(sourceArr2[i]));
//            list.add(menu);
//        }
        System.out.println("sourceArr2" + JSON.toJSONString(sourceArr2));
        List<String> menuId = menuMapper.selectMid(rid);
        System.out.println("menuId" + JSON.toJSONString(menuId));
        String msg = null;
        msg = menuService.updateMenuByrid(rid, sourceArr2, menuId);
        List<Menu> menu = menuService.findMenuList("13407942208");
//            System.out.println("admin1:" + JSON.toJSONString(admin1));
        request.getSession().setAttribute("menu", menu);

        return msg;
    }

}

