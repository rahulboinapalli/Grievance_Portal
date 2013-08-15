/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.grievance.healthcare.service;

import com.grievance.healthcare.to.GrievanceTO;

/**
 *
 * @author sabbani
 */
public interface GrievanceService {
    public Long saveGrievanceDetails(GrievanceTO grievanceTO);
}
