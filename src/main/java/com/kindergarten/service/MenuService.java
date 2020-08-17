package com.kindergarten.service;


import com.kindergarten.bean.LayuiData;
import com.kindergarten.bean.Menu;
import com.kindergarten.bean.MenuDemo;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface MenuService<T> {
    public List<Menu> findMenuList(String adminTel);
    List<Menu>selectOneMenu();
    LayuiData<T>selectMenuList(@Param("condition") HashMap<String, Object> hashMap, @Param("curPage") int curPage, @Param("pageSize") int pageSize);
   String deleteMenu(int menuId);
   String updateMenu(@Param("condition") HashMap<String, Object> hashMap);
   String insertMenu(Menu menu);
    List<MenuDemo> selectParentMenu(int rid);
    List<MenuDemo> selectChileMenu(int parentId);
    String insertMenuByrole(ArrayList<Menu> list);
     List<String> compare(List<String> sourceArr2,List<String>  menuId) ;
     String updateMenuByrid(int rid,List<String> sourceArr2,List<String>  menuId);
}
