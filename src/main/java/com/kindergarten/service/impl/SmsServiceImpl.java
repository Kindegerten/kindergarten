package com.kindergarten.service.impl;

import com.alibaba.fastjson.JSON;
import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.profile.DefaultProfile;
import com.kindergarten.service.SmsService;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import org.springframework.stereotype.Service;

@Service
public class SmsServiceImpl implements SmsService {

    @Override
    public void sendSms(String name) {

        DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou", "LTAI4GEr5ZNeGGvGKuktwKzm", "KecmvHi0nDzUJpvtd40OpVt2gGH9S2");
        IAcsClient client = new DefaultAcsClient(profile);

        CommonRequest request = new CommonRequest();
        request.setSysMethod(MethodType.POST);
        request.setSysDomain("dysmsapi.aliyuncs.com");
        request.setSysVersion("2017-05-25");
        request.setSysAction("SendSms");
        request.putQueryParameter("RegionId", "cn-hangzhou");
        request.putQueryParameter("PhoneNumbers", "18396388859");
        request.putQueryParameter("SignName", "传一智慧平台");
        request.putQueryParameter("TemplateCode", "SMS_198932409");
        request.putQueryParameter("TemplateParam", "{\"code\":\""+name+"\"}");
        try {
            CommonResponse response = client.getCommonResponse(request);
            System.out.println(response.getData());
        } catch (ServerException e) {
            e.printStackTrace();
        } catch (ClientException e) {
            e.printStackTrace();
        }
    }

//    public static void main(String[] args) {
//        sendSms();
//    }

}

