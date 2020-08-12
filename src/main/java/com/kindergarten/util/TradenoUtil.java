package com.kindergarten.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.UUID;

public class TradenoUtil {

    /**
     * 生成16位不重复的随机数数字
     *
     */
    //生成16位唯一性的订单号
    public static String getUUID(){
        //随机生成一位整数
        int random = (int) (Math.random()*9+1);
        String valueOf = String.valueOf(random);
        //生成uuid的hashCode值
        int hashCode = UUID.randomUUID().toString().hashCode();
        //可能为负数
        if(hashCode<0){
            hashCode = -hashCode;
        }
        Calendar currentDate = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss" );
        String currentTime = sdf.format(currentDate.getTime());
        String value = valueOf + String.format(currentTime, hashCode);
//        System.out.println(value);

        return value.toString();
    }
}
