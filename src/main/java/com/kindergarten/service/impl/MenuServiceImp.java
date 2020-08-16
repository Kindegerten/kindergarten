package com.kindergarten.service.impl;


import com.kindergarten.bean.LayuiData;
import com.kindergarten.bean.Menu;
import com.kindergarten.bean.MenuDemo;
import com.kindergarten.bean.Parents;
import com.kindergarten.mapper.MenuMapper;
import com.kindergarten.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
//import org.springframework.transaction.annotation.Transactional;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
@Transactional
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
    public List<MenuDemo> selectParentMenu(int rid) {
        return menuMapper.selectParentMenu(rid);
    }

    @Override
    public List<MenuDemo> selectChileMenu(int parentId) {
        return menuMapper.selectChileMenu(parentId);
    }

    @Override
    public String updateMenuByrid(int rid, List sourceArr2, List menuId) {
        List<String>deleteList=compare(sourceArr2, menuId);
        List<String>insertList=compare(menuId,sourceArr2);
        System.out.println("deleteList"+deleteList);
        System.out.println("insertList"+insertList);
        String msg=null;
        if(insertList!=null && insertList.size()>0){
                    ArrayList<Menu>list=new ArrayList<>();
        for (int k=0;k<insertList.size();k++){
//            System.out.println(sourceArr2[i]);
            Menu menu=new Menu();
            menu.setOrderId(rid);
            menu.setMenuId(Integer.parseInt(insertList.get(k)));
            list.add(menu);
        }
            int i=menuMapper.insertMenuByrole(list);//插入菜单
            if(i!=insertList.size()){

                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();//手动回滚
                msg= "error";
            }else {
                msg= "success";
            }
        }

        if(deleteList!=null && deleteList.size()>0){
            int j=menuMapper.deleteMenuById(deleteList,rid);//删除菜单
            if(j!=deleteList.size()){
                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();//手动回滚
                msg= "error";
            }else {
                msg= "success";
            }
        }
        return msg;
    }

    @Override
    //对两个集合进行比较，当两个集合中有不同元素，放在新的集合里 ,查询集合list3独有的数据
    public List<String> compare(List sourceArr2, List menuId) {
        List<String>list=new ArrayList<>();//存放不同元素的集合
        for (Object s:menuId){
            if(!sourceArr2.contains(s)){
                list.add((String) s);
            }
        }
        return list;
    }


    @Override
    public String insertMenuByrole(ArrayList list) {
        String msg=null;
        int a=0;
        a=menuMapper.insertMenuByrole(list);
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
