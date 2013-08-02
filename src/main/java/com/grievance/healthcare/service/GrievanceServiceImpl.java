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
    public Long saveGrievanceDetails(String SSN,String memberName,String requestType,String requestedDate,
            String emailAddress,String contactPhone,String comments,File attachFile) {
        try{
            grievance = new Grievance();
            grievance.setMemberId(Long.MIN_VALUE);
            grievance.setSsn(Long.valueOf(SSN));
            grievance.setMemberName(memberName);
            grievance.setRequestType(requestType);
//            SimpleDateFormat sdf = new SimpleDateFormat();
//            Date reqDate=sdf.parse(requestedDate);
            grievance.setRequestDate(null);
            grievance.setEmail(emailAddress);
            grievance.setContactNo(Long.valueOf(contactPhone));
            grievance.setComments(comments);
//            grievance.setAttachedFile(null);
            return grievanceDAO.saveGrievanceDetails(grievance);
        }catch(Exception e){
            e.getMessage();
        }
        return Long.valueOf(0);
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
