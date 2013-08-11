/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.grievance.healthcare.service;

import java.util.List;
import com.grievance.healthcare.model.Grievance;
import com.grievance.healthcare.to.GrievanceTO;

/**
 *
 * @author sabbani
 */
public interface GrievanceService {
    public List<Grievance> saveGrievanceDetails(GrievanceTO grievanceTO,List<Grievance> list);
}
