/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.grievance.healthcare.service;

import com.grievance.healthcare.dao.GrievanceDAO;
import com.grievance.healthcare.model.Grievance;
import com.grievance.healthcare.to.GrievanceTO;
import com.grievance.healthcare.utililty.DateUtils;

/**
 *
 * @author sabbani
 */
public class GrievanceServiceImpl implements GrievanceService {

    private Grievance grievance;
    private GrievanceDAO grievanceDAO;

    @Override
    public Long saveGrievanceDetails(GrievanceTO to) {
        System.out.println("saveGrievanceDetails GrievanceServiceImple::: start ");
        Long id = null;
        try {

            grievance = new Grievance();
            grievance.setMemberId(to.getMemberId());
            grievance.setSsn((to.getSSN() != null && !to.getSSN().equals("")) ? Long.valueOf(to.getSSN()) : null);
            grievance.setMemberName(to.getMemberName());
            grievance.setRequestType(to.getRequestType());
            grievance.setRequestDate(DateUtils.convertStringToTimestamp(to.getDate()));
            grievance.setEmail(to.getEmailAddress());
            grievance.setContactNo((to.getContactPhone() != null && !to.getContactPhone().equals("")) ? Long.valueOf(to.getContactPhone()) : null);
            grievance.setComments(to.getComments());
            /**calling saveGrievanceDetails from dao */
            id = grievanceDAO.saveGrievanceDetails(grievance);
            //System.out.println("saveGrievanceDetails GrievanceServiceImple::: end " + id);
        } catch (Exception e) {
            System.out.println("exception occured in GrievanceServiceImpl saveGrievanceDetails method ::" + e.getMessage());
        }
        return id;
    }

    /**
     * @return the grievanceDAO
     **/
    public GrievanceDAO getGrievanceDAO() {
        return grievanceDAO;
    }

    /**
     * @param grievanceDAO the grievanceDAO to set
     */
    public void setGrievanceDAO(GrievanceDAO grievanceDAO) {
        this.grievanceDAO = grievanceDAO;
    }

    /**
     * @return the grievance
     **/
    public Grievance getGrievance() {
        return grievance;
    }

    /**
     * @param grievance the grievance to set
     */
    public void setGrievance(Grievance grievance) {
        this.grievance = grievance;
    }
}
