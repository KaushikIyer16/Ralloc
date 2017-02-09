/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.model;

/**
 *
 * @author mahesh
 */
public class Student {
    String usn;
    int departmentId = 0;

    public String getUsn() {
        return usn;
    }

    public void setUsn(String usn) {
        this.usn = usn;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }
    
    
}
