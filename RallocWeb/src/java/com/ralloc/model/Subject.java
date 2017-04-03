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

    public Subject(String courseCode, String name, boolean isDeptElective, boolean isClusterElective, boolean isInstituteElective) {
        this.courseCode = courseCode;
        this.name = name;
        this.isDeptElective = isDeptElective;
        this.isClusterElective = isClusterElective;
        this.isInstituteElective = isInstituteElective;
    }
    
    public Subject(){
        
    }
    
    public Subject(String courseCode, String name){
        this.courseCode = courseCode;
        this.name = name;
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
    public static void addSubject(String courseCode, boolean isInstElect, boolean isDeptElect, boolean isClustElect, String name) throws SQLException {
        Connection myConnection = DBConnection.getConnection();
        PreparedStatement myStatement = myConnection.prepareStatement("SELECT CourseCode FROM Subject WHERE CourseCode LIKE ?");
        myStatement.setString(1, courseCode);
        ResultSet subResult = myStatement.executeQuery();
        if(subResult.next())
        {
            throw new SQLException();
        }
        myStatement = myConnection.prepareStatement("INSERT INTO Subject VALUES(?, ?, ?, ?, ?)");
        myStatement.setString(1, courseCode);
        myStatement.setBoolean(2,isInstElect);
        myStatement.setBoolean(3, isDeptElect);
        myStatement.setBoolean(4, isClustElect);
        myStatement.setString(5, name);
        myStatement.execute();
    }
    public static void addSubjectList(ArrayList<Subject> subjectList) throws SQLException {
        for(Subject s: subjectList)
        {
            addSubject(s.courseCode, s.isInstituteElective, s.isDeptElective, s.isClusterElective, s.name);
        }
    }
    public static void deleteAllSubjects() throws SQLException{
        Connection myConnection = DBConnection.getConnection();
        PreparedStatement myStatement = myConnection.prepareStatement("DELETE FROM DepartmentSubject WHERE 1");
        myStatement.execute();
        myStatement = myConnection.prepareStatement("DELETE FROM Subject WHERE 1");
        myStatement.execute();
    }
    public static void deleteSubjectByCourseCode(String courseCode) throws SQLException{
        Connection myConnection = DBConnection.getConnection();
        PreparedStatement myStatement = myConnection.prepareStatement("DELETE FROM DepartmentSubject WHERE CourseCode LIKE ?");
        myStatement.setString(1, courseCode);
        myStatement = myConnection.prepareStatement("DELETE FROM Subject WHERE CourseCode LIKE ?");
        myStatement.setString(1, courseCode);
        myStatement.execute();
    }
}
