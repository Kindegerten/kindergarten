package com.kindergarten.mapper;
import com.kindergarten.bean.Photo;
import com.kindergarten.bean.TblWorkrelease;
import com.kindergarten.bean.Teachers;
import com.kindergarten.bean.Work;
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
   public List<TblWorkrelease> publishJobList(@Param("e") TblWorkrelease tblPublishTask, @Param("start") int start, @Param("pageSize") int pageSize);
   int publishJobListCount(TblWorkrelease tblWorkrelease);//总数
   //添加发布作业
   int publishTaskAdd(TblWorkrelease tblPublishTask);
   //删除
   int delPublishTask(TblWorkrelease tblPublishTask);

   //查宝宝作业表格
   List<Work> selectList(@Param("e") TblWorkrelease tblPublishTask, @Param("start") int start, @Param("pageSize") int pageSize);
   int selectListCount(TblWorkrelease tblPublishTask);
   //修改作业评级
   int updateTask(@Param("e") Work tblTask);

   //班级相册
   List<Photo> photoSelectList(@Param("idNum") int idNum, @Param("start") int start, @Param("pageSize") int pageSize);
   int photoSelectListCount();
   int addClassPhoto(@Param("e") Photo classPhoto);

}
