package com.grievance.healthcare.action;

import com.grievance.healthcare.service.RegistrationService;
import com.grievance.healthcare.to.RegistrationTO;
import com.grievance.healthcare.utililty.ApplicationConstants;
import com.opensymphony.xwork2.ActionSupport;
import java.lang.reflect.InvocationTargetException;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

public class StartRegistrationAction extends ActionSupport {

    private RegistrationTO to;
    private RegistrationService registrationService;

    /*
     *  showPage to populate start registration page.
     *  @param
     *  @return success status
     */
    public String showPage() {
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute(ApplicationConstants.SUBMIT_STATUS, "Registration Successfully Completed!");
        return SUCCESS;
    }

    /*
     *  saveRegistration accepts
     *  used to call save the registration details to db.
     *  @param RegistrationTO to
     *  @return status
     **/
    public String saveRegistration() {
        HttpServletRequest request = ServletActionContext.getRequest();
        try {
            /** calling saveRegistration from  registrationServiceImple*/
            String status = registrationService.saveRegistration(to);
            if (status != null && !status.equals("") & status.equalsIgnoreCase(SUCCESS)) {
                /** setting the success message in request*/
                request.setAttribute(ApplicationConstants.SUBMIT_STATUS, ApplicationConstants.REG_SUCCESS);
                return SUCCESS;
            } else {
                /** setting the error message in request*/
                request.setAttribute(ApplicationConstants.ERR_MSG, ApplicationConstants.REG_NOT_SUCCESS);
                return ApplicationConstants.FAILED;
            }
        } catch (InvocationTargetException ie) {
            /** setting the error message in request*/
            request.setAttribute(ApplicationConstants.ERR_MSG, ApplicationConstants.REG_NOT_SUCCESS);
            System.out.println("exception occured in StartRegistrationAction saveRegistration method ::" + ie.getMessage());
            return ApplicationConstants.FAILED;
        } catch (Exception e) {
            /** setting the error message in request*/
            request.setAttribute(ApplicationConstants.ERR_MSG, ApplicationConstants.REG_NOT_SUCCESS);
            System.out.println("exception occured in StartRegistrationAction saveRegistration method ::" + e.getMessage());
            return ApplicationConstants.FAILED;
        }
    }

    /**
     * @return the to
     **/
    public RegistrationTO getTo() {
        return to;
    }

    /**
     * @param to the to to set
     */
    public void setTo(RegistrationTO to) {
        this.to = to;
    }

    /**
     * @return the registrationService
     **/
    public RegistrationService getRegistrationService() {
        return registrationService;
    }

    /**
     * @param RegistrationService the registrationService to set for setter injection
     */
    public void setRegistrationService(RegistrationService registrationService) {
        this.registrationService = registrationService;
    }
}
