/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.bean;

/**
 *
 * @author Sneha
 */
public class Student {
    private String USN;
    private String dept;
    private int TestID;
    
    public Student(){
        USN = "";
        dept = "";
        TestID = 0;
    }
    /**
     *
     * @param u
     */
    public Student(String USN, int ID)
    {
        this.USN = USN;
        dept = "";
        for(int i=5; i<7;i++)
        {
            dept+=USN.charAt(i);
        }
        this.TestID = ID;
    }
    public String getUSN()
    {
        return USN;
    }
    public String getDept()
    {
        return dept;
    }
    public int getID()
    {
        return TestID;
    }
}
