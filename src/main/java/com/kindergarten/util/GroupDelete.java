package com.kindergarten.util;

import java.util.*;

/**
 * 删除用户组
 */
public class GroupDelete {

    public static String groupDelete(String at,String groupId) {
        // 请求url
        String url = "https://aip.baidubce.com/rest/2.0/face/v3/faceset/group/delete";
        try {
            Map<String, Object> map = new HashMap<>();
            map.put("group_id", groupId);

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
//
//        GroupDelete.groupDelete(AuthService.getAuth(),"security");
//    }
}