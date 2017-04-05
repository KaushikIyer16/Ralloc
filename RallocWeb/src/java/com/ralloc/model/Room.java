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
public class Room {
    int roomId = 0, capacity = 0, dependency = -1;
    String name;

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getDependency() {
        return dependency;
    }

    public void setDependency(int dependency) {
        this.dependency = dependency;
    }
    
    public static int getTotalRooms() throws SQLException{
        Connection myConnection = DBConnection.getConnection();
        PreparedStatement myPreStatement = myConnection.prepareStatement("SELECT COUNT(RoomID) FROM Room");
        ResultSet rs = myPreStatement.executeQuery();
        int noRooms=0;
        while (rs.next()) {
             noRooms = rs.getInt(1);
        }
        return noRooms;
    }
    
    public static HashMap<Integer,Integer> getRoomCapacities() throws SQLException{
        HashMap<Integer,Integer> roomCapacities = new HashMap();
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT RoomID, Capacity FROM Room");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {            
            roomCapacities.put(rs.getInt(1), rs.getInt(2));
        }
        con.close();
        return roomCapacities;
    }
    
    public static HashMap<Integer,Integer> getDependencyRoomCapacities() throws SQLException{
        HashMap<Integer,Integer> roomCapacities = new HashMap();
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT RoomID, Capacity FROM Room WHERE Dependency = 1");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {            
            roomCapacities.put(rs.getInt(1), rs.getInt(2));
        }
        return roomCapacities;
    }
    
    public static void addRoom(String roomName, String capacity, int dependency) throws SQLException{
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT RoomID FROM Room WHERE Name LIKE ?");
        ps.setString(1, roomName);
        ResultSet rs = ps.executeQuery();
        int idExists = -1;
        while (rs.next()) {            
            idExists = rs.getInt(1);
        }
        if(idExists != -1)
            throw new SQLException();
        else
        {
            ps = con.prepareStatement("INSERT INTO Room VALUES(null, ?, ?, ?)");
            ps.setInt(2, Integer.parseInt(capacity));
            ps.setString(1, roomName);
            ps.setInt(3, dependency);
            ps.execute();
        }
    }
    public static void deleteAllRooms() throws SQLException{
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("DELETE FROM Room WHERE 1");
        ps.execute();
    }
    public static void deleteRoomByName(String name) throws SQLException{
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("DELETE FROM Room WHERE Name LIKE ?");
        ps.setString(1, name);
        ps.execute();
    }
}
