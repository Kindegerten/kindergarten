package com.kindergarten.mapper;


import com.kindergarten.bean.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Mapper
public interface ParentsMapper {

    public Parents login(String tel);
    public String FindRole(int roleid);
    public int updatePwd(@Param("tel") String tel,@Param("pwd") String password);

    //校园资讯
    public List<CampusInfo> CampusInfo(@Param("kinderId") int kinderId, @Param("curPage") int curPage, @Param("pageSize") int pageSize);
    public int CampusInfoCount(@Param("kinderId") int kinderId);

    //平台资讯
    public List<PlatformInfo> PlatformInfo(@Param("curPage") int curPage, @Param("pageSize") int pageSize);
    public int PlatformInfoCount();

    //登陆后选择哪个孩子的管理
    public List<Students> SerchStudent(int parentId);
    //查看体检信息
    public List<Examination> SearchBabyHeath(@Param("studentid")int studentId,@Param("curPage") int curPage, @Param("pageSize") int pageSize);
    public int SearchBabyHeathCount(int studentId);
    //查看校园监控信息
    public List<Monitor>SearchVideo(@Param("studentid")int studentid,@Param("curPage") int curPage, @Param("pageSize") int pageSize);
    public int SearchVideoCount(int studentId);

    //查膳食表
    public List<Meal> SearchMeal(@Param("studentid")int studentid, @Param("curPage") int curPage, @Param("pageSize") int pageSize);
    public int SearchMealCount(int studentid);

    //作业列表
    public List<Workrelease> StudentWork(@Param("studentid")int studentid,@Param("curPage") int curPage, @Param("pageSize") int pageSize);
    public int StudentWorkCount(@Param("studentid")int studentid);
    public List<HashMap<String,Object>>WorkResult(@Param("studentid")int studentid);

    //查英文名，用于班级分类文件
    public String SearchEnglishClassName(int studentid);
    //上传文件判断。是否首次上传？还是重新提交
    public int IsNewWork(@Param("workid")String workid,@Param("studentid") String studentid);
    //重新提交
    public int UpdateWork(@Param("url")String url, @Param("parentid")int parentid, @Param("parentname")String parentname, @Param("workid")String workid, @Param("studentid")String studentid);
    //首次提交
    public int UploadWork(@Param("url")String url, @Param("parentid")int parentid, @Param("parentname")String parentname, @Param("workid")String workid, @Param("studentid")String studentid,@Param("studentname")String studentname,@Param("cid")int cid);
    //查找孩子属于哪个班级的，用于作业上传需要
    public int SearchStudentClass(int studentId);
    //通过文件ID找作业文件路径
    public String SearchTeacherWork(int workid);

    //遍历所有的安全视频
    public List<ParentShowSafeQue> AllSafeVideo(@Param("curPage") int curPage, @Param("pageSize") int pageSize);
    public  int AllSafeVideoCount();
    //遍历是否完成安全教育
    public List<HashMap<String,Object>> SearchSafeVideoResult(int studentId);
    //查看答案
    public String SafeEduAns(int videoid);
    //遍历试题
    public List<SafetyVtq> SearchQuestion(int videoId);
    //提交安全教育分数
    public int UpdateQueScore(@Param("videoId")int videoId,@Param("studentId") int studentId,@Param("score")int score);

    //查看亲子阅读的图片list
    public List<ReadmagPhoto> SearchReadmagPhoto (@Param("readmagId") int readmagId);

    //亲子阅读
    public List<Readmag> ParentRead(@Param("curPage") int curPage, @Param("pageSize") int pageSize);
    public int ParentReadCount();

    //找老师名字，电话号码
    public List<Teachers>SearchTeacher(int StudentId);
    //查看考勤
    public List<StuAttendance> SearchStudentKaoQin(@Param("studentId")int studentid,@Param("curPage") int curPage, @Param("pageSize") int pageSize);
    public int SearchStudentKaoQinCount(int studentid);

    //查看需要缴交的费用
    public List<SchoolBill> SearchMyBill (@Param("studentId")int studentid,@Param("curPage") int curPage, @Param("pageSize") int pageSize);
    public int SearchMyBillCount(int studentid);

    //遍历记录表中有无缴费记录
    List<HashMap<String,Object>> FindBilllog(@Param("studentId")int studentId);

    //缴费记录
    StudentBill studentbill(@Param("studentId")int studentId,@Param("schoolbillId")int schoolId);

    //作为支付使用,点击支付发id，而后去请求支付接口

    SchoolBill Pay(@Param("billId")int billId);

    int SuccessPay(StudentBill studentBill);
}
