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
import java.util.LinkedHashMap;

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
    
    public Room(){
        
    }
    
    public Room(String name, int capacity, int dependency){
        this.name = name;
        this.capacity = capacity;
        this.dependency = dependency;
    }
    
    public static int getTotalRooms() throws SQLException{
        int noRooms;
        try (Connection myConnection = DBConnection.getConnection()) {
            PreparedStatement myPreStatement = myConnection.prepareStatement("SELECT COUNT(RoomID) FROM Room");
            ResultSet rs = myPreStatement.executeQuery();
            noRooms = 0;
            while (rs.next()) {
                noRooms = rs.getInt(1);
            }
        }
        return noRooms;
    }
    
    public static String getRoomNameById(int roomId) throws SQLException{
        String roomName = "";
        try (Connection myConnection = DBConnection.getConnection()) {
            PreparedStatement myPreStatement = myConnection.prepareStatement("SELECT Name FROM Room WHERE RoomID = ?");
            myPreStatement.setInt(1, roomId);
            ResultSet rs = myPreStatement.executeQuery();
            while (rs.next()) {
                roomName = rs.getString(1);
            }
        }
        return roomName;
    }
    
    public static LinkedHashMap<Integer,Integer> getRoomCapacities() throws SQLException{
        LinkedHashMap<Integer,Integer> roomCapacities = new LinkedHashMap();
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT RoomID, Capacity FROM Room ORDER BY Dependency DESC");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) { 
//            System.out.println(rs.getInt(1));
            roomCapacities.put(rs.getInt(1), rs.getInt(2));
        }
        con.close();
        return roomCapacities;
    }
    
    public static HashMap<Integer,Integer> getDependencyRoomCapacities() throws SQLException{
        HashMap<Integer,Integer> roomCapacities = new HashMap();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("SELECT RoomID, Capacity FROM Room WHERE Dependency = 1");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                roomCapacities.put(rs.getInt(1), rs.getInt(2));
            }
        }
        return roomCapacities;
    }
    
    public static HashMap<Integer,Integer> getRoomIdAndDependency() throws SQLException{
        HashMap<Integer,Integer> roomDependency = new HashMap<>();
        try (Connection con = DBConnection.getConnection()){
            PreparedStatement ps = con.prepareStatement("SELECT RoomID, Dependency FROM Room");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                roomDependency.put(rs.getInt(1), rs.getInt(2));
            }
        }
        return roomDependency;
    }
    
    public static void addRoom(String roomName, String capacity, int dependency) throws SQLException{
        try (Connection con = DBConnection.getConnection()) {
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
    }
    public static void deleteAllRooms() throws SQLException{
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("DELETE FROM Room WHERE 1");
            ps.execute();
        }
    }
    public static void deleteRoomByName(String name) throws SQLException{
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("DELETE FROM Room WHERE Name LIKE ?");
            ps.setString(1, name);
            ps.execute();
        }
    }
}
