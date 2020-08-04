package com.kindergarten.service.impl;

import com.alibaba.fastjson.JSON;
import com.kindergarten.bean.*;
import com.kindergarten.mapper.ParentsMapper;
import com.kindergarten.service.ParentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class ParentServiceimpl implements ParentService {
    @Autowired
    ParentsMapper parentsMapper;

    @Override
    public Parents login(String tel) {
        Parents parents=null;

        parents=parentsMapper.login(tel);

        return parents;
    }

    @Override
    public LayuiData<CampusInfo> CampusInfo(int kinderId, int curPage, int pageSize) {
        LayuiData<CampusInfo> layuiData = null;
        List<CampusInfo> list=parentsMapper.CampusInfo(kinderId, curPage, pageSize);
        int totalRecord=parentsMapper.CampusInfoCount(kinderId);
        layuiData = new LayuiData<>(0,"",totalRecord,list);
        return layuiData;
    }

    @Override
    public LayuiData<PlatformInfo> PlatformInfo(int curPage, int pageSize) {
        LayuiData<PlatformInfo> layuiData = null;
        List<PlatformInfo> list=parentsMapper.PlatformInfo( curPage, pageSize);
        int totalRecord=parentsMapper.PlatformInfoCount();
        layuiData = new LayuiData<>(0,"",totalRecord,list);
        return layuiData;
    }

    @Override
    public List<Students> studentsList(int parentId) {
        return parentsMapper.SerchStudent(parentId);
    }

    @Override
    public LayuiData<Examination> examination(int studentId,int curPage, int pageSize) {
//        parentsMapper.SearchBabyHeath(studentId)
        LayuiData<Examination> layuiData=null;
        List<Examination> examinations=parentsMapper.SearchBabyHeath(studentId,curPage,pageSize);
        int totalRecord=parentsMapper.SearchBabyHeathCount(studentId);
        layuiData=new LayuiData<>(0,"",totalRecord,examinations);

        return layuiData;
    }

    @Override
    public LayuiData<Monitor> monitors(int studentId,int curPage, int pageSize) {
        LayuiData<Monitor> layuiData=null;
        List<Monitor> examinations=parentsMapper.SearchVideo(studentId,curPage,pageSize);
        int totalRecord=parentsMapper.SearchVideoCount(studentId);
        layuiData=new LayuiData<>(0,"",totalRecord,examinations);

        return layuiData;
    }

    @Override
    public PageBean<Meal> meals(int studentId, int curPage, int pageSize) {
        List<Meal> mealList=parentsMapper.SearchMeal(studentId,curPage,pageSize);
        int totalrecord=parentsMapper.SearchMealCount(studentId);
            PageBean<Meal> pageBean = new PageBean<>(curPage,totalrecord,pageSize);
            pageBean.setList(mealList);

        return pageBean;
    }

    @Override
    public LayuiData<Workrelease> studentWork(int studentId, int curPage, int pageSize) {
        LayuiData<Workrelease> layuiData=null;
        List<Workrelease> workreleases=parentsMapper.StudentWork(studentId,curPage,pageSize);
        int totalRecord=parentsMapper.StudentWorkCount(studentId);
        List<HashMap<String,Object>> map=parentsMapper.WorkResult(studentId);
        for (int i=0;i<map.size();i++){
            for (int j=0;j<workreleases.size();j++){
                if (String.valueOf(map.get(i).get("work_releaseid")).equals(String.valueOf(workreleases.get(j).getWorkreleaseId()))){
                    workreleases.get(j).setWorkResult(map.get(i).get("work_result")+"");
                    workreleases.get(j).setWorkEva(map.get(i).get("work_eva")+"");
                }
            }

        }
//            for (int i=0;i<map.size();i++){
//                System.out.println("============================================");
//                System.out.println(map.get(i));
//                System.out.println(map.get(i).get("work_result"));
//                System.out.println(map.get(i).get("work_releaseid"));
//
//            }

//        System.out.println(JSON.toJSONString(map));
//        System.out.println(JSON.toJSONString(workreleases));

        layuiData=new LayuiData<>(0,"",totalRecord,workreleases);

        return layuiData;
    }

    @Override
    public LayuiData<ParentShowSafeQue> AllSafeEducation(int parentId,int curPage, int pageSize) {
        LayuiData<ParentShowSafeQue> layuiData=null;
        List<ParentShowSafeQue> list=parentsMapper.AllSafeVideo(curPage, pageSize);
        int totalRecord=parentsMapper.AllSafeVideoCount();
        List<HashMap<String,Object>> map=parentsMapper.SearchSafeVideoResult(parentId);
       for (int i=0;i<list.size();i++){
           for (int j=0;j<map.size();j++){
               if (String.valueOf(map.get(j).get("safety_video_id")).equals(String.valueOf(list.get(i).getSafetyVideoId()))){
                   list.get(i).setSafetyTestScore(map.get(j).get("safety_test_score")+"");
                   list.get(i).setSafetyTestResult(map.get(j).get("safety_test_result")+"");
               }

           }
       }

//        System.out.println(JSON.toJSONString(map));


        layuiData=new LayuiData<>(0,"",totalRecord,list);



        return layuiData;
    }
}
