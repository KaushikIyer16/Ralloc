/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ralloc.beans;

import com.ralloc.model.Dependency;
import com.ralloc.model.Subject;
import java.util.Objects;

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

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 59 * hash + Objects.hashCode(this.subjectCode);
        hash = 59 * hash + Objects.hashCode(this.dependency);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final SubjectDependency other = (SubjectDependency) obj;
        if (!Objects.equals(this.subjectCode, other.subjectCode)) {
            return false;
        }
        if (!Objects.equals(this.dependency, other.dependency)) {
            return false;
        }
        return true;
    }
    
    
}
