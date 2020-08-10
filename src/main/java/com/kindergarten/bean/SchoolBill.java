package com.kindergarten.bean;

public class SchoolBill {
    private int billId;
    private String billName;
    private int billMoney;
    private String billDirector;
    private int billClassId;
    private String billClassName;
    private int kinderId;
    private String billCreatetime;

    private String studentbillType="未缴费";

    public SchoolBill() {
    }

    public int getBillId() {
        return billId;
    }

    public String getBillCreatetime() {
        return billCreatetime;
    }

    public void setBillCreatetime(String billCreatetime) {
        this.billCreatetime = billCreatetime;
    }

    public String getStudentbillType() {
        return studentbillType;
    }

    public void setStudentbillType(String studentbillType) {
        this.studentbillType = studentbillType;
    }

    public void setBillId(int billId) {
        this.billId = billId;
    }

    public String getBillName() {
        return billName;
    }

    public void setBillName(String billName) {
        this.billName = billName;
    }

    public int getBillMoney() {
        return billMoney;
    }

    public void setBillMoney(int billMoney) {
        this.billMoney = billMoney;
    }

    public String getBillDirector() {
        return billDirector;
    }

    public void setBillDirector(String billDirector) {
        this.billDirector = billDirector;
    }

    public int getBillClassId() {
        return billClassId;
    }

    public void setBillClassId(int billClassId) {
        this.billClassId = billClassId;
    }

    public String getBillClassName() {
        return billClassName;
    }

    public void setBillClassName(String billClassName) {
        this.billClassName = billClassName;
    }

    public int getKinderId() {
        return kinderId;
    }

    public void setKinderId(int kinderId) {
        this.kinderId = kinderId;
    }
}
