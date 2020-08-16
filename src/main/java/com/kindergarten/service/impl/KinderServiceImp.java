package com.kindergarten.service.impl;

import com.kindergarten.bean.Kinder;
import com.kindergarten.bean.LayuiData;
import com.kindergarten.mapper.KinderMapper;
import com.kindergarten.service.KinderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
@Transactional
@Service("kinderService")
public class KinderServiceImp implements KinderService {
    @Autowired
    private KinderMapper kinderMapper;

    @Override
    public LayuiData selectKinder(HashMap condition, int curPage, int pageSize) {
        LayuiData<Kinder> layuiData = null;
        List<Kinder> list = null;
        int a = 0;
        list = kinderMapper.selectKinder(condition, curPage, pageSize);
        a = kinderMapper.selectKinderCount(condition, curPage, pageSize);
        if (a > 0) {
            layuiData = new LayuiData<>(0, "", a, list);
        } else {
            layuiData = new LayuiData<>(1, "查询失败", 0, null);
        }
        return layuiData;
    }

    @Override
    public List<Kinder> selectKinderStatus() {
        return kinderMapper.selectKinderStatus();
    }

    @Override
    public List<Kinder> selectKinderState() {
        return kinderMapper.selectKinderState();
    }

    @Override
    public Kinder selectApproveKinder(int kinderId) {
        return kinderMapper.selectApproveKinder(kinderId);
    }

    @Override
    public String upKinderSatus(Kinder kinder) {
        int a=0;
        String msg=null;
        a=kinderMapper.upKinderSatus(kinder);
        if (a>0){
            msg="success";
        }else {
            msg="failed";
        }
        return msg;
    }

    @Override
    public String banKinderSatus(Kinder kinder) {
        int a=0;
        String msg=null;
        a=kinderMapper.banKinderSatus(kinder);
        if (a>0){
            msg="success";
        }else {
            msg="failed";
        }
        return msg;
    }

    @Override
    public String deleteKinder(int kinderId) {
        int a=0;
        String msg=null;
        a=kinderMapper.deleteKinder(kinderId);
        if (a>0){
            msg="success";
        }else {
            msg="failed";
        }
        return msg;
    }

    @Override
    public String restPwd(Kinder kinder) {
        int a=0;
        String msg=null;
        a=kinderMapper.restPwd(kinder);
        if (a>0){
            msg="success";
        }else {
            msg="failed";
        }
        return msg;
    }

    @Override
    public String updateKinderState(int kinderId, String msg) {
        String title=null;

        if (msg.equals("ban")){
            int a=0;
            a=kinderMapper.banKinderState(kinderId);
            if (a>0){
                title="success";
            }else {
                title="filed";
            }
        }else   if (msg.equals("up")){
            int a=0;
            a=kinderMapper.upKinderState(kinderId);
            if (a>0){
                title="success";
            }else {
                title="filed";
            }
        }
        return title;
    }

    @Override
    public String insertKinder(Kinder kinder) {
        String msg=null;
        int a=0;
        a=kinderMapper.selectKinderByone(kinder);
        if (a>0){
            msg="该账号已存在，无法帮您注册";
        }else {
            int b=0;
            b=kinderMapper.insertKinder(kinder);
            if (b>0){
                msg="success";
            }
        }
        return msg;
    }

    @Override
    public String updateKinder(Kinder kinder) {
        String msg=null;
        int a=0;
        a=kinderMapper.updateKinder(kinder);
        if (a>0){
            msg="success";
        }
        return msg;
    }


}
