/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.bean;

/**
 *
 * @author sree
 */
public class StatisticsBean {
    private String courseCode;
    private String roomName;
    private int studentCount;
    private String department;

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public int getStudentCount() {
        return studentCount;
    }

    public void setStudentCount(int studentCount) {
        this.studentCount = studentCount;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public StatisticsBean(String courseCode, String roomName, int studentCount, String department) {
        this.courseCode = courseCode;
        this.roomName = roomName;
        this.studentCount = studentCount;
        this.department = department;
    }
    
}
