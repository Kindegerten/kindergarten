package com.kindergarten.service.impl;

import com.alibaba.fastjson.JSON;
import com.kindergarten.bean.LayuiData;
import com.kindergarten.bean.Parameter;
import com.kindergarten.mapper.ParameterMapper;
import com.kindergarten.service.ParameterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service("parameterService")
public class ParameterServiceImp implements ParameterService {
    @Autowired
    ParameterMapper parameterMapper;
    @Override
    public LayuiData selectParameterList(HashMap condition, int curPage, int pageSize) {
        LayuiData layuiData=null;
        int a=0;
        List<Parameter>list=null;
        list=parameterMapper.selectParameterList(condition,curPage,pageSize);
        a=parameterMapper.selectParameterCount(condition,curPage,pageSize);
        if (a>0){
            layuiData=new LayuiData(0,"",a,list);
        }else {
            layuiData=new LayuiData(1,"查询失败",0,null);
        }
        return layuiData;
    }

    @Override
    public List<Parameter> selectParameterType() {
        List<Parameter>list=null;
        list=parameterMapper.selectParameterType();
        return list;
    }

    @Override
    public String deleteParameter(int parameterId) {
        String msg=null;
        int a=0;
        a=parameterMapper.deleteParameter(parameterId);
        if (a>0){
            msg="success";
        }
        return msg;
    }

    @Override
    public String insertParameter(Parameter parameter) {
        String msg=null;
        int a=0;
        a=parameterMapper.insertParameter(parameter);
        if (a>0){
            msg="success";
        }
        return msg;
    }

    @Override
    public String updateParameter(HashMap condition) {
        String msg=null;
        int a=0;
        a=parameterMapper.updateParameter(condition);
        if (a>0){
            msg="success";
        }
        return msg;
    }
}
