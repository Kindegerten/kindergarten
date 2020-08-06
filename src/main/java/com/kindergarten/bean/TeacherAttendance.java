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

        String time=this.getPrinttime().split(" ")[0];

        return time+"";
    }

    public void setTertimeDate(String tertimeDate) {
        this.tertimeDate = tertimeDate;
    }

    public String getTertimePeriod() throws ParseException {

        SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
        Date time=df.parse(this.getPrinttime().split(" ")[1]);
        System.out.println("time:"+time);
        String beginTime=new String("12:00:00");
        Date sd=df.parse(beginTime);
        System.out.println("sd:"+sd);
        System.out.println("Period:"+time.before(sd));


        return time.before(sd)==true?"上午":"下午";
    }

    public void setTertimePeriod(String tertimePeriod) {
        this.tertimePeriod = tertimePeriod;
    }

    public static void main(String[] args) throws ParseException {
        TeacherAttendance teacherAttendance=new TeacherAttendance();
        teacherAttendance.setPrinttime("2020-08-05 11:32:12");
        System.out.println(teacherAttendance.getTertimePeriod());
    }
}

