package com.kindergarten.util;

import com.kindergarten.bean.FaceUserList;

import java.util.*;

/**
 * 人脸注册
 */
public class FaceAdd {


    public static String add(String base64, String at, FaceUserList faceUserList) {
        // 请求url
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/faceset/user/add";
        try {
            Map<String, Object> map = new HashMap<>();
            map.put("image", base64);
            map.put("group_id", faceUserList.getGroup_id());
            map.put("user_id", faceUserList.getUser_id());
            map.put("user_info", faceUserList.getUser_info());
//            map.put("liveness_control", "LOW");
            map.put("image_type", "BASE64");
//            map.put("quality_control", "LOW");

            String param = GsonUtils.toJson(map);

            // 注意这里仅为了简化编码每一次请求都去获取access_token，线上环境access_token有过期时间， 客户端可自行缓存，过期后重新获取。
            String accessToken = at;

            String result = HttpUtil.post(url, accessToken, "application/json", param);
            System.out.println(result);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

//    public static void main(String[] args) {
//        FaceAdd.add();
//    }
}