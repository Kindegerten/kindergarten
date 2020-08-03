package com.kindergarten.service;


import com.kindergarten.bean.LayuiData;
import com.kindergarten.bean.TblTeachers;
import com.kindergarten.bean.TblWorkrelease;

public interface TeacherService
{

   public TblTeachers login(String tel);
   LayuiData publishJobList(TblWorkrelease tblWorkrelease, int page, int pageSize) ;
   int publishTaskAdd(TblWorkrelease tblWorkrelease);
   int delPublishTask(TblWorkrelease tblWorkrelease);

}
