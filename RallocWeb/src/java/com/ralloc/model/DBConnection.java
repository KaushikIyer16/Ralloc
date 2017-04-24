/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.model;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author mahesh
 */
public class DBConnection {

    static String CONNECTIONSTRING = "jdbc:mysql://localhost:8889/ralloc", USERNAME = "root", PASSWORD = "root";

    public static Connection getConnection() {

        Connection myConnection = null;

        try {

            Class.forName("com.mysql.jdbc.Driver");
            myConnection = DriverManager.getConnection(CONNECTIONSTRING, USERNAME, PASSWORD);
            return myConnection;

        } catch (Exception e) {

            System.out.println("Error in connection class " + e);
            return null;
        }
    }

    public static void setCONNECTIONSTRING(String connectionString) {
        CONNECTIONSTRING = connectionString;
    }

    public static void setUSERNAME(String username) {
        USERNAME = username;
    }

    public static void setPASSWORD(String password) {
        PASSWORD = password;
    }
}
