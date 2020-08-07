package com.kindergarten.mapper;


import com.kindergarten.bean.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;
import java.util.logging.Handler;

@Mapper
public interface AdminMapper {
    //输入输出参数以及方法名和xml对应，接口里面的方法不需要用public
    Admin login(String adminTel, String adminPwd);
    int updatePwd(Admin admin);
    List<Parents> selectParent(@Param("condition") HashMap<String, Object> hashMap, @Param("curPage") int curPage, @Param("pageSize") int pageSize);
    int selectParentCount(@Param("condition") HashMap<String, Object> hashMap, @Param("curPage") int curPage, @Param("pageSize") int pageSize);
    int banByparents(int id);
    int upByparents(int id);
    int insertParents(Parents parents);
    int  selectOneByparents(String parentsTel);
    List<Teachers> selectTeacher(@Param("condition") HashMap<String, Object> hashMap, @Param("curPage") int curPage, @Param("pageSize") int pageSize);
    int selectTeacherCount(@Param("condition") HashMap<String, Object> hashMap, @Param("curPage") int curPage, @Param("pageSize") int pageSize);

    int insertTeacher(Teachers teachers);
    int  selectOneByteacher(String teacherTel);

    int banByteachers(int id);
    int upByteachers(int id);

    List<Healther> selectHealther(@Param("condition") HashMap<String, Object> hashMap, @Param("curPage") int curPage, @Param("pageSize") int pageSize);
    int selectHealtherCount(@Param("condition") HashMap<String, Object> hashMap, @Param("curPage") int curPage, @Param("pageSize") int pageSize);

    int banByhealther(int id);
    int upByhealther(int id);

    int insertHealther(Healther healther);
    int  selectOneByhealther(String healtherPhone);

    List<Security> selectSecurity(@Param("condition") HashMap<String, Object> hashMap, @Param("curPage") int curPage, @Param("pageSize") int pageSize);
    int selectSecurityCount(@Param("condition") HashMap<String, Object> hashMap, @Param("curPage") int curPage, @Param("pageSize") int pageSize);

    int banBysecurity(int id);
    int  upBysecurity(int id);
    int insertSecurity(Security security);
    int  selectOneBySecurity(String securityPhone);

    List<Rector> selectRector(@Param("condition") HashMap<String, Object> hashMap, @Param("curPage") int curPage, @Param("pageSize") int pageSize);
    int selectRectorCount(@Param("condition") HashMap<String, Object> hashMap, @Param("curPage") int curPage, @Param("pageSize") int pageSize);

    int banByRector(int id);
    int  upByRector(int id);
    int insertRector(Rector rector);
    int  selectOneByRector(String rectorTel);

    List<Students> selectStudent(@Param("condition") HashMap<String, Object> hashMap, @Param("curPage") int curPage, @Param("pageSize") int pageSize);
    int selectStudentCount(@Param("condition") HashMap<String, Object> hashMap, @Param("curPage") int curPage, @Param("pageSize") int pageSize);
    List<Students> selectClassName();
    List<Classes>findClassesList();
    List<Classes>selectClasses(int kinderId);
    int insertStudent(Students students);
    int selectPlatformInfoCount(@Param("condition") HashMap<String, Object> hashMap, @Param("curPage") int curPage, @Param("pageSize") int pageSize);
    List<PlatformInfo> selectPlatformInfo(@Param("condition") HashMap<String, Object> hashMap, @Param("curPage") int curPage, @Param("pageSize") int pageSize);
    int deletePlatformInfo(int platformInfoId);
    int release(int platformInfoId);
    int cancel(int platformInfoId);
    int updatePlatformInfo(PlatformInfo platformInfo);
    int insertPlatformInfo(PlatformInfo platformInfo);
    int selectSyslogCount(@Param("condition") HashMap<String, Object> hashMap, @Param("curPage") int curPage, @Param("pageSize") int pageSize);
    List<Syslog> selectSyslog(@Param("condition") HashMap<String, Object> hashMap, @Param("curPage") int curPage, @Param("pageSize") int pageSize);
    int selectOneFile(SafetyVideo safetyVideo);
    int insertVideo(SafetyVideo safetyVideo);
    int selectSafetyVideoCount(@Param("condition") HashMap<String, Object> hashMap, @Param("curPage") int curPage, @Param("pageSize") int pageSize);
    List<SafetyVideo> selectSafetyVideo(@Param("condition") HashMap<String, Object> hashMap, @Param("curPage") int curPage, @Param("pageSize") int pageSize);
    int deleteSafetyVideo(int safetyVideoId);
}
