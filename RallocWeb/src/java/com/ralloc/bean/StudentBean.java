/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.bean;

import java.util.Objects;

/**
 *
 * @author Sneha
 */
public class StudentBean {
    private String USN;
    private String courseCode;
    private int departmentID;
    
    public StudentBean(){
        USN = "";
        courseCode = "";
        departmentID = 0;
    }
    public StudentBean(String USN, String courseCode, int departmentID)
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

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        StudentBean tmpBean = (StudentBean)obj;
        return this.USN.equals(tmpBean.USN) && this.courseCode.equals(tmpBean.courseCode) && this.departmentID == tmpBean.departmentID;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 67 * hash + Objects.hashCode(this.USN);
        hash = 67 * hash + Objects.hashCode(this.courseCode);
        hash = 67 * hash + this.departmentID;
        return hash;
    }
}
