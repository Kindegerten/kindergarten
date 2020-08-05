//package com.kindergarten.controller;
//
//import com.alibaba.fastjson.JSON;
//import com.kindergarten.bean.Kinder;
//import com.kindergarten.bean.LayuiData;
//import com.kindergarten.bean.Parents;
//import com.kindergarten.service.KinderService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.util.Date;
//import java.util.HashMap;
//import java.util.List;
//
//@Controller
//@RequestMapping("kinderController")
//public class KinderController {
//    @Autowired
//    private KinderService kinderService;
//
//
//    @RequestMapping(value = "/selectKinder")
//    @ResponseBody //直接返回数据而不是跳转拼接的页面
//    public String selectKinder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
////        response.setCharacterEncoding("utf-8");//前端数据转发的格式
//        response.setContentType("text/html;charset=utf-8");
////        System.out.println("分页查询");
//        LayuiData<Parents> layuiData=null;
//        HashMap<String, Object> condition = new HashMap<>();
//        int curPage;
//        if (request.getParameter("curPage") != null) {
//            curPage = Integer.parseInt(request.getParameter("curPage"));
//        } else {
//            curPage = 1;
//        }
//        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
////        System.out.println("从第几页：" + curPage + "   查询页数：" + pageSize);
//        String start = request.getParameter("start");
//
//        if (start != null && start.trim() != "") {
//            condition.put("start", start);
//        }
//        String end = request.getParameter("end");
//
//        if (end != null && end.trim() != "") {
//            condition.put("end", end);
//        }
//        String kinderName = request.getParameter("kinderName");
//
//        if (kinderName != null && kinderName.trim() != "") {
//            condition.put("kinderName", kinderName);
//        }
//
//        String kinderStatusMsg = request.getParameter("kinderStatus");
//        System.out.println("kinderStatusMsg"+kinderStatusMsg);
//        if (kinderStatusMsg != null && kinderStatusMsg.trim() != "") {
//            int kinderStatus=Integer.parseInt(kinderStatusMsg);
//            condition.put("kinderStatus", kinderStatus);
//        }
//        String kinderStateMsg = request.getParameter("kinderState");
//        System.out.println("kinderStateMsg"+kinderStateMsg);
//        if (kinderStateMsg != null && kinderStateMsg.trim() != "") {
//            int kinderState=Integer.parseInt(kinderStateMsg);
//            condition.put("kinderState", kinderState);
//        }
//        layuiData = kinderService.selectKinder(condition, curPage, pageSize);
//        System.out.println("layuiData:"+layuiData);
//        return JSON.toJSONString(layuiData);
//    }
//    @RequestMapping(value = "/selectKinderStatus")
//    @ResponseBody //直接返回数据而不是跳转拼接的页面
//    public String selectKinderStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<Kinder>list=null;
//        list=kinderService.selectKinderStatus();
//
//        return JSON.toJSONString(list);
//    }
//
//    @RequestMapping(value = "/selectKinderState")
//    @ResponseBody //直接返回数据而不是跳转拼接的页面
//    public String selectKinderState(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<Kinder>list=null;
//        list=kinderService.selectKinderState();
//
//        return JSON.toJSONString(list);
//    }
//    @RequestMapping(value = "/selectApproveKinder")
//    @ResponseBody //直接返回数据而不是跳转拼接的页面
//    public String selectApproveKinder(int kinderId) throws ServletException, IOException {
//        System.out.println("kinderId"+kinderId);
//       Kinder kinder=null;
//       kinder=kinderService.selectApproveKinder(kinderId);
//
//        return JSON.toJSONString(kinder);
//    }
//
//    @RequestMapping(value = "/upKinderSatus")
//    @ResponseBody //直接返回数据而不是跳转拼接的页面
//    public String upKinderSatus(int kinderId) throws ServletException, IOException {
//        Kinder kinder=new Kinder();
//        kinder.setKinderId(kinderId);
//        kinder.setApproveTime(new Date());
//       String msg=null;
//        msg=kinderService.upKinderSatus(kinder);
//
//        return msg;
//    }
//    @RequestMapping(value = "/banKinderSatus")
//    @ResponseBody //直接返回数据而不是跳转拼接的页面
//    public String banKinderSatus(int kinderId) throws ServletException, IOException {
//        Kinder kinder=new Kinder();
//        kinder.setKinderId(kinderId);
//        kinder.setApproveTime(new Date());
//        String msg=null;
//        msg=kinderService.banKinderSatus(kinder);
//
//        return msg;
//    }
//
//    @RequestMapping(value = "/deleteKinder")
//    @ResponseBody //直接返回数据而不是跳转拼接的页面
//    public String deleteKinder(int kinderId) throws ServletException, IOException {
//
//        String msg=null;
//        msg=kinderService.deleteKinder(kinderId);
//        return msg;
//    }
//    @RequestMapping(value = "/restPwd")
//    @ResponseBody //直接返回数据而不是跳转拼接的页面
//    public String restPwd(int kinderId) throws ServletException, IOException {
//        Kinder kinder=new Kinder();
//        kinder.setKinderId(kinderId);
//        kinder.setKinderPwd("123456");
//        String msg=null;
//        msg=kinderService.restPwd(kinder);
//
//        return msg;
//    }
//
//    @RequestMapping(value = "/updateKinderState")
//    @ResponseBody //直接返回数据而不是跳转拼接的页面
//    public String updateKinderState(int kinderId,String title) throws ServletException, IOException {
//
//        String msg=null;
//        if (kinderId>0&&title!=null){
//        msg=kinderService.updateKinderState(kinderId,title);
//        }
//        return msg;
//    }
//
//    @RequestMapping(value = "/insertKinder")
//    @ResponseBody //直接返回数据而不是跳转拼接的页面
//    public String insertKinder(Kinder kinder) throws ServletException, IOException {
////        System.out.println("kinder"+JSON.toJSONString(kinder));
//        String msg=null;
//        if (kinder!=null){
//            msg=kinderService.insertKinder(kinder);
//        }
//        return msg;
//    }
//
//    @RequestMapping(value = "/updateKinder")
//    @ResponseBody //直接返回数据而不是跳转拼接的页面
//    public String updateKinder(Kinder kinder) throws ServletException, IOException {
//        System.out.println("kinder"+JSON.toJSONString(kinder));
//        String msg=null;
//        if (kinder!=null){
//            msg=kinderService.updateKinder(kinder);
//        }
//        return msg;
//    }
//}
