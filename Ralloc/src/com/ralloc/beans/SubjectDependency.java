/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.beans;

import com.ralloc.model.Dependency;
import com.ralloc.model.Subject;

/**
 *
 * @author kaushiknsiyer
 */
public class SubjectDependency {
    private String subjectCode;
    private Dependency dependency;

    public String getSubjectCode() {
        return subjectCode;
    }

    public void setSubjectCode(String subjectCode) {
        this.subjectCode = subjectCode;
    }

    

    public Dependency getDependency() {
        return dependency;
    }

    public void setDependency(Dependency dependency) {
        this.dependency = dependency;
    }

    public SubjectDependency(String subject, Dependency dependency) {
        this.subjectCode = subject;
        this.dependency = dependency;
    }
    
    
}
