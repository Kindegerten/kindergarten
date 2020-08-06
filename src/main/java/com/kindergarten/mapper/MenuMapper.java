package com.kindergarten.mapper;


import com.kindergarten.bean.Menu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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
}
