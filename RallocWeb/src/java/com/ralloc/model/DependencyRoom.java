/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.model;

/**
 *
 * @author Bhargav
 */
public class DependencyRoom {
    int DependencyID, roomID;

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public int getDependencyID() {
        return DependencyID;
    }

    public void setDependencyID(int DependencyID) {
        this.DependencyID = DependencyID;
    }
}
