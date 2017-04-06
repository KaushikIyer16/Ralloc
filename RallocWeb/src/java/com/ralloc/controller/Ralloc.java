/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.controller;

import com.ralloc.bean.RoomBean;
import com.ralloc.bean.StudentBean;
import com.ralloc.bean.StudentCount;
import com.ralloc.bean.StudentUsnBean;
import com.ralloc.bean.SubjectStudentCount;
import com.ralloc.bean.SubjectDependency;
import com.ralloc.bean.SubjectStudentUsn;
import com.ralloc.model.Department;
import com.ralloc.model.Room;
import com.ralloc.model.Subject;
import com.ralloc.model.Dependency;
import com.ralloc.model.Student;
import com.ralloc.model.StudentSubject;
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
    private int randomDep = 0;
    /*
     * roomMap : is a map between the room id and all the students in that room
     */
    HashMap<RoomBean,ArrayList<SubjectStudentCount>> roomMap= new HashMap<>();
    HashMap<RoomBean,ArrayList<SubjectStudentUsn>> detailedRoomMap;
    HashMap<SubjectDependency,ArrayList<StudentCount>> subjectStudentGraph;
    HashMap<SubjectDependency,ArrayList<StudentUsnBean>> detailedSubjectStudentGraph;
    
    
    int subject1Index=-1,subject2Index=-1;
    SubjectDependency subject1 = null, subject2 = null;
    StudentCount subject1Students=null,subject2Students = null;
    ArrayList<SubjectDependency> subj = new ArrayList<>();
    ArrayList<StudentBean> queriedList = new ArrayList<>();
