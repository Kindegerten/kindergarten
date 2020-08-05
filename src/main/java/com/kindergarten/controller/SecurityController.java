package com.kindergarten.controller;


import com.alibaba.fastjson.JSON;
import com.kindergarten.bean.FaceReturn;
import com.kindergarten.bean.FaceUserList;
import com.kindergarten.bean.Security;
import com.kindergarten.service.SecurityService;
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

    @RequestMapping(value = "/getAuth")
    @ResponseBody
    public String getAuth(HttpServletRequest request, HttpServletResponse response) throws IOException {

        //获取base64
        String base64=new String(request.getParameter("base64").getBytes("ISO8859-1"), "UTF-8");
        System.out.println("base64 after:"+base64);
        //获取base64数据内容部分，去掉文件头和标识"data:image/jpeg;base64,"
        base64=base64.split("base64,")[1];
        System.out.println("base64 final:"+base64);

        //获取at
        String at=AuthService.getAuth();
        System.out.println("Access token:"+at);

        //转发base64，获取返回值
        String res=FaceSearch.faceSearch(base64,at);
//        FaceReturn faceReturn=JSON.parseObject(FaceSearch.faceSearch(base64,at),FaceReturn.class);
//        System.out.println("faceReturn:"+faceReturn);

        JSONObject jsonObject = new JSONObject(res);
        String error_msg = jsonObject.getString("error_msg");
        System.out.println("error_msg:"+error_msg);

        if (jsonObject.getInt("error_code")==0){
            JSONObject result=jsonObject.getJSONObject("result");
            System.out.println("result:"+result.toString());

            JSONArray faceUserLists=result.getJSONArray("user_list");
            System.out.println("faceUserLists:"+faceUserLists.toString());

            JSONObject faceUserList= (JSONObject) faceUserLists.get(0);
            System.out.println("faceUserList:"+faceUserList.toString());

            if (faceUserList.getDouble("score")>80){
                return faceUserList.toString();
            }else {
                return "无法精准识别，请重新拍摄！";
            }
        }else {
            return error_msg;
        }

//        return base64;
    }

    @RequestMapping(value = "/addFace")
    @ResponseBody
    public String addFace(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //获取base64
//        String base64=request.getParameter("base64");
//        System.out.println("base64 before:"+base64);
        String base64=new String(request.getParameter("base64").getBytes("ISO8859-1"), "UTF-8");
        System.out.println("base64 after:"+base64);
        //获取base64数据内容部分，去掉文件头和标识"data:image/jpeg;base64,"
        base64=base64.split("base64,")[1];
        System.out.println("base64 final:"+base64);

        //获取at
        String at= AuthService.getAuth();
        System.out.println("Access token:"+at);

        //TODO 加入用户组信息 FaceUserList类
        FaceUserList faceUserList=new FaceUserList();

        String result=FaceAdd.add(base64,at,faceUserList);
        System.out.println("result:"+result);
//        return result;
        return base64;
    }

}
