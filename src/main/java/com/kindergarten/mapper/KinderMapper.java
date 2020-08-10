package com.kindergarten.mapper;

import com.kindergarten.bean.Kinder;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;
@Mapper
public interface KinderMapper {

    int selectKinderCount (@Param("condition")HashMap<String,Object>hashMap,@Param("curPage")int curPage,@Param("pageSize")int pageSize);
    List<Kinder> selectKinder (@Param("condition")HashMap<String,Object>hashMap, @Param("curPage")int curPage, @Param("pageSize")int pageSize);
    List<Kinder>selectKinderStatus();//查询园所审批的状态
    List<Kinder>selectKinderState();//查询园所账号的禁用启用状态

    Kinder selectApproveKinder(int kinderId);
    int upKinderSatus(Kinder kinder);
    int banKinderSatus(Kinder kinder);
   int deleteKinder(int kinderId);
   int restPwd(Kinder kinder);
   int upKinderState(int kinderId);
   int banKinderState(int kinderId);
   int selectKinderByone(Kinder kinder);
   int insertKinder(Kinder kinder);
   int updateKinder(Kinder kinder);

}
