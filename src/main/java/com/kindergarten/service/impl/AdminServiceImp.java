package com.kindergarten.service.impl;


import com.alibaba.fastjson.JSON;
import com.kindergarten.bean.*;
import com.kindergarten.mapper.AdminMapper;
import com.kindergarten.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
@Transactional   //事务操作注解
@Service("adminService")
public class AdminServiceImp implements AdminService {

    @Autowired
    AdminMapper adminMapper;
    @Override
    public Admin login(String adminTel, String adminPwd) {
        return adminMapper.login(adminTel,adminPwd);
    }

    @Override
    public String updatePwd(Admin admin) {
        int a=adminMapper.updatePwd(admin);
        if (a>0){
            return "success";
        }else {
            return "failed";
        }
    }

    @Override
    public int updateParents(int id, int typeMath,int roleId) {
        int a = 0;//执行成功的行数
        if (roleId==1){ //执行家长的禁用，启用的操作
            if (typeMath == 1) {
                a = adminMapper.upByparents(id);
            } else if (typeMath == 2) {
                a = adminMapper.banByparents(id);
            }
        }
        if (roleId==5){ //执行家长的禁用，启用的操作
            if (typeMath == 1) {
                a = adminMapper.upByteachers(id);
            } else if (typeMath == 2) {
                a = adminMapper.banByteachers(id);
            }
        }
        if (roleId==4){ //执行家长的禁用，启用的操作
            if (typeMath == 1) {
                a = adminMapper.upByhealther(id);
            } else if (typeMath == 2) {
                a = adminMapper.banByhealther(id);
            }
        }
        if (roleId==3){ //执行家长的禁用，启用的操作
            if (typeMath == 1) {
                a = adminMapper.upBysecurity(id);
            } else if (typeMath == 2) {
                a = adminMapper.banBysecurity(id);
            }
        }
        if (roleId==6){ //执行家长的禁用，启用的操作
            if (typeMath == 1) {
                a = adminMapper.upByRector(id);
            } else if (typeMath == 2) {
                a = adminMapper.banByRector(id);
            }
        }
        return a;
    }

    @Override
    public String insertParents(Parents parents) {
        String msg=null;
         int a= adminMapper.insertParents(parents);
         if (a>0){
             msg="success";
         }else {
             msg="注册失败";
         }
        return msg;
    }

    @Override
    public boolean selectOneByparents(String parentsTel) {
        boolean b=false;
       int a=adminMapper.selectOneByparents(parentsTel);
        if (a<=0){
            b=true;
        }
        return b;
    }

    @Override
    public String insertTeacher(Teachers teachers) {
        String msg=null;
        int a=0;
        int b=0;
        if (teachers.getTeacherTel()!=null && teachers.getTeacherTel().trim()!="") {
            String teacherTel=teachers.getTeacherTel();
            a = adminMapper.selectOneByparents(teacherTel);
            if (a == 0) {
                b = adminMapper.insertTeacher(teachers);
                if (b > 0) {
                    msg = "success";
                } else {
                    msg = "注册失败";
                }
            } else {
                msg = "该账号已存在";
            }

        }
        return msg;
    }

    @Override
    public String insertHealther(Healther healther) {
        String msg=null;
        int a=0;
        int b=0;
        if (healther.getHealtherPhone()!=null && healther.getHealtherPhone()!="") {
            String healtherPhone=healther.getHealtherPhone();
            a = adminMapper.selectOneByhealther(healtherPhone);
            if (a == 0) {
                b = adminMapper.insertHealther(healther);
                if (b > 0) {
                    msg = "success";
                } else {
                    msg = "注册失败";
                }
            } else {
                msg = "该账号已存在";
            }

        }
        return msg;
    }

    @Override
    public String insertSercurity(Security security) {
        String msg=null;
        int a=0;
        int b=0;
        if (security.getSecurityPhone()!=null && security.getSecurityPhone()!="") {
            String securityPhone=security.getSecurityPhone();
            a = adminMapper.selectOneBySecurity(securityPhone);
            if (a == 0) {
                b = adminMapper.insertSecurity(security);
                if (b > 0) {
                    msg = "success";
                } else {
                    msg = "注册失败";
                }
            } else {
                msg = "该账号已存在";
            }

        }
        return msg;
    }

    @Override
    public String insertRector(Rector rector) {
        String msg=null;
        int a=0;
        int b=0;
        if (rector.getRectorTel()!=null && rector.getRectorTel()!="") {
            String rectorTel=rector.getRectorTel();
            a = adminMapper.selectOneByRector(rectorTel);
            if (a == 0) {
                b = adminMapper.insertRector(rector);
                if (b > 0) {
                    msg = "success";
                } else {
                    msg = "注册失败";
                }
            } else {
                msg = "该账号已存在";
            }
        }
        return msg;
    }

    @Override
    public List<Students> selectClassName() {
        return adminMapper.selectClassName();
    }

