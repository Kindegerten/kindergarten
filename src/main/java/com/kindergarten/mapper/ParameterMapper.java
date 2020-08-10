package com.kindergarten.mapper;

import com.kindergarten.bean.Parameter;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface ParameterMapper {
    List<Parameter>selectParameterList(@Param("condition")HashMap<String,Object>condition,@Param("curPage")int curPage,@Param("pageSize")int pageSize);
    int selectParameterCount(@Param("condition")HashMap<String,Object>condition,@Param("curPage")int curPage,@Param("pageSize")int pageSize);
    List<Parameter>selectParameterType();
    int deleteParameter(int parameterId);
    int updateParameter(@Param("condition")HashMap<String,Object>condition);
    int insertParameter(Parameter parameter);
}
