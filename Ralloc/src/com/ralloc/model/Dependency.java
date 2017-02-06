/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.model;

/**
 *
 * @author mahesh
 */
public class Dependency {
    int dependencyId = 0;
    String roomOffered, subjectRegistered;

    public int getDependencyId() {
        return dependencyId;
    }

    public void setDependencyId(int dependencyId) {
        this.dependencyId = dependencyId;
    }

    public String getRoomOffered() {
        return roomOffered;
    }

    public void setRoomOffered(String roomOffered) {
        this.roomOffered = roomOffered;
    }

    public String getSubjectRegistered() {
        return subjectRegistered;
    }

    public void setSubjectRegistered(String subjectRegistered) {
        this.subjectRegistered = subjectRegistered;
    }
    
    
}
