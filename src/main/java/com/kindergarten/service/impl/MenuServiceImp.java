package com.kindergarten.service.impl;


import com.kindergarten.bean.LayuiData;
import com.kindergarten.bean.Menu;
import com.kindergarten.bean.Parents;
import com.kindergarten.mapper.MenuMapper;
import com.kindergarten.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service("menuService")
public class MenuServiceImp implements MenuService {
    @Autowired
    MenuMapper menuMapper;

    @Override
    public List<Menu> findMenuList(String adminTel) {
        return menuMapper.findMenuList(adminTel);
    }

    @Override
    public List<Menu> selectOneMenu() {
        return menuMapper.selectOneMenu();
    }

    @Override
    public String deleteMenu(int menuId) {
        String msg=null;
        int a=0;
        a=menuMapper.deleteMenu(menuId);
        if (a>0){
            msg="success";
        }
        return msg;
    }

    @Override
    public String insertMenu(Menu menu) {
        String msg=null;
        int a=0;
        a=menuMapper.insertMenu(menu);
        if (a>0){
            msg="success";
        }
        return msg;
    }

    @Override
    public String updateMenu(HashMap hashMap) {
        String msg=null;
        int a=0;
        a=menuMapper.updateMenu(hashMap);
        if (a>0){
            msg="success";
        }
        return msg;
    }

    @Override
    public LayuiData selectMenuList(HashMap hashMap, int curPage, int pageSize) {
        LayuiData<Menu> layuiData = null;
        List<Menu> list =null;
        int a=0;
            list= menuMapper.selectMenuList(hashMap, curPage, pageSize);
            a= menuMapper.selectMenuListCount(hashMap, curPage, pageSize);

        if (list.size() > 0) {
            layuiData = new LayuiData<>(0, "", a, list);
        } else {
            layuiData = new LayuiData<>(1, "查询失败", 0, null);
        }
        return layuiData;
    }
}
