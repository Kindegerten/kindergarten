package com.kindergarten.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class PickupDetail {

    private String parentsName,studentName;
    private int studentsId,parentId,pickId;
    private String pickDate,noon,pickupDateTime,pickupTime;//时间，上下午，天，时
    private String weekDay;

    public PickupDetail() {
    }

    public PickupDetail(String parentName, String studentName, int studentsId, int parentId, int pickId, String pickDate, String noon, String pickupDateTime, String pickupTime, String weekDay) {
        this.parentsName = parentName;
        this.studentName = studentName;
        this.studentsId = studentsId;
        this.parentId = parentId;
        this.pickId = pickId;
        this.pickDate = pickDate;
        this.noon = noon;
        this.pickupDateTime = pickupDateTime;
        this.pickupTime = pickupTime;
        this.weekDay = weekDay;
    }

    @Override
    public String toString() {
        return "PickupDetail{" +
                "parentName='" + parentsName + '\'' +
                ", studentName='" + studentName + '\'' +
                ", studentsId=" + studentsId +
                ", parentId=" + parentId +
                ", pickId=" + pickId +
                ", pickDate='" + pickDate + '\'' +
                ", noon='" + noon + '\'' +
                ", pickupDateTime='" + pickupDateTime + '\'' +
                ", pickupTime='" + pickupTime + '\'' +
                ", weekDay='" + weekDay + '\'' +
                '}';
    }

    public int getPickId() {
        return pickId;
    }

    public void setPickId(int pickId) {
        this.pickId = pickId;
    }

    public String getParentsName() {
//        System.out.println("getParentName"+parentsName);
        if (parentsName!=null&&parentsName!=""){
            return parentsName;
        }else {
            return "请假";
        }
    }

    public void setParentsName(String parentsName) {
        this.parentsName = parentsName;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public int getStudentsId() {
        return studentsId;
    }

    public void setStudentsId(int studentsId) {
        this.studentsId = studentsId;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public String getPickDate() {
        return pickDate;
    }

    public void setPickDate(String pickDate) {
        this.pickDate = pickDate;
    }

    public String getNoon() throws ParseException {

        //判断上下午
        SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
        Date time=df.parse(this.getPickDate().split(" ")[1]);
        String beginTime=new String("12:00:00");
        Date sd=df.parse(beginTime);


        return time.before(sd)==true?"上午":"下午";
    }

    public void setNoon(String noon) {
        this.noon = noon;
    }

    public String getPickupDateTime() {
        return pickDate.split(" ")[0];
    }

    public void setPickupDateTime(String pickupDateTime) {
        this.pickupDateTime = pickupDateTime;
    }

    public String getPickupTime() {
        return pickDate.split(" ")[1];
    }

    public void setPickupTime(String pickupTime) {
        this.pickupTime = pickupTime;
    }

    public String getWeekDay() {

        //获取星期
        SimpleDateFormat f = new SimpleDateFormat("yyyy-MM-dd");
        String[] weekDays = { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
        Calendar cal = Calendar.getInstance(); // 获得一个日历
        Date datet = null;
        try {
            datet = f.parse(this.pickDate);
            cal.setTime(datet);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        int w = cal.get(Calendar.DAY_OF_WEEK) - 1; // 指示一个星期中的某天。
        if (w < 0)
            w = 0;
        return weekDays[w];
    }

    public void setWeekDay(String weekDay) {
        this.weekDay = weekDay;
    }
}
