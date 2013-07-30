/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.grievance.healthcare.service;

import com.grievance.healthcare.dao.GrievanceDAO;
import org.apache.struts2.components.File;
import com.grievance.healthcare.model.Grievance;

/**
 *
 * @author sabbani
 */
public class GrievanceServiceImpl implements GrievanceService{
    private Grievance grievance;
    private GrievanceDAO grievanceDAO;
    @Override
    public Boolean saveGrievanceDetails(Long memberId,String SSN,String memberName,String requestType,String date,
            String emailAddress,String contactPhone,String comments,File attachFile,Grievance grievance1) {
        grievance = new Grievance();
        grievance.setComments(comments);
//        grievance.setDate(date);
        grievance.setMemberId(memberId);
        grievance.setMemberName(memberName);
//        grievance.setRequestType(requestType);
        return grievanceDAO.saveGrievanceDetails(grievance);
    }

    
        public GrievanceDAO getGrievanceDAO() {
		return grievanceDAO;
	}

	public void setGrievanceDAO(GrievanceDAO grievanceDAO) {
		this.grievanceDAO = grievanceDAO;
	}

         public Grievance getGrievance() {
		return grievance;
	}

	public void setGrievance(Grievance grievance) {
		this.grievance = grievance;
	}
}
