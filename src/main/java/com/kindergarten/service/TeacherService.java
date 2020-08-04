package com.kindergarten.service;


import com.kindergarten.bean.LayuiData;
import com.kindergarten.bean.Teachers;
import com.kindergarten.bean.Workrelease;

public interface TeacherService
{

   public Teachers login(String tel);
   LayuiData publishJobList(Workrelease workrelease, int page, int pageSize) ;
   int publishTaskAdd(Workrelease workrelease);
   int delPublishTask(Workrelease workrelease);

}
