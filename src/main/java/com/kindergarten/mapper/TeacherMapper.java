package com.kindergarten.mapper;

import com.kindergarten.bean.*;
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
   public List<Course> courseTeacher(@Param("e")Course course, @Param("start") int start, @Param("pageSize") int pageSize);
   public int courseTeacherCount();
//   public String course(String teacherid);
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
   //班级信息
   //查表格
   List<ClassInfo> classInfoSelectList(@Param("e") ClassInfo classInf, String endTime, @Param("start") int start, @Param("pageSize") int pageSize);
   int classInfoSelectListCount();
   //查询班级总数
   int classInfoSelClassCount();

   //班级通知
   //查表格
   List<Clamsg> clamsgSelectList(@Param("e") Clamsg tblClassNotice, String endTime, @Param("start") int start, @Param("pageSize") int pageSize);
   int clamsgSelectListCount();
   //添加发布
   int clamsgAdd(Clamsg tblClassNotice);
   //删除
   int delClamsg(Clamsg tblClassNotice);
   //修改
   int updateClamsg(Clamsg tblClassNotice);

   //安全试题配置
   //查安全教育表格
   List<SafetyEdu> safetyEduSelectList(@Param("idNum") int idNum, @Param("start") int start, @Param("pageSize") int pageSize);
   int safetyEduSelectListCount();
   //添加答题
   int addSafetyEdu( SafetyEdu tblSafetyEdu);
   //修改信息
   int updateSafetyEdu(SafetyEdu tblSafetyEdu);

   List<SafetyVideo> safetyVideoSelectList();
   int safetyVideoSelectListCount();

   //查看对应班级孩子的家长列表，用于显示聊天列表
   public List<Parents> SearchParents(int teacherId);

   //试题完成情况
   List<SafetyTestComplete> safetyTestCompleteSelectList(@Param("e") SafetyTestComplete safetyTestOut, String endTime,@Param("start") int start, @Param("pageSize") int pageSize);
   int safetyTestCompleteSelectListCount();

}
