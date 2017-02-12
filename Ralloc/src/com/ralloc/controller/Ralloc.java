/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.controller;

import com.ralloc.beans.RoomCapacity;
import com.ralloc.beans.StudentCount;
import com.ralloc.beans.SubjectDependency;
import com.ralloc.model.Department;
import com.ralloc.model.Room;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Random;
import java.util.TreeSet;
/**
 *
 * @author kaushiknsiyer
 */
public class Ralloc {
    
    
    int noRooms = 0;
    /*
     * roomMap : is a map between the room id and all the students in that room
     */
    HashMap<RoomCapacity,ArrayList<StudentCount>> roomMap= new HashMap<>();
    HashMap<SubjectDependency,ArrayList<StudentCount>> departmentSubjects;
    StudentCount subject1=null,subject2=null;
    SubjectDependency []subj = {new SubjectDependency("16IS5DCDCN",null),
                                    new SubjectDependency("16EC5DCCSM",null),
                                    new SubjectDependency("16ME5DCCMD",null)};
    
    public Ralloc() {
        roomMap= new HashMap<>();
        departmentSubjects = new HashMap<>();
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
        
        HashMap<Integer,Integer> roomCapacities = Room.getRoomCapacities();
        for (Integer room : roomCapacities.keySet()) {
            roomMap.put(new RoomCapacity(room, roomCapacities.get(room)), new ArrayList<>());
        }
        
        
    }
    private void initDepartmentSubjects() throws SQLException{
//        ArrayList<Integer> departmentIdsList = Department.getDepartmentIds();
        
        departmentSubjects.put(new SubjectDependency("16IS5DCDCN",null), new ArrayList<>() );
        departmentSubjects.get(new SubjectDependency("16IS5DCDCN",null)).add(new StudentCount("1",90));
        
        departmentSubjects.put(new SubjectDependency("16EC5DCCSM",null), new ArrayList<>() );
        departmentSubjects.get(new SubjectDependency("16EC5DCCSM",null)).add(new StudentCount("2",90));
        
        departmentSubjects.put(new SubjectDependency("16ME5DCCMD",null), new ArrayList<>() );
        departmentSubjects.get(new SubjectDependency("16ME5DCCMD",null)).add(new StudentCount("4",200));
        
        
        
//        System.out.println(departmentSubjects.get(new SubjectDependency("16EC5DCCSM",null)).toString());
    }
    
    private void initRallocController() throws SQLException{
        this.initRoomMap();
        this.initDepartmentSubjects();
    }
    public void getRoomAllocation(){
        
        
        try {
            this.noRooms = Room.getTotalRooms();
            this.initRallocController();
            Iterator roomIterator = roomMap.keySet().iterator();
            while (roomIterator.hasNext()) {                
                 // now i need to choose
                 RoomCapacity currRoom = (RoomCapacity)roomIterator.next();
                 System.out.println(currRoom.getRoomId()+ "<----->"+currRoom.getCapacity());
                 while(currRoom.getCapacity()>0){
                     if (subject1 == null) {
                         subject1 = choseValidSubject(subject2);
                     }
                     if (subject2 == null) {
                         subject2 = choseValidSubject(subject1);
                     }
                 }
//                 now choose two subjects in random and then two branches from them in random
                TreeSet<Integer> tmpList = new TreeSet();
                Random random = new Random();
                while(tmpList.size() !=2){
                    tmpList.add(random.nextInt(departmentSubjects.size()));
                }
                
                System.out.println(tmpList.first()+""+tmpList.last());
                subject1 = departmentSubjects.get(subj[tmpList.first()]).get(0);
                subject2 = departmentSubjects.get(subj[tmpList.last()]).get(0);
                
                if (currRoom.getCapacity()/2 > subject1.getNumberOfStudents()) {
                    currRoom.setCapacity(currRoom.getCapacity()- subject1.getNumberOfStudents());
                    subject1.setNumberOfStudents(0);
                    System.out.println("-->"+departmentSubjects.get(subj[tmpList.first()]).get(0).getNumberOfStudents());
                    updateGraph(subj[tmpList.first()]);
                    // now i have to ermove the capacity of the room by that much
                    
                    
                }else if(currRoom.getCapacity()/2 > subject1.getNumberOfStudents()/2){
                    currRoom.setCapacity(currRoom.getCapacity()- subject1.getNumberOfStudents()/2);
                    subject1.setNumberOfStudents(subject1.getNumberOfStudents()-subject1.getNumberOfStudents()/2);
                    System.out.println("-->"+departmentSubjects.get(subj[tmpList.first()]).get(0).getNumberOfStudents());
                    updateGraph(subj[tmpList.first()]);
                }
                System.out.println("-------------------");
            }
//            for (int iterator = 0; iterator <= this.noRooms; iterator++) {
//                
//            }
        } catch (Exception e) {
            System.out.println("exception in getRoomAllocation");
            e.printStackTrace();
        }
    }

    private void updateGraph(SubjectDependency subjectDependency) {
        ArrayList<StudentCount> currBranch = departmentSubjects.get(subjectDependency);
        for(StudentCount studentCount: currBranch){
            if(studentCount.getNumberOfStudents() == 0){
                currBranch.remove(studentCount);
            }
        }
        if(currBranch.isEmpty()){
//            this means that the graph is empty and hence you can remove this subject from departmentSubjects
            System.out.println("the graph goes empty");
            departmentSubjects.remove(subjectDependency);
        }
    }

    private StudentCount choseValidSubject(StudentCount otherSubject) {
        ArrayList<Integer> invalidSubjects = new ArrayList<>();
        Random r = new Random();
        int subjectIndex = r.nextInt(departmentSubjects.size());
        if (otherSubject == null) {
            return departmentSubjects.get(subj[subjectIndex]).get(0);
        }else{
//            while(true){
//            
//            if (!invalidSubjects.contains(subjectIndex) && departmentSubjects.get(subj[subjectIndex]).get(0).) {
//                 
//            }
//        }
            return null;
        }
        
    }
    
}
