/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.controller;

import com.ralloc.beans.RoomBean;
import com.ralloc.beans.StudentCount;
import com.ralloc.beans.SubjectDependency;
import com.ralloc.model.Department;
import com.ralloc.model.Room;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
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
    HashMap<RoomBean,ArrayList<StudentCount>> roomMap= new HashMap<>();
    HashMap<SubjectDependency,ArrayList<StudentCount>> departmentSubjects;
    int subject1Index=-1,subject2Index=-1;
    SubjectDependency subject1 = null, subject2 = null;
    StudentCount subject1Students=null,subject2Students = null;
    ArrayList<SubjectDependency> subj = new ArrayList<>();
//    SubjectDependency []subjArr = {new SubjectDependency("16IS5DCDCN",null),
//                                    new SubjectDependency("16EC5DCCSM",null),
//                                    new SubjectDependency("16ME5DCCMD",null)};
    
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
            roomMap.put(new RoomBean(room, roomCapacities.get(room)), new ArrayList<>());
        }
        
        
    }
    private void initDepartmentSubjects() throws SQLException{
//        ArrayList<Integer> departmentIdsList = Department.getDepartmentIds();
        
        departmentSubjects.put(new SubjectDependency("16IS5DCDCN",null), new ArrayList<>() );
        departmentSubjects.get(new SubjectDependency("16IS5DCDCN",null)).add(new StudentCount("1",90));
        
        departmentSubjects.put(new SubjectDependency("16EC5DCCSM",null), new ArrayList<>() );
        departmentSubjects.get(new SubjectDependency("16EC5DCCSM",null)).add(new StudentCount("2",90));
        
        departmentSubjects.put(new SubjectDependency("16TE5DCACM",null), new ArrayList<>() );
        departmentSubjects.get(new SubjectDependency("16TE5DCACM",null)).add(new StudentCount("3",90));
        
        departmentSubjects.put(new SubjectDependency("16ME5DCCMD",null), new ArrayList<>() );
        departmentSubjects.get(new SubjectDependency("16ME5DCCMD",null)).add(new StudentCount("4",200));
        
        subj.add(new SubjectDependency("16IS5DCDCN",null));
        subj.add(new SubjectDependency("16EC5DCCSM",null));
        subj.add(new SubjectDependency("16TE5DCACM",null));
        subj.add(new SubjectDependency("16ME5DCCMD",null));
               
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
            
            for (RoomBean currRoom : roomMap.keySet()) {
                // now i need to choose
                int currRoomCapacity = currRoom.getCapacity();
                int firstSubjCapacity = currRoomCapacity/2;
                int secondSubjCapacity = currRoomCapacity - firstSubjCapacity;
                System.out.println("the room id is:"+currRoom.getRoomId());
                while(currRoom.getCapacity()>0 && !isEmptyGraph()){
                    System.out.println("the current capacity is "+currRoom.getCapacity());
                    if (subject1Students == null) {
                        subject1 = getValidSubject(subject2Students,subject2);
                        subject1Students = departmentSubjects.get(subject1).get(0);
                    }
                    if (subject2Students == null) {
                        subject2 = getValidSubject(subject1Students,subject1);
                        subject2Students = departmentSubjects.get(subject2).get(0);
                    }
                    
                    System.out.println(subject1.getSubjectCode()+"<==------==>"+subject2.getSubjectCode());
                    System.out.println("        "+firstSubjCapacity+"<*--------*>"+secondSubjCapacity);
                    
                    if(firstSubjCapacity == 0){
                        System.out.println("waiting for the second half to get filled");
                        
                    }
                    else if (firstSubjCapacity >= subject1Students.getNumberOfStudents()) {
                        System.out.println("--> "+ subject1Students.getDepartmentID()+" = "+subject1Students.getNumberOfStudents());
                       currRoom.setCapacity(currRoom.getCapacity()- subject1Students.getNumberOfStudents());
                       firstSubjCapacity -= subject1Students.getNumberOfStudents();
                       subject1Students.setNumberOfStudents(0);
//                        System.out.println("-->"+departmentSubjects.get(subj[subject1Index]).get(0).getNumberOfStudents());
                       updateGraph(subject1);
                       subject1Students = null;
                       subject1 = null;
                       
                       currRoomCapacity -= firstSubjCapacity;


                    }else{
                        // just fill half of the room with this dept students
                        System.out.println("-->"+subject1Students.getDepartmentID()+" = "+firstSubjCapacity);
                        subject1Students.setNumberOfStudents(subject1Students.getNumberOfStudents()-firstSubjCapacity); 
                        currRoom.setCapacity(currRoom.getCapacity() - firstSubjCapacity);
                        firstSubjCapacity =0;
                        
                    }
                    if(secondSubjCapacity == 0){
                        System.out.println("waiting for the first half to get filled");
                        
                    }
                    else if (secondSubjCapacity >= subject2Students.getNumberOfStudents() ) {
                         System.out.println("--> "+ subject2Students.getDepartmentID()+" = "+subject2Students.getNumberOfStudents());
                        currRoom.setCapacity(currRoom.getCapacity()- subject2Students.getNumberOfStudents());
                        secondSubjCapacity -= subject2Students.getNumberOfStudents();
                        subject2Students.setNumberOfStudents(0);
//                        System.out.println("-->"+departmentSubjects.get(subj[subject2Index]).get(0).getNumberOfStudents());
                        updateGraph(subject2);
                        subject2Students = null;
                        subject2 = null;
                        
                        currRoomCapacity -= secondSubjCapacity;
                        // now i have to ermove the capacity of the room by that much


                    }else{
                        // just fill half of the room with this dept students
                        System.out.println("-->"+subject2Students.getDepartmentID()+" = "+secondSubjCapacity);
                        subject2Students.setNumberOfStudents(subject2Students.getNumberOfStudents()-secondSubjCapacity);
                        currRoom.setCapacity(currRoom.getCapacity() - secondSubjCapacity);
                        secondSubjCapacity = 0;
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
            subj.remove(subjectDependency);
        }
    }
    /*below is a deprecated method*/
    private int choseValidSubject(StudentCount otherSubjectStudents,int otherSubject) {
        Random r = new Random();
        int subjectIndex = r.nextInt(departmentSubjects.size());
        if (departmentSubjects.isEmpty()) {
            System.out.println("this is absolutely the last time to call this function");
            return -1;
        }
        if (otherSubjectStudents == null) {
            // here get(0) is because they are in the same cluster
            //return departmentSubjects.get(subj[subjectIndex]).get(0);
            return subjectIndex;
        }else{
            int count=0;
            while(count<200){
            // checking if the cluster ids match or not 
                System.out.println(subjectIndex+"--======--"+departmentSubjects.get(subj.get(subjectIndex)).get(0).getClusterID());
                if (!departmentSubjects.get(subj.get(subjectIndex)).get(0).getClusterID().equalsIgnoreCase(otherSubjectStudents.getClusterID()) && !subj.get(subjectIndex).getSubjectCode().equalsIgnoreCase(subj.get(otherSubject).getSubjectCode())) {
                     return subjectIndex;
                }
                subjectIndex = r.nextInt(departmentSubjects.size());
                count++;
            }
            return subjectIndex;
        }
        
    }
    
    private SubjectDependency getValidSubject(StudentCount otherSubjectStudents, SubjectDependency otherSubject){
        if (departmentSubjects.isEmpty()) {
            System.out.println("this is absolutely the last time to call this function");
            return null;
        }
        Random r = new Random();
        int randomIndex = r.nextInt(subj.size());
        if (otherSubjectStudents == null) {
            return subj.get(randomIndex);
        }else{
            int count = 0;
            while(count<200){
                if (!departmentSubjects.get(subj.get(randomIndex)).get(0).getClusterID().equalsIgnoreCase(otherSubjectStudents.getClusterID()) && !subj.get(randomIndex).getSubjectCode().equalsIgnoreCase(otherSubject.getSubjectCode()))  {
                    return subj.get(randomIndex);
                }
                randomIndex= r.nextInt(subj.size());
                count++;
            }
            return subj.get(randomIndex);
        }
        
        
    }

    private boolean isEmptyGraph() {
        return departmentSubjects.isEmpty();
    }
    
}
