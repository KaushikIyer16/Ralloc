/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.bean;

import java.util.ArrayList;

/**
 *
 * @author kaushiknsiyer
 */
public class SubjectStudentUsn {
    private String courseCode;
    private ArrayList<String> usnList;

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public ArrayList<String> getUsnList() {
        return usnList;
    }

    public void setUsnList(ArrayList<String> usnList) {
        this.usnList = usnList;
    }

    public SubjectStudentUsn(String courseCode, ArrayList<String> usnList) {
        this.courseCode = courseCode;
        this.usnList = (ArrayList<String>) usnList.clone();
    }
    
    
}
