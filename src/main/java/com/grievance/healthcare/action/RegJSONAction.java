/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.grievance.healthcare.action;

import com.grievance.healthcare.model.Registration;
import com.grievance.healthcare.service.RegistrationService;
import com.grievance.healthcare.utililty.ApplicationConstants;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;

/**
 *
 * @author sabbani
 */
public class RegJSONAction extends ActionSupport {

    private RegistrationService registrationService;
    private List<Registration> gridModel;

    /*
     *  used to call to populate  greivance Model values in grid
     *  @param gridModel
     *  @return status
     **/
    public String execute() {
        System.out.println("RegJSONAction execute::: start");
        try {
            gridModel = registrationService.getCuuruntRegistrations();
            if (gridModel != null) {
                System.out.println("Registration details list size:: " + gridModel.size());
            }
        } catch (Exception e) {
            System.out.println("exception occured in RegJSONAction execute method ::" + e.getMessage());
        }
        return ApplicationConstants.SUCCESS;
    }


    /*
     *  execute method call
     *  @param
     *  @return 
     */
    public String getJSON() {
        return execute();
    }

    /**
     * @return the gridModel
     **/
    public List<Registration> getGridModel() {
        return gridModel;
    }

    /**
     * @param gridModel the gridModel to set
     */
    public void setGridModel(List<Registration> gridModel) {
        this.gridModel = gridModel;
    }

    /**
     * @return the registrationService
     **/
    public RegistrationService getRegistrationService() {
        return registrationService;
    }

    /**
     * @param registrationService the registrationService to set 
     */
    public void setRegistrationService(RegistrationService registrationService) {
        this.registrationService = registrationService;
    }
}
