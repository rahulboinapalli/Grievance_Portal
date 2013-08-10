/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.grievance.healthcare.service;

import com.grievance.healthcare.dao.GrievanceDAO;
import java.io.File;
import com.grievance.healthcare.model.Grievance;
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
    public List<Grievance> saveGrievanceDetails(Long memberId,String SSN,String memberName,String requestType,String requestedDate,
            String emailAddress,String contactPhone,String comments,File attachFile,List<Grievance> list) {
        System.out.println("saveGrievanceDetails GrievanceServiceImple::: start ");
        try{
           
            grievance = new Grievance();
            grievance.setMemberId(memberId);
            grievance.setSsn(Long.valueOf(SSN));
            grievance.setMemberName(memberName);
            grievance.setRequestType(requestType);
//            grievance.setRequestDate(DateUtils.convertStringToData(requestedDate));
            grievance.setRequestDate(new Timestamp(new java.util.Date().getTime()));
            grievance.setEmail(emailAddress);
            grievance.setContactNo(Long.valueOf(contactPhone));
            grievance.setComments(comments);
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
