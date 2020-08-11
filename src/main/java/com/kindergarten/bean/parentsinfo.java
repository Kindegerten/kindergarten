package com.kindergarten.bean;

public class parentsinfo extends Parents {
    private String studentName;
    private String relationName;
    private  String studentsId;
    private  String relationId;
    public parentsinfo() {
    }

    public parentsinfo(String studentName, String relationName, String studentId,String relationId) {
        this.studentName = studentName;
        this.relationName = relationName;
        this.studentsId = studentId;
        this.relationId = relationId;
    }

    public parentsinfo(int parentsId, String parentsTel, String parentsName, String parentsSex, int parentsStatus, String parentsPwd, String job, String parentsRegtime, int roleID, int kinderId, String roleName, String studentName, String relationName, String studentId,String relationId) {
        super(parentsId, parentsTel, parentsName, parentsSex, parentsStatus, parentsPwd, job, parentsRegtime, roleID, kinderId, roleName);
        this.studentName = studentName;
        this.relationName = relationName;
        this.studentsId = studentId;
        this.relationId = relationId;
    }

    public String getStudentsId() {
        return studentsId;
    }

    public void setStudentsId(String studentsId) {
        this.studentsId = studentsId;
    }

    public String getRelationId() {
        return relationId;
    }

    public void setRelationId(String relationId) {
        this.relationId = relationId;
    }

    public String getStudentId() {
        return studentsId;
    }

    public void setStudentId(String studentId) {
        this.studentsId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getRelationName() {
        return relationName;
    }

    public void setRelationName(String relationName) {
        this.relationName = relationName;
    }

}
