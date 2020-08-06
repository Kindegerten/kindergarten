package com.kindergarten.service.impl;

import com.alibaba.fastjson.JSON;
import com.kindergarten.bean.FaceUserList;
import com.kindergarten.mapper.AttenceMapper;
import com.kindergarten.service.FaceService;
import com.kindergarten.util.AuthService;
import com.kindergarten.util.FaceAdd;
import com.kindergarten.util.FaceSearch;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FaceServiceImpl implements FaceService {

    @Autowired
    private AttenceMapper attenceMapper;

    @Override
    public String faceSearch(String base64) {
        System.out.println("FaceService faceSearch ing...");

        //获取at
        String at= AuthService.getAuth();
        System.out.println("Access token:"+at);

        //转发base64，获取返回值
        String res= FaceSearch.faceSearch(base64,at);

        //JSON解析
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

            //识别成功打卡考勤
            if (faceUserList.getDouble("score")>80){
                FaceUserList faceUserList1=new FaceUserList();
                faceUserList1.setGroup_id(faceUserList.getString("group_id"));
                faceUserList1.setUser_id(faceUserList.getString("user_id"));
                faceUserList1.setUser_info(faceUserList.getString("user_info"));
                faceUserList1.setScore(faceUserList.getDouble("score"));

                System.out.println("to attenceMapper group:"+faceUserList1.getGroup_id()+" user:"+faceUserList1.getUser_id());
                return attenceMapper.insertAttendance(faceUserList1)>0?faceUserList1.getUser_id()+" "+faceUserList1.getUser_info()+",打卡成功！":faceUserList1.getUser_id()+" "+faceUserList1.getUser_info()+"打卡失败，请重试！";
            }else {
                return "无法精准识别，请重新拍摄！";
            }
        }else {
            return error_msg;
        }
    }

    @Override
    public String faceAdd(String base64, FaceUserList faceUserList) {
        System.out.println("FaceService faceAdd ing...");

        //获取at
        String at= AuthService.getAuth();
        System.out.println("Access token:"+at);

        String result= FaceAdd.add(base64,at,faceUserList);
        System.out.println("result:"+result);
        return result;
    }
}
