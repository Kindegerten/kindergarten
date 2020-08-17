package com.kindergarten.service;


import com.kindergarten.bean.*;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface AdminService<T> {
    Admin login(String adminTel, String adminPwd);
    String  updatePwd(Admin admin);
   LayuiData<T> selectParent(@Param("condition") HashMap<String, Object> hashMap, @Param("curPage") int curPage, @Param("pageSize") int pageSize,int roleID);
    int updateParents(int id, int typeMath,int roleId);
    String insertParents(Parents parents);
    boolean selectOneByparents(String parentsTel);
   // LayuiData<T> selectTeacher(@Param("condition") HashMap<String, Object> hashMap, @Param("curPage") int curPage, @Param("pageSize") int pageSize);
   String insertTeacher(Teachers teachers);
   String insertHealther(Healther healther);
   String insertSercurity(Security security);
   String insertRector(Rector rector);
    LayuiData<T> selectStudent(@Param("condition") HashMap<String, Object> hashMap, @Param("curPage") int curPage, @Param("pageSize") int pageSize);
    List<Students> selectClassName();
    List<Classes>findClassesList();
    List<Classes>selectClasses(int kinderId);
    String insertStudent(Students students);
    LayuiData<T>selectPlatformInfo(@Param("condition") HashMap<String, Object> hashMap, @Param("curPage") int curPage, @Param("pageSize") int pageSize);
    String deletePlatformInfo(int platformInfoId);
    String releaseOrCancel(int platformInfoId,String title);
    String updatePlatformInfo(PlatformInfo platformInfo);
    String insertPlatformInfo(PlatformInfo platformInfo);
    LayuiData<T>selectSyslog(@Param("condition") HashMap<String, Object> hashMap, @Param("curPage") int curPage, @Param("pageSize") int pageSize);
    SafetyVideo selectOneFile(SafetyVideo safetyVideo);
    String insertVideo(SafetyVideo safetyVideo);
    LayuiData selectSafetyVideo(@Param("condition") HashMap<String, Object> hashMap, @Param("curPage") int curPage, @Param("pageSize") int pageSize);
    String deleteSafetyVideo(int safetyVideoId);
    String updateSafetyVideo(SafetyVideo safetyVideo);
    String insertSafetyVtq(SafetyVtq safetyVtq);
    String updateSafetyVtq(SafetyVtq safetyVtq);
    String deleteSafetyVtq(int safetyVtqId);
    LayuiData<T>SearchQuestion( @Param("curPage") int curPage, @Param("pageSize") int pageSize,@Param("videoId") int videoId);
    String insertReadmsg(Readmag readmag);
    String insertReadmsgPhoto(ReadmagPhoto readmagPhoto);
    int selectStudentSex(String studentSex);
    int selectStudentHealth(String healthStatus);
    String updateReadPhoto(ReadmagPhoto readmagPhoto);
    String selectAnswer(int safetyVideoId);
    String updateAnswer(SafetyVideo safetyVideo);
}
