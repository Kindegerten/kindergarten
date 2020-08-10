package com.kindergarten.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FaceUserList {

    private String group_id,user_id,user_info,student_type;
    private Double score;

    public FaceUserList() {
    }

    public FaceUserList(String group_id, String user_id, String user_info, Double score) {
        this.group_id = group_id;
        this.user_id = user_id;
        this.user_info = user_info;
        this.score = score;
    }

    public FaceUserList(String group_id, String user_id, String user_info, String student_type, Double score) {
        this.group_id = group_id;
        this.user_id = user_id;
        this.user_info = user_info;
        this.student_type = student_type;
        this.score = score;
    }

    @Override
    public String toString() {
        return "FaceUserList{" +
                "group_id='" + group_id + '\'' +
                ", user_id='" + user_id + '\'' +
                ", user_info='" + user_info + '\'' +
                ", student_type='" + student_type + '\'' +
                ", score=" + score +
                '}';
    }

    public String getGroup_id() {
        return group_id;
    }

    public void setGroup_id(String group_id) {
        this.group_id = group_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_info() {
        return user_info;
    }

    public void setUser_info(String user_info) {
        this.user_info = user_info;
    }

    public String getStudent_type() throws ParseException {

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat df2=new SimpleDateFormat("yyyy-MM-dd");
        Date time=new Date();
        System.out.println("time:"+time);

        //上下午
        String beginTime=new String(df2.format(time)+" 12:00:00");
        Date sd=df.parse(beginTime);
        System.out.println("sd:"+sd);

        //上课时间
        String startTime=new String(df2.format(time)+" 08:30:00");
        Date start=df.parse(startTime);
        System.out.println("start:"+start);

        //下课时间
        String endTime=new String(df2.format(time)+" 17:30:00");
        Date end=df.parse(endTime);
        System.out.println("end:"+end);

        System.out.println("Period:"+time.before(sd));

        if(time.before(sd)){
            return time.before(start)?"正常":"迟到";
        }else {
            return time.before(end)?"早退":"正常";
        }

    }

    public void setStudent_type(String student_type) {
        this.student_type = student_type;
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

//    public static void main(String[] args) throws ParseException {
//        FaceUserList faceUserList=new FaceUserList();
//        System.out.println(faceUserList.getStudent_type());
//    }
}
