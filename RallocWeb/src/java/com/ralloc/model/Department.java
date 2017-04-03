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
    public static Integer getClusterIdFromDepartmentName(String departmentName)throws SQLException{
        Connection myConnection = DBConnection.getConnection();
        PreparedStatement myPreStatement = myConnection.prepareStatement("SELECT ClusterID FROM Department WHERE Name LIKE ?");
        myPreStatement.setString(1, departmentName);
        int clusterId=0;
        ResultSet rs = myPreStatement.executeQuery();
        while(rs.next()){
            clusterId = rs.getInt(1);
        }
        return clusterId;
    }
    public static void addDepartment(String departmentName, String clusterName, String intake)throws SQLException{
        Connection myConnection = DBConnection.getConnection();
        PreparedStatement myPreStatement = myConnection.prepareStatement("INSERT INTO Department VALUES (NULL, ?, ?, ?)");
        //myPreStatement.setInt(1, departmentId);
        myPreStatement.setString(1, departmentName);
        myPreStatement.setInt(2, Integer.parseInt(intake));
        int clusterId = getClusterIdFromDepartmentName(clusterName);
        if(clusterId == 0)
        {
            myPreStatement.setInt(3, 99);
            myPreStatement.execute();
            myPreStatement = myConnection.prepareStatement("SELECT DepartmentID FROM Department WHERE ClusterID = 99");
            ResultSet rs = myPreStatement.executeQuery();
            while(rs.next()){
                clusterId = rs.getInt(1);
            }
            myPreStatement = myConnection.prepareStatement("UPDATE Department SET ClusterID = ? WHERE ClusterID = 99");
            myPreStatement.setInt(1, clusterId);
            myPreStatement.execute();
        }
        else
        {
            myPreStatement.setInt(3, clusterId);
            myPreStatement.execute();
        }
    }
    
    public static HashMap<Integer, String> getDepartments() throws SQLException{
        Connection myConnection = DBConnection.getConnection();
        PreparedStatement myPreStatement = myConnection.prepareStatement("SELECT * FROM Department");
        ResultSet rs = myPreStatement.executeQuery();
        HashMap<Integer, String> deptList = new HashMap();
        while(rs.next())
            deptList.put(rs.getInt(1), rs.getString(2));
        return deptList;
    }
}