    @Override
    public List<Classes> findClassesList() {
        return adminMapper.findClassesList();
    }

    @Override
    public List<Classes> selectClasses(int kinderId) {
        return adminMapper.selectClasses(kinderId);
    }

    @Override
    public String insertStudent(Students students) {
        String msg=null;
        int a=0;
                a=adminMapper.insertStudent(students);
        if(a>0){
            msg="success";
        }
        return msg;
    }

    @Override
    public LayuiData selectPlatformInfo(HashMap hashMap, int curPage, int pageSize) {
        LayuiData<PlatformInfo> layuiData = null;
        List<PlatformInfo> list =null;
        int a =0;

        list= adminMapper.selectPlatformInfo(hashMap, curPage, pageSize);
        a= adminMapper.selectPlatformInfoCount(hashMap, curPage, pageSize);

        if (list.size() > 0) {
            layuiData = new LayuiData<>(0, "", a, list);
        } else {
            layuiData = new LayuiData<>(1, "查询失败", 0, null);
        }
        return layuiData;
    }

    @Override
    public LayuiData selectStudent(HashMap hashMap, int curPage, int pageSize) {
        LayuiData<Students> layuiData = null;
        List<Students> list =null;
        int a =0;

            list= adminMapper.selectStudent(hashMap, curPage, pageSize);
            a= adminMapper.selectStudentCount(hashMap, curPage, pageSize);

        if (list.size() > 0) {
            layuiData = new LayuiData<>(0, "", a, list);
        } else {
            layuiData = new LayuiData<>(1, "查询失败", 0, null);
        }
        return layuiData;
    }


    @Override
    public LayuiData selectParent(HashMap hashMap, int curPage, int pageSize,int roleID) {

                LayuiData<Parents> layuiData = null;
                List<Parents> list =null;
        int a =0;
        if(roleID==1){ //当roleID等于1时执行查询家长
                    list= adminMapper.selectParent(hashMap, curPage, pageSize);
                   a= adminMapper.selectParentCount(hashMap, curPage, pageSize);
        }else if(roleID==5){ //当roleID等于1时执行查询家长
            list= adminMapper.selectTeacher(hashMap, curPage, pageSize);
           a= adminMapper.selectTeacherCount(hashMap, curPage, pageSize);
        }else if(roleID==4){ //当roleID等于1时执行查询家长
            list= adminMapper.selectHealther(hashMap, curPage, pageSize);
            a= adminMapper.selectHealtherCount(hashMap, curPage, pageSize);
        }else if(roleID==3){ //当roleID等于1时执行查询家长
            list= adminMapper.selectSecurity(hashMap, curPage, pageSize);
            a= adminMapper.selectSecurityCount(hashMap, curPage, pageSize);
        }else if(roleID==6){ //当roleID等于1时执行查询家长
            list= adminMapper.selectRector(hashMap, curPage, pageSize);
            a= adminMapper.selectRectorCount(hashMap, curPage, pageSize);
        }

        if (list.size() > 0) {
            layuiData = new LayuiData<>(0, "", a, list);
        } else {
            layuiData = new LayuiData<>(1, "查询失败", 0, null);
        }
        return layuiData;
    }

    @Override
    public String deletePlatformInfo(int platformInfoId) {
        String msg=null;
        int a=0;
        a=adminMapper.deletePlatformInfo(platformInfoId);
        if (a>0){
            msg="success";
        }
        return msg;
    }

    @Override
    public String releaseOrCancel(int platformInfoId,String title) {
        String msg=null;

        if (title.equals("release")){
            int a=0;
            a=adminMapper.release(platformInfoId);
            if (a>0){
                msg="success";
            }else {
                msg="filed";
            }
        }else  if (title.equals("cancel")){
            int a=0;
            a=adminMapper.cancel(platformInfoId);
            if (a>0){
                msg="success";
            }else {
                msg="filed";
            }
        }
        return msg;
    }

    @Override
    public String updatePlatformInfo(PlatformInfo platformInfo) {
        String msg=null;
        int a=0;
        a=adminMapper.updatePlatformInfo(platformInfo);
        if (a>0){
            msg="success";
        }
        return msg;
    }

    @Override
    public String insertPlatformInfo(PlatformInfo platformInfo) {
        String msg=null;
        int a=0;
        a=adminMapper.insertPlatformInfo(platformInfo);
        if (a>0){
            msg="success";
        }
        return msg;
    }

    @Override
    public SafetyVideo selectOneFile(SafetyVideo safetyVideo) {

        SafetyVideo safetyVideo1=null;
        safetyVideo1=adminMapper.selectOneFile(safetyVideo);

        return safetyVideo1;
    }

    @Override
    public String insertVideo(SafetyVideo safetyVideo) {
        String msg=null;
        int a=0;
//        System.out.println("safetyVideo"+JSON.toJSONString(safetyVideo));
        a=adminMapper.insertVideo(safetyVideo);
        if (a>0){
            msg="success";
        }
        return msg;
    }

