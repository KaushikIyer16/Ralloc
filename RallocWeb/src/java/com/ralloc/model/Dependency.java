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

/**
 *
 * @author mahesh
 */
public class Dependency {
    int dependencyId = 0;
    int roomId = 0;
    String courseCode;    

    public int getDependencyId() {
        return dependencyId;
    }

    public void setDependencyId(int dependencyId) {
        this.dependencyId = dependencyId;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    
    
    
    public static int getDependencyIDFromCourseCode(String courseC) throws SQLException{
            
            int  dependencyId = 0;
            int i;
        try (Connection myConnection = DBConnection.getConnection()) {
            PreparedStatement dependencyStatement = myConnection.prepareStatement("SELECT DependencyID FROM dependency WHERE CourseCode = ?");
            dependencyStatement.setString(1, courseC);
            ResultSet depResult = dependencyStatement.executeQuery();
            for(i = 0; depResult.next();i++){
                dependencyId = depResult.getInt(1);
            }
            if(i ==0)
                return -1;
            else
                return dependencyId;
        }
    }
}
