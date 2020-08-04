package com.kindergarten.mapper;

import com.kindergarten.bean.Teachers;
import com.kindergarten.bean.Workrelease;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TeacherMapper
{

   public Teachers tologin(String tel);
   public String FindRole(int teacherid);
   //修改密码
   public int updatePwd(@Param("tel") String tel, @Param("pwd") String password);
   //课程表
   public String course(String teacherid);
   //查发布作业表格
   public List<Workrelease> publishJobList(@Param("e") Workrelease tblPublishTask, @Param("start") int start, @Param("pageSize") int pageSize);
   int publishJobListCount(Workrelease workrelease);//总数
   //添加发布作业
   int publishTaskAdd(Workrelease tblPublishTask);
   //删除
   int delPublishTask(Workrelease tblPublishTask);

}