    @Override
    public String deleteSafetyVideo(int safetyVideoId) {
        String msg=null;
        int a=0;
        a=adminMapper.deleteSafetyVideo(safetyVideoId);
        if (a>0){
            msg="success";
        }
        return msg;
    }

    @Override
    public String updateSafetyVideo(SafetyVideo safetyVideo) {
        String msg=null;
        int a=0;
        a=adminMapper.updateSafetyVideo(safetyVideo);
        if (a>0){
            msg="success";
        }
        return msg;
    }

    @Override
    public String insertSafetyVtq(SafetyVtq safetyVtq) {
        String msg=null;
        int a=0;
        a=adminMapper.insertSafetyVtq(safetyVtq);
        if (a>0){
            msg="success";
        }
        return msg;
    }

    @Override
    public String deleteSafetyVtq(int safetyVtqId) {
        String msg=null;
        int a=0;
        a=adminMapper.deleteSafetyVtq(safetyVtqId);
        if (a>0){
            msg="success";
        }
        return msg;
    }

    @Override
    public LayuiData SearchQuestion(int curPage, int pageSize, int videoId) {
        LayuiData<SafetyVtq> layuiData = null;
        List<SafetyVtq> list =null;
        int a =0;
        list= adminMapper.SearchQuestion(curPage, pageSize,videoId);
//        System.out.println("selectSyslog:"+ JSON.toJSONString(list));
        a= adminMapper.SearchQuestionCount(videoId);


        if (list.size() > 0) {
            layuiData = new LayuiData<>(0, "", a, list);
        } else {
            layuiData = new LayuiData<>(1, "查询失败", 0, null);
        }
        return layuiData;
    }

    @Override
    public String insertReadmsg(Readmag readmag) {
        String msg=null;
        int a=0;
        a=adminMapper.insertReadmsg(readmag);
        if (a>0){
            msg="success";
        }
        return msg;
    }

    @Override
    public String insertReadmsgPhoto(ReadmagPhoto readmagPhoto) {
        String msg=null;
        int a=0;
        a=adminMapper.insertReadmsgPhoto(readmagPhoto);
        if (a>0){
            msg="success";
        }
        return msg;
    }

    @Override
    public int selectStudentSex(String studentSex) {
        int a=adminMapper.selectStudentSex(studentSex);
        return a;
    }

    @Override
    public int selectStudentHealth(String healthStatus) {
        int a=adminMapper.selectStudentHealth(healthStatus);
        return a;
    }

    @Override
    public String updateReadPhoto(ReadmagPhoto readmagPhoto) {
        String msg=null;
        int a=0;
        a=adminMapper.updateReadPhoto(readmagPhoto);
        if (a>0){
            msg="success";
        }
        return msg;
    }

    @Override
    public String selectAnswer(int safetyVideoId) {
        return adminMapper.selectAnswer(safetyVideoId);
    }

    @Override
    public String updateAnswer(SafetyVideo safetyVideo) {
        String msg=null;
        int a=0;
        a=adminMapper.updateAnswer(safetyVideo);
        if (a>0){
            msg="success";
        }
        return msg;
    }


    @Override
    public String updateSafetyVtq(SafetyVtq safetyVtq) {
        String msg=null;
        int a=0;
        a=adminMapper.updateSafetyVtq(safetyVtq);
        if (a>0){
            msg="success";
        }
        return msg;
    }

    @Override
    public LayuiData selectSafetyVideo(HashMap hashMap, int curPage, int pageSize) {
        LayuiData<SafetyVideo> layuiData = null;
        List<SafetyVideo> list =null;
        int a =0;
        list= adminMapper.selectSafetyVideo(hashMap, curPage, pageSize);
//        System.out.println("selectSyslog:"+ JSON.toJSONString(list));
        a= adminMapper.selectSafetyVideoCount(hashMap, curPage, pageSize);


        if (list.size() > 0) {
            layuiData = new LayuiData<>(0, "", a, list);
        } else {
            layuiData = new LayuiData<>(1, "查询失败", 0, null);
        }
        return layuiData;
    }

    @Override
    public LayuiData selectSyslog(HashMap hashMap, int curPage, int pageSize) {
        LayuiData<Syslog> layuiData = null;
        List<Syslog> list =null;
        int a =0;
            list= adminMapper.selectSyslog(hashMap, curPage, pageSize);
//        System.out.println("selectSyslog:"+ JSON.toJSONString(list));
            a= adminMapper.selectSyslogCount(hashMap, curPage, pageSize);


        if (list.size() > 0) {
            layuiData = new LayuiData<>(0, "", a, list);
        } else {
            layuiData = new LayuiData<>(1, "查询失败", 0, null);
        }
        return layuiData;
    }


}