//    SubjectDependency []subjArr = {new SubjectDependency("16IS5DCDCN",null),
//                                    new SubjectDependency("16EC5DCCSM",null),
//                                    new SubjectDependency("16ME5DCCMD",null)};

    public Ralloc() {
        roomMap= new HashMap<>();
        subjectStudentGraph = new HashMap<>();
        detailedSubjectStudentGraph = new HashMap<>();
        detailedRoomMap = new HashMap<>();
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
    private void initSubjectStudentCount() throws SQLException{
        
        queriedList = Student.getAllStudents();
        
        // now i populate the subj list with the list of subjects obtained
        
        for (StudentBean studentBean : queriedList) {
            // ask for query to fetch dependency by course code
            SubjectDependency tmp = new SubjectDependency(studentBean.getCourseCode(), Subject.getDependecyByCourseCode(studentBean.getCourseCode()));
            if (!subj.contains(tmp)) {
                subj.add(tmp);
                
            }
        }
//        printSubj();
        for (SubjectDependency subjObj : subj) {
//            System.out.println(subjObj.getSubjectCode()+" "+subjObj.getDependency());
            try{
                subjectStudentGraph.put(subjObj, new ArrayList<>());
                
            }catch(Exception e){
                System.out.println(e.getMessage());
            }
            ArrayList<String> deptList = new ArrayList<>();
            ArrayList<StudentBean> tmpStudentList = new ArrayList<>();
            
            for (StudentBean studentBean : queriedList) {
                if (studentBean.getCourseCode().equalsIgnoreCase(subjObj.getSubjectCode())) {
                    if (!deptList.contains(Integer.toString(studentBean.getDepartmentID()))) {
//                        System.out.println("department getting added is "+studentBean.getDepartmentID());
                        deptList.add(Integer.toString(studentBean.getDepartmentID()));
                    }
                    tmpStudentList.add(studentBean);
                }
            }
            for (String department : deptList) {
                
                ArrayList<String> usnList = new ArrayList<>();
                for (StudentBean studentBean : tmpStudentList) {
//                detailedSubjectStudentGraph.get(subjObj).add(new StudentUsnBean(studentBean.getDepartmentID(), Department.getClusterIdFromDepartmentId(studentBean.getDepartmentID()), ));
                    if (studentBean.getDepartmentID() == Integer.parseInt(department)) {
                        usnList.add(studentBean.getUSN());
                    }
                }
                
                subjectStudentGraph.get(subjObj).add(new StudentCount(department, usnList.size()));
            }
            
        }
        
    }
    private void initDetailedSubjectStudentCount() throws SQLException{
//        queriedList = Student.getAllStudents();
        
        // now i populate the subj list with the list of subjects obtained
        
        for (StudentBean studentBean : queriedList) {
            // ask for query to fetch dependency by course code
            SubjectDependency tmp = new SubjectDependency(studentBean.getCourseCode(), Subject.getDependecyByCourseCode(studentBean.getCourseCode()));
            if (!subj.contains(tmp)) {
                subj.add(tmp);
                
            }
        }
//        printSubj();
        for (SubjectDependency subjObj : subj) {
//            System.out.println(subjObj.getSubjectCode()+" "+subjObj.getDependency());
            try{
                
                detailedSubjectStudentGraph.put(subjObj, new ArrayList<>());
            }catch(Exception e){
                System.out.println(e.getMessage());
            }
            ArrayList<String> deptList = new ArrayList<>();
            ArrayList<StudentBean> tmpStudentList = new ArrayList<>();
            
            for (StudentBean studentBean : queriedList) {
                if (studentBean.getCourseCode().equalsIgnoreCase(subjObj.getSubjectCode())) {
                    if (!deptList.contains(Integer.toString(studentBean.getDepartmentID()))) {
//                        System.out.println("department getting added is "+studentBean.getDepartmentID());
                        deptList.add(Integer.toString(studentBean.getDepartmentID()));
                    }
                    tmpStudentList.add(studentBean);
                }
            }
            for (String department : deptList) {
                
                ArrayList<String> usnList = new ArrayList<>();
                for (StudentBean studentBean : tmpStudentList) {
//                detailedSubjectStudentGraph.get(subjObj).add(new StudentUsnBean(studentBean.getDepartmentID(), Department.getClusterIdFromDepartmentId(studentBean.getDepartmentID()), ));
                    if (studentBean.getDepartmentID() == Integer.parseInt(department)) {
                        usnList.add(studentBean.getUSN());
                    }
                }
//                System.out.println("--->"+);
                detailedSubjectStudentGraph.get(subjObj).add(new StudentUsnBean(department,Integer.toString(Department.getClusterIdFromDepartmentId( Integer.parseInt(department) )) , usnList ));
                
            }
            
        }
    }
    private void initRallocController() throws SQLException{
        this.initRoomMap();
        this.initSubjectStudentCount();
//        this.initDetailedSubjectStudentCount();
    }

    public HashMap<RoomBean, ArrayList<SubjectStudentUsn>> getDetailedRoomMap() {
        return detailedRoomMap;
    }

    public HashMap<RoomBean, ArrayList<SubjectStudentCount>> getRoomMap() {
        return roomMap;
    }

    public HashMap<SubjectDependency, ArrayList<StudentUsnBean>> getDetailedSubjectStudentGraph() {
        return detailedSubjectStudentGraph;
    }
    public void getRoomAllocation(){


        try {
            this.noRooms = Room.getTotalRooms();
            HashMap<Integer,Integer> roomDependencies = Room.getRoomIdAndDependency();
            this.initRallocController();

            for (RoomBean currRoom : roomMap.keySet()) {
                // now i need to choose
                int currRoomCapacity = currRoom.getCapacity();
                int firstSubjCapacity = currRoomCapacity/2;
                int secondSubjCapacity = currRoomCapacity - firstSubjCapacity;
//                System.out.println("the room id is:"+currRoom.getRoomId());
                while(currRoom.getCapacity()>0 && !isEmptyGraph()){
//                    System.out.println("the current capacity is "+currRoom.getCapacity());
                    if (subject1Students == null) {
                        subject1 = getValidSubject(subject2Students,subject2,roomDependencies.get(currRoom.getRoomId()));
                        subject1Students = subjectStudentGraph.get(subject1).get(randomDep);
                        randomDep = 0;
                    }
                    if (subject2Students == null) {
                        
                        subject2 = getValidSubject(subject1Students,subject1,roomDependencies.get(currRoom.getRoomId()));
                        subject2Students = subjectStudentGraph.get(subject2).get(randomDep);
                        randomDep = 0;
                    }

//                    System.out.println(subject1.getSubjectCode()+"<==------==>"+subject2.getSubjectCode());
//                    System.out.println("        "+firstSubjCapacity+"<*--------*>"+secondSubjCapacity);

                    if(firstSubjCapacity == 0){
//                        System.out.println("waiting for the second half to get filled");

                    }
                    else if (firstSubjCapacity >= subject1Students.getNumberOfStudents()) {
                       ArrayList<SubjectStudentCount> tmpRoomList = roomMap.get(currRoom);
                       tmpRoomList.add(new SubjectStudentCount(subject1.getSubjectCode(), subject1Students.getDepartmentID(), subject1Students.getClusterID(), subject1Students.getNumberOfStudents()));
                       roomMap.put(currRoom, tmpRoomList);
//                       System.out.println("--> "+ subject1Students.getDepartmentID()+" = "+subject1Students.getNumberOfStudents());
                       currRoom.setCapacity(currRoom.getCapacity()- subject1Students.getNumberOfStudents());
                       firstSubjCapacity -= subject1Students.getNumberOfStudents();
                       subject1Students.setNumberOfStudents(0);
//                        System.out.println("-->"+subjectStudentGraph.get(subj[subject1Index]).get(0).getNumberOfStudents());
                       
                        updateGraph(subject1);
                       subject1Students = null;
                       subject1 = null;
                       
                       
                       
                       currRoomCapacity -= firstSubjCapacity;


                    }else{
                        // just fill half of the room with this dept students
                        ArrayList<SubjectStudentCount> tmpRoomList = roomMap.get(currRoom);
                        tmpRoomList.add(new SubjectStudentCount(subject1.getSubjectCode(), subject1Students.getDepartmentID(), subject1Students.getClusterID(), firstSubjCapacity));
                        roomMap.put(currRoom, tmpRoomList);
//                        System.out.println("-->"+subject1Students.getDepartmentID()+" = "+firstSubjCapacity);
                        subject1Students.setNumberOfStudents(subject1Students.getNumberOfStudents()-firstSubjCapacity);
                        currRoom.setCapacity(currRoom.getCapacity() - firstSubjCapacity);
                        firstSubjCapacity =0;

                    }
                    if(secondSubjCapacity == 0){
//                        System.out.println("waiting for the first half to get filled");

                    }
                    else if (secondSubjCapacity >= subject2Students.getNumberOfStudents() ) {
                        ArrayList<SubjectStudentCount> tmpRoomList = roomMap.get(currRoom);
                        tmpRoomList.add(new SubjectStudentCount(subject2.getSubjectCode(), subject2Students.getDepartmentID(), subject2Students.getClusterID(), subject2Students.getNumberOfStudents()));
                        roomMap.put(currRoom, tmpRoomList);
//                         System.out.println("--> "+ subject2Students.getDepartmentID()+" = "+subject2Students.getNumberOfStudents());
                        currRoom.setCapacity(currRoom.getCapacity()- subject2Students.getNumberOfStudents());
                        secondSubjCapacity -= subject2Students.getNumberOfStudents();
                        subject2Students.setNumberOfStudents(0);
//                        System.out.println("-->"+subjectStudentGraph.get(subj[subject2Index]).get(0).getNumberOfStudents());
                        System.out.println("subject2 value is "+subject2.getSubjectCode());
                        updateGraph(subject2);
                        subject2Students = null;
                        subject2 = null;

                        currRoomCapacity -= secondSubjCapacity;
                        // now i have to ermove the capacity of the room by that much


                    }else{
                        // just fill half of the room with this dept students
                        ArrayList<SubjectStudentCount> tmpRoomList = roomMap.get(currRoom);
                        tmpRoomList.add(new SubjectStudentCount(subject2.getSubjectCode(), subject2Students.getDepartmentID(), subject2Students.getClusterID(), secondSubjCapacity));
                        roomMap.put(currRoom, tmpRoomList);
//                        System.out.println("-->"+subject2Students.getDepartmentID()+" = "+secondSubjCapacity);
                        subject2Students.setNumberOfStudents(subject2Students.getNumberOfStudents()-secondSubjCapacity);
                        currRoom.setCapacity(currRoom.getCapacity() - secondSubjCapacity);
                        secondSubjCapacity = 0;
                    }

                }
            }
            
            printRoomMap();
            initDetailedSubjectStudentCount();
//            printDetailedSubjectStudentGraph();
            getDetailedRoomAllocation();
            printDetailedRoomAllocation();
            
        } catch (Exception e) {
            System.out.println("exception in getRoomAllocation");
            e.printStackTrace();
        }finally{
            
        }
    }

    private void updateGraph(SubjectDependency subjectDependency) {
        if (subjectDependency != null && subjectStudentGraph.get(subjectDependency) != null) {
            ArrayList<StudentCount> currBranch = subjectStudentGraph.get(subjectDependency);
            Iterator currBranchIterator = currBranch.iterator();
            while(currBranchIterator.hasNext()){
                StudentCount studentCount = (StudentCount)currBranchIterator.next();
                if(studentCount.getNumberOfStudents() == 0){
    //                System.out.println("a branch was removed because it got seated");
                    currBranchIterator.remove();
                }
            }
            if(currBranch.isEmpty()){
    //            this means that the graph is empty and hence you can remove this subject from subjectStudentGraph
                subjectStudentGraph.remove(subjectDependency);
                subj.remove(subjectDependency);
            }
        }
        
    }
    
    private SubjectDependency getValidSubject(StudentCount otherSubjectStudents, SubjectDependency otherSubject, int dependency){
        if (subjectStudentGraph.isEmpty()) {
            return null;
        }
        Random r = new Random();
        int randomIndex = r.nextInt(subj.size());
        if (otherSubjectStudents == null) {
            if (dependency == -1) {
                int count = 0;
                while(count < 200){
                    if (subj.get(randomIndex).getDependency() == -1) {
                        return subj.get(randomIndex);
                    }
                    randomIndex = r.nextInt(subj.size());
                    count++;
                }
                return subj.get(randomIndex);
            }else{
                int count = 0;
                while(count < 200){
                    if (subj.get(randomIndex).getDependency() == 1) {
                        return subj.get(randomIndex);
                    }
                    randomIndex = r.nextInt(subj.size());
                    count++;
                }
                return subj.get(randomIndex);
            }
            
        }else{
            if (dependency == -1) {
                // this corresponds to the already executed case
                int count = 0;
                while(count<200){
                    randomDep = r.nextInt(subjectStudentGraph.get(subj.get(randomIndex)).size());
                    if (subj.get(randomIndex).getDependency() == -1 && !subjectStudentGraph.get(subj.get(randomIndex)).get(randomDep).getClusterID().equalsIgnoreCase(otherSubjectStudents.getClusterID()) && !subj.get(randomIndex).getSubjectCode().equalsIgnoreCase(otherSubject.getSubjectCode()))  {
                        return subj.get(randomIndex);
                    }
                    randomIndex= r.nextInt(subj.size());
                    count++;
                }
                return subj.get(randomIndex);
            } else {
                
                // this corresponds to the situation where i have to search for the dependency along with the other parameters
                int count = 0;
                while(count<200){
                    randomDep = r.nextInt(subjectStudentGraph.get(subj.get(randomIndex)).size());
                    if (subj.get(randomIndex).getDependency() != -1 && !subjectStudentGraph.get(subj.get(randomIndex)).get(randomDep).getClusterID().equalsIgnoreCase(otherSubjectStudents.getClusterID()) && !subj.get(randomIndex).getSubjectCode().equalsIgnoreCase(otherSubject.getSubjectCode()))  {
                        return subj.get(randomIndex);
                    }
                    randomIndex= r.nextInt(subj.size());
                    count++;
                }
                
                return subj.get(randomIndex);
            }
            
        }


    }

    private boolean isEmptyGraph() {
        return subjectStudentGraph.isEmpty();
    }

    private void printRoomMap() {
        for(RoomBean room : roomMap.keySet()){
            ArrayList<SubjectStudentCount> tmpList = roomMap.get(room);
            System.out.println(room.getRoomId()+"\n\n");
            for (SubjectStudentCount subjectStudentCount : tmpList) {
                System.out.println(subjectStudentCount.getCourseCode()+" "+subjectStudentCount.getDepartmentId()+" "+subjectStudentCount.getNumberOfStudents());
            }
            System.out.println("");
        }
    }

    private void printDetailedSubjectStudentGraph() {
        for (SubjectDependency subjectDependency : subj) {
            ArrayList<StudentUsnBean> tmpList =  detailedSubjectStudentGraph.get(subjectDependency);
            System.out.println(subjectDependency.getSubjectCode());
            for (StudentUsnBean studentUsnBean : tmpList) {
                System.out.println(studentUsnBean.getDepartmentID());
                ArrayList<String> tmpUsnList = studentUsnBean.getStudentUsn();
                for (String string : tmpUsnList) {
                    System.out.print(string+" ");
                }
            }
        }
    }

    private void printSubj() {
        System.out.println("this is inside the subj list");
        for (SubjectDependency subjectDependency : subj) {
            System.out.println(subjectDependency.getSubjectCode());
        }
    }

    private void getDetailedRoomAllocation() throws SQLException {
        System.out.println("\n\n\n\n\nDetailed Room Allocation");
        
        for (RoomBean room : roomMap.keySet()) {
            detailedRoomMap.put(room, new ArrayList<>());
            ArrayList<SubjectStudentCount> tmpList = roomMap.get(room);
//            System.out.println(room.getRoomId()+"\n\n");
            for (SubjectStudentCount subjectStudentCount : tmpList) {
                
//                System.out.println(subjectStudentCount.getCourseCode()+" "+subjectStudentCount.getDepartmentId()+" "+subjectStudentCount.getNumberOfStudents());
                ArrayList<StudentUsnBean> currSubjList = detailedSubjectStudentGraph.get(new SubjectDependency(subjectStudentCount.getCourseCode(), Subject.getDependecyByCourseCode(subjectStudentCount.getCourseCode())));
                
                // now i need to get the dept matching subjectStudentCount.DepartmentId
                String currDepartment = "";
                ArrayList<String> usnList = new ArrayList<>();
                for (StudentUsnBean studentUsnBean : currSubjList) {
                    if (studentUsnBean.getDepartmentID().equalsIgnoreCase(subjectStudentCount.getDepartmentId())) {
                        currDepartment = studentUsnBean.getDepartmentID();
                        usnList = studentUsnBean.getStudentUsn();
                        break;
                    }
                }
                
//                System.out.println("Department: "+currDepartment);
//                System.out.println("USN Numbers: ");
                ArrayList<String> tmpUsnList = new ArrayList<>();
                for (int i = 0; i < subjectStudentCount.getNumberOfStudents(); i++) {
                    tmpUsnList.add(usnList.get(0));
                    usnList.remove(0);
                }
                System.out.println("usn list size is "+tmpUsnList.size());
                detailedRoomMap.get(room).add(new SubjectStudentUsn(subjectStudentCount.getCourseCode(), tmpUsnList));
                tmpUsnList.clear();
//                System.out.println("");
            }
        }
    }

    private void printDetailedRoomAllocation() {
        for (RoomBean room : detailedRoomMap.keySet()) {
            ArrayList<SubjectStudentUsn> currRoomUsn = detailedRoomMap.get(room);
            System.out.println("\n+++"+room.getRoomId()+"\n");
            int i=0;
            for (SubjectStudentUsn subjectStudentUsn : currRoomUsn) {
                System.out.println("\n\n -->  "+subjectStudentUsn.getCourseCode());
                
                ArrayList<String> usnList = subjectStudentUsn.getUsnList();
                for (String string : usnList) {
                    if (i<4) {
                        System.out.print(string+" ");
                        i++;
                    } else {
                        System.out.println(string+" ");
                        i=0;
                    }
                }
            }
            
        }
    }

}
