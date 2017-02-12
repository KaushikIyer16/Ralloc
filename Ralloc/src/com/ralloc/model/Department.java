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
public class Department {
    
   int departmentId = 0,clusterId=0 , intake = 0;
   String name;

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }

    public int getIntake() {
        return intake;
    }

    public void setIntake(int intake) {
        this.intake = intake;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
   
    public static int getIntakeByDepartmentId(int departmentId) throws SQLException{
        Connection myConnection = DBConnection.getConnection();
        PreparedStatement myPreStatement = myConnection.prepareStatement("SELECT Intake FROM Department WHERE DepartmentID = ?");
        myPreStatement.setInt(1, departmentId);
        ResultSet rs = myPreStatement.executeQuery();
        int intake=0;
        while (rs.next()) {
             intake = rs.getInt(1);
        }
        return intake;
    }
    
    public static ArrayList<Integer> getDepartmentIds() throws SQLException{
        Connection myConnection = DBConnection.getConnection();
        PreparedStatement myPreStatement = myConnection.prepareStatement("SELECT DepartmentID FROM Department");
        ResultSet rs = myPreStatement.executeQuery();
        ArrayList<Integer> deptList = new ArrayList<>();
        while(rs.next())
            deptList.add(rs.getInt(1));
        return deptList;
    }
    
    public static Integer getClusterIdFromDepartmentId(int departmentId)throws SQLException{
        Connection myConnection = DBConnection.getConnection();
        PreparedStatement myPreStatement = myConnection.prepareStatement("SELECT ClusterID FROM Department WHERE DepartmentID = ?");
        myPreStatement.setInt(1, departmentId);
        int clusterId=0;
        ResultSet rs = myPreStatement.executeQuery();
        while(rs.next()){
            clusterId = rs.getInt(1);
        }
        return clusterId;
    }
}
