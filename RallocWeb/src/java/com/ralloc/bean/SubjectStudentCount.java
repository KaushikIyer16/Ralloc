/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.bean;

/**
 *
 * @author kaushiknsiyer
 */
public class SubjectStudentCount {
    private String courseCode, departmentId, clusterId;
    private int numberOfStudents;

    public SubjectStudentCount(String courseCode, String departmentId, String clusterId, int numberOfStudents) {
        this.courseCode = courseCode;
        this.departmentId = departmentId;
        this.clusterId = clusterId;
        this.numberOfStudents = numberOfStudents;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public String getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId;
    }

    public String getClusterId() {
        return clusterId;
    }

    public void setClusterId(String clusterId) {
        this.clusterId = clusterId;
    }

    public int getNumberOfStudents() {
        return numberOfStudents;
    }

    public void setNumberOfStudents(int numberOfStudents) {
        this.numberOfStudents = numberOfStudents;
    }
    
    
}
