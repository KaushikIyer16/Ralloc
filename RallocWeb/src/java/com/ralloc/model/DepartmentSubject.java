/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author mahesh
 */
public class DepartmentSubject {

    int departmentId = 0;
    String courseCode;

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public DepartmentSubject(int departmentId, String courseCode) {
        this.courseCode = courseCode;
        this.departmentId = departmentId;
    }
    
    public static void addSubject(String deptName, String courseCode) throws SQLException {
        try (Connection myConnection = DBConnection.getConnection()) {
            PreparedStatement myStatement = myConnection.prepareStatement("SELECT DepartmentID FROM Department WHERE Name LIKE ?");
            myStatement.setString(1, deptName);
            ResultSet subResult = myStatement.executeQuery();
            int deptId = 0;
            while(subResult.next())
            {
                deptId = subResult.getInt(1);
            }
            myStatement = myConnection.prepareStatement("INSERT INTO DepartmentSubject VALUES(?, ?)");
            myStatement.setInt(1, deptId);
            myStatement.setString(2, courseCode);
            myStatement.execute();
        }
    }
    public static void addSubject(int deptId, String courseCode) throws SQLException {
        try (Connection myConnection = DBConnection.getConnection()) {
            PreparedStatement myStatement = myConnection.prepareStatement("INSERT INTO DepartmentSubject VALUES(?, ?)");
            myStatement.setInt(1, deptId);
            myStatement.setString(2, courseCode);
            myStatement.execute();
        }
    }
    public static void addSubject(ArrayList<DepartmentSubject> departmentSubjectList) throws SQLException {
        for(DepartmentSubject ds : departmentSubjectList)
            addSubject(ds.departmentId, ds.courseCode);
    }
}
