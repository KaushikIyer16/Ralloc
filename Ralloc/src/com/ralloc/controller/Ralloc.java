/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.controller;

import com.ralloc.beans.StudentCount;
import com.ralloc.beans.SubjectDependency;
import com.ralloc.model.Department;
import com.ralloc.model.Room;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
/**
 *
 * @author kaushiknsiyer
 */
public class Ralloc {
    
    
    int noRooms = 0;
    /*
     * roomMap : is a map between the room id and all the students in that room
     */
    HashMap<String,ArrayList<StudentCount>> roomMap= new HashMap<>();
    HashMap<SubjectDependency,ArrayList<StudentCount>> departmentStudents;
    
    public Ralloc() {
        roomMap= new HashMap<>();
        departmentStudents = new HashMap<>();
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
            roomMap.put(Integer.toString(i), new ArrayList<>());
        }
        
        
    }
    private void initDepartmentStudents() throws SQLException{
//        ArrayList<Integer> departmentIdsList = Department.getDepartmentIds();
//        departmentStudents.put(new SubjectDependency("",null), value)
    }
    
    private void initRallocController() throws SQLException{
        this.initRoomMap();
        
    }
    public void getRoomAllocation(){
        
        try {
            this.noRooms = Room.getTotalRooms();
            this.initRallocController();
            Iterator roomIterator = roomMap.keySet().iterator();
            while (roomIterator.hasNext()) {                
                 // now i need to choose
                 String str= (String)roomIterator.next();
                 System.out.println(roomMap.get(str));
            }
            for (int iterator = 0; iterator <= this.noRooms; iterator++) {
                
            }
        } catch (Exception e) {
            System.out.println("exception in getRoomAllocation");
            e.printStackTrace();
        }
    }
    
}
