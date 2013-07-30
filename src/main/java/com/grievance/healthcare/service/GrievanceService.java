/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.grievance.healthcare.service;

import org.apache.struts2.components.File;
import com.grievance.healthcare.model.Grievance;

/**
 *
 * @author sabbani
 */
public interface GrievanceService {
    public Boolean saveGrievanceDetails(Long memberId,String SSN,String memberName,String requestType,String Date,
            String emailAddress,String contactPhone,String Comments,File attachFile,Grievance grievance);
}
