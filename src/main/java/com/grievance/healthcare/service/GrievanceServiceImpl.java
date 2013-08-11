/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.grievance.healthcare.service;

import com.grievance.healthcare.dao.GrievanceDAO;
import com.grievance.healthcare.model.Grievance;
import com.grievance.healthcare.to.GrievanceTO;
import com.grievance.healthcare.utililty.DateUtils;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author sabbani
 */
public class GrievanceServiceImpl implements GrievanceService{
    private Grievance grievance;
    private GrievanceDAO grievanceDAO;
    @Override
    public List<Grievance> saveGrievanceDetails(GrievanceTO to,List<Grievance> list) {
        System.out.println("saveGrievanceDetails GrievanceServiceImple::: start ");
        try{
           
            grievance = new Grievance();
            grievance.setMemberId(to.getMemberId());
            grievance.setSsn((to.getSSN() != null && !to.getSSN().equals(""))?Long.valueOf(to.getSSN()):null);
            grievance.setMemberName(to.getMemberName());
            grievance.setRequestType(to.getRequestType());
            grievance.setRequestDate(DateUtils.convertStringToTimestamp(to.getDate()));
//            grievance.setRequestDate(new Timestamp(new java.util.Date().getTime()));
            grievance.setEmail(to.getEmailAddress());
            grievance.setContactNo((to.getContactPhone() != null && !to.getContactPhone().equals(""))?Long.valueOf(to.getContactPhone()):null);
            grievance.setComments(to.getComments());
            // Convert FormFile to a byte Array
//            byte[] byteArray=FileUtils.readFileToByteArray(attachFile);
            grievance.setAttachedFile(null);
            
            Long id= grievanceDAO.saveGrievanceDetails(grievance);
            if(id > 0){
               if(list == null)
                    list = new ArrayList<Grievance>();
               list.add(grievance);
            }
            System.out.println("saveGrievanceDetails GrievanceServiceImple::: end "+id);
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
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
