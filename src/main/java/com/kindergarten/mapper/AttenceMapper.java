package com.kindergarten.mapper;

import com.kindergarten.bean.FaceUserList;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AttenceMapper {

    //考勤
    int insertAttendance(FaceUserList faceUserList);

}
