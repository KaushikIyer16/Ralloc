/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.beans;

/**
 *
 * @author kaushiknsiyer
 */
public class StudentCount {
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

    public StudentCount(String departmentID, int numberOfStudents) {
        this.departmentID = departmentID;
        this.numberOfStudents = numberOfStudents;
        
    }

    
    
}
