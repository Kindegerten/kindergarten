package com.kindergarten.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class TeacherAttendance {

    private int tertimeId,tid;
    private String printtime,tertimeDate,tertimePeriod;

    public TeacherAttendance() {
    }

    public TeacherAttendance(int tertimeId, int tid, String printtime, String tertimeDate, String tertimePeriod) {
        this.tertimeId = tertimeId;
        this.tid = tid;
        this.printtime = printtime;
        this.tertimeDate = tertimeDate;
        this.tertimePeriod = tertimePeriod;
    }

    @Override
    public String toString() {
        return "TeacherAttendance{" +
                "tertimeId=" + tertimeId +
                ", tid=" + tid +
                ", printtime='" + printtime + '\'' +
                ", tertimeDate='" + tertimeDate + '\'' +
                ", tertimePeriod='" + tertimePeriod + '\'' +
                '}';
    }

    public int getTertimeId() {
        return tertimeId;
    }

    public void setTertimeId(int tertimeId) {
        this.tertimeId = tertimeId;
    }

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public String getPrinttime() {
        return printtime;
    }

    public void setPrinttime(String printtime) {
        this.printtime = printtime;
    }

    public String getTertimeDate() {

        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");    // HH:mm:ss
        Date sd = null;      // 时间戳转换成时间
        try {
            sd = sdf.parse(this.getPrinttime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        System.out.println("格式化结果：" + sd);

        return sd+"";
    }

    public void setTertimeDate(String tertimeDate) {
        this.tertimeDate = tertimeDate;
    }

    public String getTertimePeriod() {

        SimpleDateFormat sdf2 = new SimpleDateFormat("HH");
        Date sd2 = null;
        try {
            sd2 = sdf2.parse(this.printtime);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        System.out.println("格式化结果：" + sd2);

        return sd2+"";
    }

    public void setTertimePeriod(String tertimePeriod) {
        this.tertimePeriod = tertimePeriod;
    }

//    public static void main(String[] args) {
//        TeacherAttendance teacherAttendance=new TeacherAttendance();
//        teacherAttendance.setPrinttime("2020-08-05 11:32:12");
//        System.out.println(teacherAttendance.getTertimeDate()+" "+teacherAttendance.getTertimePeriod());
//    }
}

