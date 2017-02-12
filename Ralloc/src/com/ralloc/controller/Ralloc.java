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
    int subject1Index=0,subject2Index=0;
    StudentCount subject1Students=null,subject2Students = null;
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
                 int currRoomCapacity = currRoom.getCapacity();
                 System.out.println(currRoom.getRoomId()+ "<----->"+currRoom.getCapacity());
                 while(currRoom.getCapacity()>0){
                     System.out.println("the current capacity is "+currRoom.getCapacity());
                     if (subject1Students == null) {
                         subject1Index = choseValidSubject(subject2Students,subject2Index);
                         subject1Students = departmentSubjects.get(subj[subject1Index]).get(0);
                         System.out.println("the subject chosen used is "+subject1Students.getDepartmentID());
                     }
                     if (subject2Students == null) {
                         subject2Index = choseValidSubject(subject1Students,subject1Index);
                         subject2Students = departmentSubjects.get(subj[subject2Index]).get(0);
                         System.out.println("the subject chosen used is "+subject2Students.getDepartmentID());
                     }
                     
                     System.out.println(subj[subject1Index].getSubjectCode()+"<==------==>"+subj[subject2Index].getSubjectCode());
                     
                     if (currRoomCapacity/2 >= subject1Students.getNumberOfStudents() || currRoomCapacity/2+1 >= subject1Students.getNumberOfStudents()) {
                         System.out.println("--> "+ subject1Students.getDepartmentID()+" = "+subject1Students.getNumberOfStudents());
                        currRoom.setCapacity(currRoom.getCapacity()- subject1Students.getNumberOfStudents());
                        subject1Students.setNumberOfStudents(0);
//                        System.out.println("-->"+departmentSubjects.get(subj[subject1Index]).get(0).getNumberOfStudents());
                        updateGraph(subj[subject1Index]);
                        subject1Students = null;
                        // now i have to ermove the capacity of the room by that much


                    }else{
                        // just fill half of the room with this dept students
                        System.out.println("-->"+subject1Students.getDepartmentID()+" = "+currRoomCapacity/2);
                        subject1Students.setNumberOfStudents(subject1Students.getNumberOfStudents()-currRoomCapacity/2);
                         
                        currRoom.setCapacity(currRoom.getCapacity() - currRoomCapacity/2);
                        
                    }
                     
                    if (currRoomCapacity/2 >= subject2Students.getNumberOfStudents() || currRoomCapacity/2+1 >= subject2Students.getNumberOfStudents()) {
                         System.out.println("--> "+ subject2Students.getDepartmentID()+" = "+subject2Students.getNumberOfStudents());
                        currRoom.setCapacity(currRoom.getCapacity()- subject2Students.getNumberOfStudents());
                        subject2Students.setNumberOfStudents(0);
//                        System.out.println("-->"+departmentSubjects.get(subj[subject2Index]).get(0).getNumberOfStudents());
                        
                        subject2Students = null;
                        // now i have to ermove the capacity of the room by that much


                    }else{
                        // just fill half of the room with this dept students
                        System.out.println("-->"+subject2Students.getDepartmentID()+" = "+currRoomCapacity/2);
                        subject2Students.setNumberOfStudents(subject2Students.getNumberOfStudents()-currRoomCapacity/2);
                         updateGraph(subj[subject2Index]);
                        currRoom.setCapacity(currRoom.getCapacity() - currRoomCapacity/2);
                        
                    }
                    
                    
                    
                 }
                 System.out.println("--------------------------");
                 
            }
        } catch (Exception e) {
            System.out.println("exception in getRoomAllocation");
            e.printStackTrace();
        }
    }

    private void updateGraph(SubjectDependency subjectDependency) {
        ArrayList<StudentCount> currBranch = departmentSubjects.get(subjectDependency);
        Iterator currBranchIterator = currBranch.iterator();
        while(currBranchIterator.hasNext()){
            StudentCount studentCount = (StudentCount)currBranchIterator.next();
            if(studentCount.getNumberOfStudents() == 0){
                System.out.println("a branch was removed because it got seated");
                currBranchIterator.remove();
            }
        }
        if(currBranch.isEmpty()){
//            this means that the graph is empty and hence you can remove this subject from departmentSubjects
            System.out.println("the graph goes empty");
            departmentSubjects.remove(subjectDependency);
        }
    }

    private int choseValidSubject(StudentCount otherSubjectStudents,int otherSubject) {
        Random r = new Random();
        int subjectIndex = r.nextInt(departmentSubjects.size());
        
        if (otherSubjectStudents == null) {
            // here get(0) is because they are in the same cluster
            //return departmentSubjects.get(subj[subjectIndex]).get(0);
            return subjectIndex;
        }else{
            while(true){
            // checking if the cluster ids match or not 
                if (!departmentSubjects.get(subj[subjectIndex]).get(0).getClusterID().equalsIgnoreCase(otherSubjectStudents.getClusterID()) && !subj[subjectIndex].getSubjectCode().equalsIgnoreCase(subj[otherSubject].getSubjectCode())) {
                     return subjectIndex;
                }
                subjectIndex = r.nextInt(departmentSubjects.size());
            }
            
        }
        
    }
    
}
