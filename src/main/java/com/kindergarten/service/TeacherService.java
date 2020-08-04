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


}
