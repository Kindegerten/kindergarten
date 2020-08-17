package com.kindergarten.mapper;

import com.kindergarten.bean.Examination;
import com.kindergarten.bean.Healther;
import com.kindergarten.bean.Meal;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;


@Mapper
public interface InformMapper {
    //接收通知
    String findInform(String kinderId);
}
