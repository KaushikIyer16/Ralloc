/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.controller;

import com.ralloc.model.Department;
import com.ralloc.model.Room;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
/**
 *
 * @author kaushiknsiyer
 */
public class Ralloc {
    
    
    int noRooms = 0;
    HashMap<String,String[]> roomMap= new HashMap<>();
    HashMap<String,Integer> departmentStudents;
    
    public Ralloc() {
        
    }
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        Ralloc ralloc = new Ralloc();
        ralloc.getRoomAllocation();
        
    }
    
    private void initRoomMap() throws SQLException{
        //Return type changed to hashmap in model as @knsi had asked
        ArrayList<Integer> roomCapacities = Room.getRoomCapacities();//Please change it here
        for (int i = 1; i <= this.noRooms; i++) {
            roomMap.put(Integer.toString(i), new String[roomCapacities.get(i-1)]);
        }
        
        System.out.println(roomMap.get("8").length);
    }
    
    public void getRoomAllocation(){
        
        try {
            this.noRooms = Room.getTotalRooms();
            this.initRoomMap();
            
            for (int iterator = 0; iterator <= this.noRooms; iterator++) {
                
            }
        } catch (Exception e) {
            System.out.println("exception in getRoomAllocation");
            e.printStackTrace();
        }
    }
    
}
