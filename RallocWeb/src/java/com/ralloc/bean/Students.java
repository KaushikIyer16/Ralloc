/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.bean;

/**
 *
 * @author Sneha
 */
public class Students {
    private String USN;
    private String courseCode;
    private int departmentID;
    
    public Students(){
        USN = "";
        courseCode = "";
        departmentID = 0;
    }
    public Students(String USN, String courseCode, int departmentID)
    {
        this.USN = USN;
        this.courseCode = courseCode;
        this.departmentID = departmentID;
    }
    public String getUSN()
    {
        return USN;
    }
    public String getCourseCode()
    {
        return courseCode;
    }
    public int getDepartmentID()
    {
        return departmentID;
    }
}
