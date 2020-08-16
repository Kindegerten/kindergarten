package com.kindergarten.mapper;


import com.kindergarten.bean.Menu;
import com.kindergarten.bean.MenuDemo;
import com.kindergarten.bean.Role;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
@Mapper
public interface MenuMapper {
    public List<Menu> findMenuList(String adminTel);
    List<Menu>selectOneMenu();
    int selectMenuListCount(@Param("condition") HashMap<String, Object> hashMap, @Param("curPage") int curPage, @Param("pageSize") int pageSize);
    List<Menu> selectMenuList(@Param("condition") HashMap<String, Object> hashMap, @Param("curPage") int curPage, @Param("pageSize") int pageSize);
    int deleteMenu(int menuId);
    int updateMenu(@Param("condition") HashMap<String, Object> hashMap);
    int insertMenu(Menu menu);
    List<MenuDemo> selectParentMenu(int rid);
    List<MenuDemo> selectChileMenu(int parentId);
    List<Role>selectRole();
    List<MenuDemo>noMenuByrid(int rid);
    List<MenuDemo>selectAllMenu();
    int insertMenuByrole(List<Menu>list);
    List<String>selectMid(int rid);
    int deleteMenuById(List<String>list,@Param("rid") int rid);
}
