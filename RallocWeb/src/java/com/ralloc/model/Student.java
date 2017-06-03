/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.model;

import com.ralloc.bean.StudentBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

/**
 *
 * @author mahesh
 */
public class Student {
    String usn;
    int departmentId = 0;

    public String getUsn() {
        return usn;
    }

    public void setUsn(String usn) {
        this.usn = usn;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }

    public Student(String usn, int deptId) {
        this.usn = usn;
        departmentId = deptId;
    }
    
//    public static int getDepartmentFormUsn(String usn) throws SQLException{
//        Connection myConnection = DBConnection.getConnection();
//        PreparedStatement myPreStatement = myConnection.prepareStatement("SELECT DepartmentID FROM Department WHERE Name LIKE ?");
//        myPreStatement.setString(1, usn.substring(5, 6));
//        int deptId=0;
//        ResultSet rs = myPreStatement.executeQuery();
//            while(rs.next()){
//                deptId = rs.getInt(1);
//            }
//        return deptId;
//    }
    public static void addStudents(HashMap<String, ArrayList<Student>> subjectStudents) throws SQLException{
        Connection myConnection = DBConnection.getConnection();
        try{
           
            myConnection.setAutoCommit(false);
            PreparedStatement myPreStatement;
            Set<String> courseSet = subjectStudents.keySet();
            for(String courseCode : courseSet)
            {
                ArrayList<Student> studentList = subjectStudents.get(courseCode);
                for(Student student: studentList)
                {
                    myPreStatement = myConnection.prepareStatement("INSERT INTO Student VALUES(?, ?)");
                    myPreStatement.setString(1, student.usn);
                    myPreStatement.setInt(2, student.departmentId);
                    myPreStatement.execute();
                    myPreStatement = myConnection.prepareStatement("INSERT INTO StudentSubject VALUES(?, ?)");
                    myPreStatement.setString(2, courseCode);
                    myPreStatement.setString(1, student.usn);
                    myPreStatement.execute();
                }
            }
            myConnection.commit();
            myConnection.close();
        }
        catch(Exception e)
        {
            System.out.println("Error: " + e.getMessage());
            myConnection.rollback();
            myConnection.close();
        }
        
    }
    public static void deleteAllStudents() throws SQLException{
        try (Connection myConnection = DBConnection.getConnection()) {
            PreparedStatement myPreStatement = myConnection.prepareStatement("DELETE FROM StudentSubject WHERE 1");
            myPreStatement.execute();
            myPreStatement = myConnection.prepareStatement("DELETE FROM Student WHERE 1");
            myPreStatement.execute();
        }
    }
    public static void deleteStudentByUsn(String usn) throws SQLException{
        try (Connection myConnection = DBConnection.getConnection()) {
            PreparedStatement myPreStatement = myConnection.prepareStatement("DELETE FROM StudentSubject WHERE USN LIKE ?");
            myPreStatement.setString(1, usn);
            myPreStatement.execute();
            myPreStatement = myConnection.prepareStatement("DELETE FROM Student WHERE USN LIKE ?");
            myPreStatement.setString(1, usn);
            myPreStatement.execute();
        }
    }
    public static ArrayList<String> getStudentsByDepartmentId(int departmentId) throws SQLException{
        ArrayList<String> studentList;
        try (Connection myConnection = DBConnection.getConnection()) {
            PreparedStatement myStatement = myConnection.prepareStatement("SELECT USN FROM Student WHERE DepartmentID = ?");
            myStatement.setInt(1, departmentId);
            ResultSet subResult = myStatement.executeQuery();
            studentList = new ArrayList<>();
            while(subResult.next())
            {
                studentList.add(subResult.getString(1));
            }
        }
        return studentList;
    }
    public static ArrayList<StudentBean> getAllStudents() throws SQLException{
        ArrayList<StudentBean> studentList;
        try (Connection myConnection = DBConnection.getConnection()) {
            PreparedStatement myStatement = myConnection.prepareStatement("SELECT StudentSubject.CourseCode, Student.USN, Student.DepartmentID FROM Student INNER JOIN StudentSubject ON StudentSubject.USN=Student.USN");
            ResultSet subResult = myStatement.executeQuery();
            studentList = new ArrayList<>();
            while(subResult.next())
            {
                studentList.add(new StudentBean(subResult.getString(2), subResult.getString(1), subResult.getInt(3)));
            }
        }
        return studentList;
    }
    
    public static int getStudentCount() throws SQLException{
        int count = 0;
        try(Connection myConnection = DBConnection.getConnection()){
            PreparedStatement myStatement = myConnection.prepareStatement("SELECT COUNT(USN) FROM Student");
            ResultSet countResult = myStatement.executeQuery();
            while (countResult.next()) {                
                count = countResult.getInt(1);
            }
        }
        return count;
    }
}
