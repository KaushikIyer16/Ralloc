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
public class Dependency {
    
    private boolean Depend;
    private String DepCode;
    public void setExist(String s)
    {
        if(s.equals("Exist"))
            Depend = true;
        else
            Depend = false;
    }
    public boolean getExist()
    {
        return Depend;
    }
    public void setCode(String s)
    {
        DepCode = s;
    }
    public String getCode()
    {
        return DepCode;
    }
}
