/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.web;

/**
 *
 * @author Sneha
 */

import java.util.*;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
/**
 *
 * @author Sneha
 */
public class parse {

    public static List getUSN(String f) {
        String csvFile;
        csvFile = f;
        String line = "";
        String cvsSplitBy = ",";
        List USN = new ArrayList();
        try (BufferedReader br = new BufferedReader(new FileReader(csvFile))) {
            while ((line = br.readLine()) != null) {

                
                // use comma as separator
                String[] member = line.split(cvsSplitBy);
                USN.add(member[0]);
                //System.out.println("Country [code= " + country[4] + " , name=" + country[5] + "]");
                //System.out.println("First field : " + country[0]);
                

            }
            
        } catch (IOException e) {
            e.printStackTrace();
        }
        return USN; 
    }
}

