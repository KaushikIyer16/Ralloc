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
public class Subject {
    String courseCode, name;
    boolean isDeptElective, isClusterElective, isInstituteElective;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public boolean isIsDeptElective() {
        return isDeptElective;
    }

    public void setIsDeptElective(boolean isDeptElective) {
        this.isDeptElective = isDeptElective;
    }

    public boolean isIsClusterElective() {
        return isClusterElective;
    }

    public void setIsClusterElective(boolean isClusterElective) {
        this.isClusterElective = isClusterElective;
    }

    public boolean isIsInstituteElective() {
        return isInstituteElective;
    }

    public void setIsInstituteElective(boolean isInstituteElective) {
        this.isInstituteElective = isInstituteElective;
    }
    
    public static ArrayList<Subject> getAllDetails() throws SQLException {
        
        ArrayList<Subject> subjectDetails = new ArrayList<>();
        Connection myConnection = DBConnection.getConnection();
        PreparedStatement dependencyStatement = myConnection.prepareStatement("SELECT * FROM Subject");
        ResultSet subResult = dependencyStatement.executeQuery();
        for(int i=0; subResult.next(); i++){
            Subject subjectObject = new Subject();
            subjectObject.courseCode = subResult.getString(1);
            subjectObject.isInstituteElective = subResult.getBoolean(2);
            subjectObject.isDeptElective = subResult.getBoolean(3);
            subjectObject.isClusterElective = subResult.getBoolean(4);
            subjectObject.name = subResult.getString(5);
            subjectDetails.add(subjectObject);
        }
        return subjectDetails;
    }
    
}
