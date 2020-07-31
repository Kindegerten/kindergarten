package com.kindergarten.service;


import com.kindergarten.bean.Menu;

import java.util.List;

public interface MenuService {
    public List<Menu> findMenuList(String adminTel);
}
