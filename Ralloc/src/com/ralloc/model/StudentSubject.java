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
import java.util.HashMap;
import java.util.Iterator;

/**
 *
 * @author mahesh
 */
public class StudentSubject {
    String usn, courseCode;

    public String getUsn() {
        return usn;
    }

    public void setUsn(String usn) {
        this.usn = usn;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }
    
    
    public static HashMap getMapFromCourseCode(String courseCde) throws SQLException{
        
        
        ArrayList<Student> studentList = new ArrayList<>();
        Connection myConnection = DBConnection.getConnection();
        PreparedStatement myPreparedStatement = myConnection.prepareStatement("SELECT DepartmentID, COUNT(USN) FROM student WHERE USN IN (SELECT USN FROM studentsubject WHERE CourseCode = ?) GROUP BY DepartmentID");
        myPreparedStatement.setString(1, courseCde);
        ResultSet studentResult = myPreparedStatement.executeQuery();
        HashMap studentMap = new HashMap();
        for(int i = 0; studentResult.next();i++){
            studentMap.put(studentResult.getInt(1),studentResult.getInt(2));
        }  
        return studentMap;
    }
   
}
