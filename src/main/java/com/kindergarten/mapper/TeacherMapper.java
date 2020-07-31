package com.kindergarten.mapper;

import com.kindergarten.bean.TblTeachers;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TeacherMapper
{

   public TblTeachers tologin(String tel);
   public String FindRole(int teacherid);

}
