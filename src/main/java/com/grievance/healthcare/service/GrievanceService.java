/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.grievance.healthcare.service;

import java.io.File;
import java.util.List;
import com.grievance.healthcare.model.Grievance;

/**
 *
 * @author sabbani
 */
public interface GrievanceService {
    public List<Grievance> saveGrievanceDetails(Long memberId,String SSN,String memberName,String requestType,String Date,
            String emailAddress,String contactPhone,String Comments,File attachFile,List<Grievance> list);
}
