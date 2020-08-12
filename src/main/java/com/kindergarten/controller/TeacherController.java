package com.kindergarten.controller;

import com.alibaba.fastjson.JSON;
import com.kindergarten.bean.*;
import com.kindergarten.mapper.TeacherMapper;
import com.kindergarten.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

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
        Teachers tblTeachers = teacherService.login(tel);
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

        Teachers tblTeachers = (Teachers) request.getSession().getAttribute("tblTeachers");

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

    /*分页查询*/
    @RequestMapping(value = "/selectList")
    @ResponseBody
    public String selectList(HttpServletRequest request, HttpServletResponse response, TblWorkrelease tblWorkrelease) {
        String pageStr = request.getParameter("page");//页码
        String pageSizeStr = request.getParameter("limit");//每页记录数

        String arr1[]=dateTime();

        String oneTime=arr1[0];

        Date aaa= date1(oneTime);

        System.out.println("开始时间"+arr1[0]);
        System.out.println("周日时间"+arr1[1]);

        Teachers tblTeachers =(Teachers) request.getSession().getAttribute("tblTeachers");
        tblWorkrelease.setTeacherId(tblTeachers.getTeacherId());

        LayuiData layuiData = teacherService.publishJobList(tblWorkrelease,Integer.parseInt(pageStr), Integer.parseInt(pageSizeStr));
        return JSON.toJSONString(layuiData);
    }

    private String[] dateTime() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar cal = Calendar.getInstance();
        //设置一个星期的第一天，按中国的习惯一个星期的第一天是星期一
        cal.setFirstDayOfWeek(Calendar.MONDAY);
        //获得当前日期是一个星期的第几天
        int dayWeek = cal.get(Calendar.DAY_OF_WEEK);
        if(dayWeek==1){
            dayWeek = 8;
        }

        // 根据日历的规则，给当前日期减去星期几与一个星期第一天的差值
        cal.add(Calendar.DATE, cal.getFirstDayOfWeek() - dayWeek);
        Date mondayDate = cal.getTime();

        String weekBegin = sdf.format(mondayDate);
        System.out.println("所在周星期一的日期：" + weekBegin);

        cal.add(Calendar.DATE, 4 +cal.getFirstDayOfWeek());
        Date sundayDate = cal.getTime();

        String weekEnd = sdf.format(sundayDate);
        System.out.println("所在周星期日的日期：" + weekEnd);

        Date arr1[]=new Date[2];

        arr1[0]=mondayDate;
        arr1[1]=sundayDate;

        String arr[]=new String[2];
        arr[0]=weekBegin;
        arr[1]=weekEnd;

        return arr;
    }

    public Date date1(String  aaa){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date;
        try {
            date = sdf.parse(aaa);
        } catch (Exception e) {
            date = null;
        }

        return date;
    }

    /*添加发布作业*/
    @RequestMapping(value = "/publishTaskAdd")
    @ResponseBody
    public Object pblishTaskAdd(HttpServletRequest request, HttpServletResponse response, TblWorkrelease tblPublishTask){
        Teachers staffRo=(Teachers) request.getSession().getAttribute("tblTeachers");
        tblPublishTask.setTeacherId(staffRo.getTeacherId());
        tblPublishTask.setClassId(staffRo.getClassId());

        int i = teacherService.publishTaskAdd(tblPublishTask);

        if (i ==1){
            System.out.println("添加成功");
        }else {
            System.out.println("添加失败");
        }
        return JSON.toJSONString(i);
    }

    /*文件上传*/
    @RequestMapping(value = "/upLoad")
    @ResponseBody
    public Object upLoad(HttpServletRequest request, HttpServletResponse response, MultipartFile file){
        try {
            //获取文件名
            String originalName=file.getOriginalFilename();
            //扩展名
            String prefix=originalName.substring(originalName.lastIndexOf(".")+1);
            System.out.println("prefix:"+prefix);
            Date date=new Date();
            //使用UUID+后缀名保存文件名，防止中文乱码问题
            String uuid= UUID.randomUUID()+"";
            SimpleDateFormat simpleDateFormat=new SimpleDateFormat("YYYY-MM-dd");
            String dateStr = simpleDateFormat.format(date);
//            String savePath = ResourceUtils.getURL("classpath:").getPath()+"static/";
            String savePath =request.getSession().getServletContext().getRealPath("/upload/");
            //保存的文件路径和名称
//            String filepath="upLoad/"+dateStr+ File.separator + uuid + "." + prefix;
            String projectPath = savePath + dateStr + File.separator + uuid + "." + prefix;

            System.out.println("projectPath:"+projectPath);
            File files=new File(projectPath);
            //打印查看上传路径
            if (!files.getParentFile().exists()){//判断目录是否存在
                System.out.println("files="+files.getPath());
                files.getParentFile().mkdirs();
            }
            file.transferTo(files);//将接收到的文件保存到指定文件中
            System.out.println("projectPath:"+projectPath);
            LayuiData layuiData=new LayuiData();
            layuiData.setCode(0);
            layuiData.setMsg("projectPath");
            return JSON.toJSONString(layuiData);
        }catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    /* 删除发布作业*/
    @RequestMapping(value = "/delPublishTask")
    @ResponseBody
    public Object delPublishTask(HttpServletRequest request, HttpServletResponse response, TblWorkrelease tblPublishTask){

        int i = teacherService.delPublishTask(tblPublishTask);
        Map<String,Object> map=null;
        if (i ==1){
            System.out.println("删除成功");
        }else {
            System.out.println("删除失败");
        }
        return JSON.toJSONString(i);
    }

    /*查询宝宝作业*/
    @RequestMapping(value = "/taskSelectList")
    @ResponseBody
    public String taskSelectList(HttpServletRequest request, HttpServletResponse response, TblWorkrelease tblPublishTask) {
        String pageStr = request.getParameter("page");//页码
        String pageSizeStr = request.getParameter("limit");//每页记录数

        Teachers staffRo=(Teachers) request.getSession().getAttribute("tblTeachers");
        tblPublishTask.setTeacherId(staffRo.getTeacherId());

        LayuiData layuiData = teacherService.selectList(tblPublishTask,Integer.parseInt(pageStr), Integer.parseInt(pageSizeStr));
        return JSON.toJSONString(layuiData);
    }

    /*修改作业评级*/
    @RequestMapping(value = "/updateTaskLevel")
    @ResponseBody
    public Object updateTaskLevel(HttpServletRequest request, HttpServletResponse response, Work tblTask){
        int i = teacherService.updateTask(tblTask);
        if (i ==1){
            System.out.println("修改成功");

        }else {
            System.out.println("修改失败");
        }
        return JSON.toJSONString(i);

    }

    /*班级相册查询*/
    @RequestMapping(value = "/classSelectList")
    @ResponseBody
    public String selectList(HttpServletRequest request, HttpServletResponse response ) {
        String pageStr = request.getParameter("page");//页码
        String pageSizeStr = request.getParameter("limit");//每页记录数

        Teachers staffRo=(Teachers) request.getSession().getAttribute("tblTeachers");
        int idNum =staffRo.getTeacherId();
        LayuiData layuiData = teacherService.phototSelectList(idNum,Integer.parseInt(pageStr), Integer.parseInt(pageSizeStr));
        return JSON.toJSONString(layuiData);
    }


    /*添加班级图片*/
    @RequestMapping(value = "/addClassPhoto")
    @ResponseBody
    public Object addClassPhoto(HttpServletRequest request, HttpServletResponse response,  Photo classPhoto){

        Teachers staffRo=(Teachers) request.getSession().getAttribute("tblTeachers");
        classPhoto.setClassId(staffRo.getClassId());


        System.out.println(JSON.toJSONString(classPhoto));
        int i = teacherService.addClassPhoto(classPhoto);

        if (i ==1){
            System.out.println("添加成功");
        }else {
            System.out.println("添加失败");
        }
        return JSON.toJSONString(i);
    }

    /*查询*/
    @RequestMapping(value = "/classInfoSelectList")
    @ResponseBody
    public String selectList(HttpServletRequest request, HttpServletResponse response, ClassInfo classInf ) {
        String pageStr = request.getParameter("page");//页码
        String pageSizeStr = request.getParameter("limit");//每页记录数

        String startTime = request.getParameter("startFinishTime");
        String endTime = request.getParameter("endFinishTime");

        Teachers staffRo=(Teachers) request.getSession().getAttribute("tblTeachers");

        classInf.setTeacherId(staffRo.getTeacherId());
        classInf.setStudentTime(startTime);

        LayuiData layuiData = teacherService.classInfoSelectList(classInf,endTime,Integer.parseInt(pageStr), Integer.parseInt(pageSizeStr) );
        return JSON.toJSONString(layuiData);
    }

    //班级通知
    /*查询*/
    @RequestMapping(value ="/clamsgSelectList")
    @ResponseBody
    public String selectList(HttpServletRequest request, HttpServletResponse response, Clamsg tblClassNotice ) {
        String pageStr = request.getParameter("page");//页码
        String pageSizeStr = request.getParameter("limit");//每页记录数

        String startTime = request.getParameter("startFinishTime");
        String endTime = request.getParameter("endFinishTime");

        Teachers staffRo=(Teachers) request.getSession().getAttribute("tblTeachers");

        tblClassNotice.setTeacherId(staffRo.getTeacherId());
        tblClassNotice.setSendmsgTime(startTime);

        LayuiData layuiData = teacherService.clamsgSelectList(tblClassNotice,endTime,Integer.parseInt(pageStr), Integer.parseInt(pageSizeStr) );
        return JSON.toJSONString(layuiData);
    }


    /*添加*/
    @RequestMapping(value = "/clamsgAdd")
    @ResponseBody
    public Object classNoticeAdd(HttpServletRequest request, HttpServletResponse response, Clamsg tblClassNotice){
        Teachers staffRo=(Teachers) request.getSession().getAttribute("tblTeachers");
        tblClassNotice.setTeacherId(staffRo.getTeacherId());
        tblClassNotice.setClassId(staffRo.getClassId());
        int i = teacherService.clamsgAdd(tblClassNotice);

        if (i ==1){
            System.out.println("添加成功");
        }else {
            System.out.println("添加失败");
        }
        return JSON.toJSONString(0);
    }

    /* 删除*/
    @RequestMapping(value = "/delClamsg")
    @ResponseBody
    public Object delClassNotice(HttpServletRequest request, HttpServletResponse response, Clamsg tblClassNotice){

        int i = teacherService.delClamsg(tblClassNotice);
        Map<String,Object> map=null;
        if (i ==1){
            System.out.println("删除成功");
        }else {
            System.out.println("删除失败");
        }
        return JSON.toJSONString(i);
    }

    /*修改*/
    @RequestMapping(value = "/updateClamsg")
    @ResponseBody
    public Object updateTaskLevel(HttpServletRequest request, HttpServletResponse response, Clamsg tblClassNotice){
        int i = teacherService.updateClamsg(tblClassNotice);
        if (i >=1){
            System.out.println("修改成功");

        }else {
            System.out.println("修改失败");
        }
        return JSON.toJSONString(i);

    }

    //安全试题配置
    /*查询*/
    @RequestMapping(value = "/safetyEduSelectList")
    @ResponseBody
    public String safetyEduSelectList(HttpServletRequest request, HttpServletResponse response ) {
        String pageStr = request.getParameter("page");//页码
        String pageSizeStr = request.getParameter("limit");//每页记录数

        Teachers staffRo=(Teachers) request.getSession().getAttribute("tblTeachers");
        int idNum =staffRo.getTeacherId();
        LayuiData layuiData = teacherService.safetyEduSelectList(idNum,Integer.parseInt(pageStr), Integer.parseInt(pageSizeStr));
        return JSON.toJSONString(layuiData);
    }
    /*添加发布作业*/
    @RequestMapping(value = "/addSafetyEdu")
    @ResponseBody
    public Object addSafetyEdu(HttpServletRequest request, HttpServletResponse response ,SafetyEdu tblSafetyEdu){
        Teachers staffRo=(Teachers) request.getSession().getAttribute("tblTeachers");

        tblSafetyEdu.setTeacherId(staffRo.getTeacherId());
        int i = teacherService.addSafetyEdu(tblSafetyEdu);

        if (i ==1){
            System.out.println("添加成功");
        }else {
            System.out.println("添加失败");
        }
        return JSON.toJSONString(i);
    }

    /*替换配置文件*/
    @RequestMapping(value = "/updateSafetyEdu")
    @ResponseBody
    public Object updateSafetyEdu(HttpServletRequest request, HttpServletResponse response, SafetyEdu tblSafetyEdu){

        int i = teacherService.updateSafetyEdu(tblSafetyEdu);

        if (i ==1){
            System.out.println("添加成功");
        }else {
            System.out.println("添加失败");
        }
        return JSON.toJSONString(i);
    }

    /*查询*/
    @RequestMapping(value = "/safetyVideoSelectList")
    @ResponseBody
    public Object safetyVideoSelectList(HttpServletRequest request, HttpServletResponse response ) {

        LayuiData layuiData = teacherService.safetyVideoSelectList();
        System.out.println(JSON.toJSONString(layuiData));
        return layuiData;
    }

    /*聊天:家长联系点击后到此区域，查询老师班级，而后查孩子*/
    @RequestMapping(value = "/Cheat")
    public String Cheat(HttpServletRequest request) throws ServletException, IOException {
//        String studentid= (String) request.getSession().getAttribute("studentID");
//        List<Teachers> teachers=parentsMapper.SearchTeacher(Integer.parseInt(studentid));
//        request.setAttribute("teachers",teachers);
        Teachers teachers= (Teachers) request.getSession().getAttribute("tblTeachers");
        List<Parents> list=teacherMapper.SearchParents(teachers.getTeacherId());
        request.setAttribute("parents",list);

        return "/teacher/Cheat.jsp";
    }

    //安全试题完成情况
    /*查询*/
    @RequestMapping(value = "/safetyTestCompleteSelectList")
    @ResponseBody
    public String safetyTestCompleteSelectList(HttpServletRequest request, HttpServletResponse response, SafetyTestComplete safetyTestOut ) {
        String pageStr = request.getParameter("page");//页码
        String pageSizeStr = request.getParameter("limit");//每页记录数

        String startTime = request.getParameter("startFinishTime");
        String endTime = request.getParameter("endFinishTime");
        String state = request.getParameter("safetyTestResult");

        Teachers staffRo=(Teachers) request.getSession().getAttribute("tblTeachers");

        if(state!=""){
            String state1 = state;
            safetyTestOut.setSafetyTestResult(state1);//设置完成状态
        }else if (state==""){
            LayuiData layuiDatas = teacherService.safetyTestCompleteSelectList( safetyTestOut, endTime,Integer.parseInt(pageStr), Integer.parseInt(pageSizeStr));
            return JSON.toJSONString(layuiDatas);
        }
        safetyTestOut.setTeacherId(staffRo.getTeacherId());//设置staffID
//        safetyTestOut.setFinishTime(startTime);//设置开始完成时间

        LayuiData layuiData = teacherService.safetyTestCompleteSelectList( safetyTestOut, endTime,Integer.parseInt(pageStr), Integer.parseInt(pageSizeStr));
        return JSON.toJSONString(layuiData);
    }
    @RequestMapping("/selectSex")
    @ResponseBody
    public String selectSex(HttpServletRequest request) {
        List<String> xAxis = new ArrayList<String>();

        xAxis.add("男");
        xAxis.add("女");
//        List<Object> data = new ArrayList<Object>();
        HashMap<String,Object> hashMap=new HashMap();
        int a=teacherMapper.selectBoy();
        int b=teacherMapper.selectGirl();
        List<Integer>data=new ArrayList<>();
        data.add(a);
        data.add(b);
        hashMap.put("xAxis", xAxis);
        hashMap.put("data", data);
//        model.
        return JSON.toJSONString(hashMap);
    }

    @RequestMapping("/selectTeacherAge")
    @ResponseBody
    public String selectTeacherAge(HttpServletRequest request) {
        List<String> xAxis = new ArrayList<String>();

        xAxis.add("[10-20]");
        xAxis.add("[20-30]");
        xAxis.add("[30-40]");
        xAxis.add("[40-50]");
        xAxis.add("[50-60]");
//        List<Object> data = new ArrayList<Object>();
        HashMap<String,Object> hashMap=new HashMap();
        int a=teacherMapper.selectTeacherAge(10);//10-20
        int b=teacherMapper.selectTeacherAge(20);//20-30
        int c=teacherMapper.selectTeacherAge(30);//30-40
        int d=teacherMapper.selectTeacherAge(40);//40-50
        int e=teacherMapper.selectTeacherAge(50);//50-60
        System.out.println("a"+a);
        System.out.println("b"+b);
//        int b=teacherMapper.selectGirl();
        List<Integer>data=new ArrayList<>();
        data.add(a);
        data.add(b);
        data.add(c);
        data.add(d);
        data.add(e);
        hashMap.put("xAxis", xAxis);
        hashMap.put("data", data);
        return JSON.toJSONString(hashMap);
    }
    /*查询*/
    @RequestMapping(value = "/courseSelectList")
    @ResponseBody
    public Object courseSelectList(HttpServletRequest request, HttpServletResponse response ,Course course) {

        String pageStr = request.getParameter("page");//页码
        String pageSizeStr = request.getParameter("limit");//每页记录数
        Teachers staffRo=(Teachers) request.getSession().getAttribute("tblTeachers");
        course.setTeacherId(staffRo.getTeacherId());

        LayuiData layuiData = teacherService.courseTeacher(course,Integer.parseInt(pageStr), Integer.parseInt(pageSizeStr));
        System.out.println(JSON.toJSONString(layuiData));
        return layuiData;
    }

}
