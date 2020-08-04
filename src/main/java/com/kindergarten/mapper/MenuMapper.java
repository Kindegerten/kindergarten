package com.kindergarten.mapper;


import com.kindergarten.bean.Menu;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface MenuMapper {
    public List<Menu> findMenuList(String adminTel);
}
