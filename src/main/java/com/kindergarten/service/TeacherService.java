package com.kindergarten.service;


import com.kindergarten.bean.*;

public interface TeacherService
{

   public Teachers login(String tel);
   LayuiData publishJobList(TblWorkrelease tblWorkrelease, int page, int pageSize) ;//老师作业
   int publishTaskAdd(TblWorkrelease tblWorkrelease);
   int delPublishTask(TblWorkrelease tblWorkrelease);
   LayuiData selectList(TblWorkrelease tblWorkrelease, int page, int pageSize);//学生作业
   int updateTask(Work tblTask);//修改作业评级
   LayuiData phototSelectList(int idNum, int page, int pageSize) ;//班级相册
   int addClassPhoto(Photo classPhoto);
   //班级信息
   LayuiData classInfoSelectList(ClassInfo classInf, String endTime,int page, int pageSize) ;
   //班级通知
   LayuiData clamsgSelectList(Clamsg tblClassNotice, String endTime, int page, int pageSize) ;
   //添加发布
   int clamsgAdd(Clamsg tblClassNotice);
   //删除
   int delClamsg(Clamsg tblClassNotice);
   //修改
   int updateClamsg(Clamsg tblClassNotice);
   //安全试题配置
   //查询列表
   LayuiData safetyEduSelectList( int idNum  , int page, int pageSize) ;
   //添加
   int addSafetyEdu(SafetyEdu tblSafetyEdu);
   //修改
   int updateSafetyEdu(SafetyEdu tblSafetyEdu);
   //视频名字
   LayuiData safetyVideoSelectList();
   //安全试题完成情况
   LayuiData safetyTestCompleteSelectList(SafetyTestComplete safetyTestOut, String endTime,int page, int pageSize);


}
