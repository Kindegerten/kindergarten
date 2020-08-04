package com.kindergarten.service.impl;


import com.kindergarten.bean.Menu;
import com.kindergarten.mapper.MenuMapper;
import com.kindergarten.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("menuService")
public class MenuServiceImp implements MenuService {
    @Autowired
    MenuMapper menuMapper;

    @Override
    public List<Menu> findMenuList(String adminTel) {
        return menuMapper.findMenuList(adminTel);
    }
}
