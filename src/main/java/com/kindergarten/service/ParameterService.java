package com.kindergarten.service;

import com.kindergarten.bean.LayuiData;
import com.kindergarten.bean.Parameter;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface ParameterService<T> {
    LayuiData<T>selectParameterList(@Param("condition") HashMap<String,Object> condition, @Param("curPage")int curPage, @Param("pageSize")int pageSize);
    List<Parameter> selectParameterType();
    String deleteParameter(int parameterId);
    String updateParameter(@Param("condition")HashMap<String,Object>condition);
    String insertParameter(Parameter parameter);
}
