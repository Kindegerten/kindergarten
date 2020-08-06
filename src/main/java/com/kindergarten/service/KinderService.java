package com.kindergarten.service;

import com.kindergarten.bean.Kinder;
import com.kindergarten.bean.LayuiData;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface KinderService<T> {
    LayuiData<T> selectKinder (@Param("condition") HashMap<String,Object> condition, @Param("curPage")int curPage, @Param("pageSize")int pageSize);
    List<Kinder>selectKinderStatus();
    List<Kinder>selectKinderState();
    Kinder selectApproveKinder(int kinderId);

    String upKinderSatus(Kinder kinder);
    String banKinderSatus(Kinder kinder);
    String deleteKinder(int kinderId);
    String restPwd(Kinder kinder);
    String updateKinderState(int kinderId,String msg);
    String insertKinder(Kinder kinder);
    String  updateKinder(Kinder kinder);

}
