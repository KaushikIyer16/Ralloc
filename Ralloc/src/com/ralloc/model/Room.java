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
public class Room {
    int roomId = 0, capacity = 0;
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
    
    public static ArrayList<Integer> getRoomCapacities() throws SQLException{
        ArrayList<Integer> roomCapacities = new ArrayList<>();
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT Capacity FROM Room");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {            
            roomCapacities.add(rs.getInt(1));
        }
        
        return roomCapacities;
    }
}
