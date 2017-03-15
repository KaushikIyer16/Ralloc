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
public class ClassRoom {
    private int ID;
    private int capacity;
    private String name; 
    public ClassRoom()
    {
        ID = capacity = 0;
        name = "";
    }
    public ClassRoom(int ID, int capacity, String name)
    {
        this.ID = ID;
        this.capacity = capacity;
        this.name = name;
    }
    public int getID()
    {
        return ID;
    }
    public int getCap()
    {
        return capacity;
    }
    public String getName()
    {
        return name;
    }
}