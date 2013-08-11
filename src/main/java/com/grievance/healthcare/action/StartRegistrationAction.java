package com.grievance.healthcare.action;

import com.grievance.healthcare.service.RegistrationService;
import com.grievance.healthcare.to.RegistrationTO;
import com.grievance.healthcare.utililty.ApplicationConstants;
import com.opensymphony.xwork2.ActionSupport;
import java.lang.reflect.InvocationTargetException;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

public class StartRegistrationAction extends ActionSupport{

    private RegistrationTO to;

    private RegistrationService registrationService;

    public RegistrationTO getTo() {
        return to;
    }

    public void setTo(RegistrationTO to) {
        this.to = to;
    }

    public String showPage()
    {
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute(ApplicationConstants.SUBMIT_STATUS, "Registration Successfully Completed!");
        return SUCCESS;
    }

    public RegistrationService getRegistrationService() {
        return registrationService;
    }

    public void setRegistrationService(RegistrationService registrationService) {
        this.registrationService = registrationService;
    }

    public String saveRegistration(){
          HttpServletRequest request = ServletActionContext.getRequest();
        try{
                String status=registrationService.saveRegistration(to);
                System.out.println("status="+status);
                if(status!=null && !status.equals("") & status.equalsIgnoreCase(SUCCESS)){
                    request.setAttribute(ApplicationConstants.SUBMIT_STATUS, "Registration Successfully Completed!");
                    return SUCCESS;
                }else{
                    request.setAttribute(ApplicationConstants.ERR_MSG, "Registration Not Success!");
                    return ApplicationConstants.FAILED;
                }
         }catch(InvocationTargetException ie){
             System.out.println("status inside InvocationTargetException="+ie.getMessage());
//             ie.printStackTrace();
             request.setAttribute(ApplicationConstants.ERR_MSG, "Registration Not Success!");
             return ApplicationConstants.FAILED;
         }catch(Exception e){
             System.out.println("status inside exception="+e.getMessage());
//             e.printStackTrace();
             request.setAttribute(ApplicationConstants.ERR_MSG, "Registration Not Success!");
             return ApplicationConstants.FAILED;
         }
    }
}
