package com.kindergarten.service.impl;


import com.kindergarten.bean.*;
import com.kindergarten.mapper.AdminMapper;
import com.kindergarten.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

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

}