/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.bean;

import com.ralloc.model.Department;
import java.io.Serializable;
import java.sql.SQLException;

/**
 *
 * @author kaushiknsiyer
 */
public class StudentCount{
    private String departmentID;
    private String clusterID;
    private int numberOfStudents;
//    private int year;

    public String getDepartmentID() {
        return departmentID;
    }

    public void setDepartmentID(String departmentID) {
        this.departmentID = departmentID;
    }

    public int getNumberOfStudents() {
        return numberOfStudents;
    }

    public void setNumberOfStudents(int numberOfStudents) {
        this.numberOfStudents = numberOfStudents;
    }

    public StudentCount(String departmentID, int numberOfStudents) throws SQLException {
        this.departmentID = departmentID;
        this.numberOfStudents = numberOfStudents;
        this.clusterID = Department.getClusterIdFromDepartmentId(Integer.parseInt(this.departmentID)).toString();
        
    }

    public String getClusterID() {
        return clusterID;
    }

    public void setClusterID(String clusterID) {
        this.clusterID = clusterID;
    }

    
    
}
