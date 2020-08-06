package com.kindergarten.service;


import com.kindergarten.bean.LayuiData;
import com.kindergarten.bean.Menu;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface MenuService<T> {
    public List<Menu> findMenuList(String adminTel);
    List<Menu>selectOneMenu();
    LayuiData<T>selectMenuList(@Param("condition") HashMap<String, Object> hashMap, @Param("curPage") int curPage, @Param("pageSize") int pageSize);
   String deleteMenu(int menuId);
   String updateMenu(@Param("condition") HashMap<String, Object> hashMap);
   String insertMenu(Menu menu);
}
