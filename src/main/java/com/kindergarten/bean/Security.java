package com.kindergarten.bean;

<<<<<<< HEAD
import java.util.Date;

public class Security {
    private int securityId;
    private String securityName;
    private String securitySex;
    private int securityAge;
    private String securityAdd;
    private String securityPhone;
    private Date securityRegtime;
    private int rid;
    private int securityStatus;
    private String securityPwd;
=======
import java.math.BigDecimal;

public class Security {

    private int securityId,securityAge,rid,securityState;
    private String securityName,securityPwd,securityAdd,securityRegtime,vCode;
    private String securityPhone,securitySex,securityStateName;
>>>>>>> origin/master

    public Security() {
    }

<<<<<<< HEAD
=======
    public Security(int securityId, int securityAge, int rid, int securityState, String securityName, String securityPwd, String securityAdd, String securityRegtime, String vCode, String securityPhone, String securitySex, String securityStateName) {
        this.securityId = securityId;
        this.securityAge = securityAge;
        this.rid = rid;
        this.securityState = securityState;
        this.securityName = securityName;
        this.securityPwd = securityPwd;
        this.securityAdd = securityAdd;
        this.securityRegtime = securityRegtime;
        this.vCode = vCode;
        this.securityPhone = securityPhone;
        this.securitySex = securitySex;
        this.securityStateName = securityStateName;
    }

    @Override
    public String toString() {
        return "Security{" +
                "securityId=" + securityId +
                ", securityAge=" + securityAge +
                ", rid=" + rid +
                ", securityState=" + securityState +
                ", securityName='" + securityName + '\'' +
                ", securityPwd='" + securityPwd + '\'' +
                ", securityAdd='" + securityAdd + '\'' +
                ", securityRegtime='" + securityRegtime + '\'' +
                ", vCode='" + vCode + '\'' +
                ", securityPhone='" + securityPhone + '\'' +
                ", securitySex='" + securitySex + '\'' +
                ", securityStateName='" + securityStateName + '\'' +
                '}';
    }

>>>>>>> origin/master
    public int getSecurityId() {
        return securityId;
    }

    public void setSecurityId(int securityId) {
        this.securityId = securityId;
    }

<<<<<<< HEAD
    public String getSecurityName() {
        return securityName;
    }

    public void setSecurityName(String securityName) {
        this.securityName = securityName;
    }

    public String getSecuritySex() {
        return securitySex;
    }

    public void setSecuritySex(String securitySex) {
        this.securitySex = securitySex;
    }

    public int getSecurityAge() {
        return securityAge;
    }

    public void setSecurityAge(int securityAge) {
        this.securityAge = securityAge;
=======
    public int getSecurityAge() {
        return securityAge;
    }

    public void setSecurityAge(int securityAge) {
        this.securityAge = securityAge;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public int getSecurityState() {
        return securityState;
    }

    public void setSecurityState(int securityState) {
        this.securityState = securityState;
    }

    public String getSecurityName() {
        return securityName;
    }

    public void setSecurityName(String securityName) {
        this.securityName = securityName;
    }

    public String getSecurityPwd() {
        return securityPwd;
    }

    public void setSecurityPwd(String securityPwd) {
        this.securityPwd = securityPwd;
>>>>>>> origin/master
    }

    public String getSecurityAdd() {
        return securityAdd;
    }

    public void setSecurityAdd(String securityAdd) {
        this.securityAdd = securityAdd;
    }

<<<<<<< HEAD
    public String getSecurityPhone() {
        return securityPhone;
    }

    public void setSecurityPhone(String securityPhone) {
        this.securityPhone = securityPhone;
    }

    public Date getSecurityRegtime() {
        return securityRegtime;
    }

    public void setSecurityRegtime(Date securityRegtime) {
        this.securityRegtime = securityRegtime;
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public int getSecurityStatus() {
        return securityStatus;
    }

    public void setSecurityStatus(int securityStatus) {
        this.securityStatus = securityStatus;
    }

    public String getSecurityPwd() {
        return securityPwd;
    }

    public void setSecurityPwd(String securityPwd) {
        this.securityPwd = securityPwd;
=======
    public String getSecurityRegtime() {
        return securityRegtime;
    }

    public void setSecurityRegtime(String securityRegtime) {
        this.securityRegtime = securityRegtime;
    }

    public String getvCode() {
        return vCode;
    }

    public void setvCode(String vCode) {
        this.vCode = vCode;
    }

    public String getSecurityPhone() {
        return securityPhone;
    }

    public void setSecurityPhone(String securityPhone) {
        this.securityPhone = securityPhone;
    }

    public String getSecuritySex() {
        return securitySex;
    }

    public void setSecuritySex(String securitySex) {
        this.securitySex = securitySex;
    }

    public String getSecurityStateName() {
        return securityStateName;
    }

    public void setSecurityStateName(String securityStateName) {
        this.securityStateName = securityStateName;
>>>>>>> origin/master
    }
}
