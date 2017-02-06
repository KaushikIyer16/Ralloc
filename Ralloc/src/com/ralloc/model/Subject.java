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
public class Subject {
    String courseCode;
    boolean isDeptElective, isClusterElective, isInstituteElective;

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public boolean isIsDeptElective() {
        return isDeptElective;
    }

    public void setIsDeptElective(boolean isDeptElective) {
        this.isDeptElective = isDeptElective;
    }

    public boolean isIsClusterElective() {
        return isClusterElective;
    }

    public void setIsClusterElective(boolean isClusterElective) {
        this.isClusterElective = isClusterElective;
    }

    public boolean isIsInstituteElective() {
        return isInstituteElective;
    }

    public void setIsInstituteElective(boolean isInstituteElective) {
        this.isInstituteElective = isInstituteElective;
    }
    
    
}
