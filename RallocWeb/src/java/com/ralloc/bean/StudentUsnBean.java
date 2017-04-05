/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.bean;

import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author kaushiknsiyer
 */
public class StudentUsnBean{
    private String departmentID;
    private String clusterID;

//    @Override
//    protected Object clone() throws CloneNotSupportedException {
//        super.clone();
//        return new StudentUsnBean(departmentID, clusterID); 
//    }
    private ArrayList<String> studentUsn;

    public StudentUsnBean(String departmentID, String clusterID) {
        this.departmentID = departmentID;
        this.clusterID = clusterID;
        this.studentUsn = new ArrayList<>();
    }

    public StudentUsnBean(String departmentID, String clusterID, ArrayList<String> studentUsn) {
        this.departmentID = departmentID;
        this.clusterID = clusterID;
        this.studentUsn = studentUsn;
    }
    
    

    public String getDepartmentID() {
        return departmentID;
    }

    public void setDepartmentID(String departmentID) {
        this.departmentID = departmentID;
    }

    public String getClusterID() {
        return clusterID;
    }

    public void setClusterID(String clusterID) {
        this.clusterID = clusterID;
    }

    public ArrayList<String> getStudentUsn() {
        return studentUsn;
    }

    public void setStudentUsn(ArrayList<String> studentUsn) {
        this.studentUsn = studentUsn;
    }
    
    public void addStudentUsn(String usn){
        this.studentUsn.add(usn);
    }
    
    
}
