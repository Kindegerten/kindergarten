package com.kindergarten.bean;

import java.util.List;

public class PageBean<T> {
    private int curPage; //当前页码
    private int prePage;//上一页
    private int nextPage;//下一页
    private int totalPage;//总页数
    private  int totalRecord; //数据的总记录数，count
    private int pageSize;  //按条数分页
    private List<T> list;  //分页到的数据集合

    public PageBean(int curPage, int totalRecord, int pageSize) {
        this.curPage = curPage;
        this.pageSize = pageSize;
        this.totalRecord = totalRecord;
        totalPage = totalRecord%pageSize==0?totalRecord/pageSize:totalRecord/pageSize+1;
        //判断总页数，利用三目运算：   ==0总的记录数/页数 否则：+1。
    }

    public PageBean() {
    }

    public int getCurPage() {
        return curPage;
    }

    public void setCurPage(int curPage) {
        this.curPage = curPage;
    }

    public int getPrePage() {
        //对于拿上一页进行判断。如果已经是第一页？ 否则？
        return curPage==1?1:curPage-1;
    }

    public void setPrePage(int prePage) {
        this.prePage = prePage;
    }

    public int getNextPage() {
        //对于拿下一页进行判断。如果已经是最后一页？ 否则？
        return curPage==totalPage?totalPage:curPage+1;

    }

    @Override
    public String toString() {
        return "PageBean{" +
                "list=" + list +
                '}';
    }

    public void setNextPage(int nextPage) {
        this.nextPage = nextPage;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }
}
