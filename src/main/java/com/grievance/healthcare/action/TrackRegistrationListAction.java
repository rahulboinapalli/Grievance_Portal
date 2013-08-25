package com.grievance.healthcare.action;

import com.grievance.healthcare.service.RegistrationService;
import com.grievance.healthcare.to.RegistrationTO;
import com.grievance.healthcare.utililty.ApplicationConstants;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author sabbani
 */
public class TrackRegistrationListAction extends ActionSupport {

    private RegistrationService registrationService;
    
    /*
     *  showPage to populate track registration page.
     *  @param
     *  @return success status
     */
    public String showPage() {
        System.out.println("TrackRegistrationAction details showPage:: start ");
        HttpServletRequest request = ServletActionContext.getRequest();
        try {
            List<RegistrationTO> gridModel = registrationService.getCuuruntRegistrations();
            if (gridModel != null) {
                System.out.println("TrackRegistrationAction details list size:: " + gridModel.size());
                request.setAttribute("REG_LIST", gridModel);
                System.out.println("TrackRegistration details showPage:: end ");
                return SUCCESS;
            }else{
                request.setAttribute("ERR_MSG", "There are no Registrations with Cuurent status !");
                System.out.println("TrackRegistration details showPage:: end ");
                return ApplicationConstants.FAILED;
            }
            
        } catch (Exception e) {
            System.out.println("exception occured in TrackRegistrationListAction showPage method ::" + e.getMessage());
            request.setAttribute("ERR_MSG", "There are no Registrations with Cuurent status !");
            return ApplicationConstants.FAILED;
        }
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
