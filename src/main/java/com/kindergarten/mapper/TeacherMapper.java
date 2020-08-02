package com.kindergarten.mapper;

import com.kindergarten.bean.TblTeachers;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface TeacherMapper
{

   public TblTeachers tologin(String tel);
   public String FindRole(int teacherid);
   //修改密码
   public int updatePwd(@Param("tel") String tel, @Param("pwd") String password);
   //课程表
   public String course(String teacherid);

}
