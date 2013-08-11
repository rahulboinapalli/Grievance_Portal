package com.grievance.healthcare.action;

import com.grievance.healthcare.service.SignInService;
import com.grievance.healthcare.to.SignInTO;
import com.grievance.healthcare.utililty.ApplicationConstants;
import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

public class SignupAction extends ActionSupport{
    
    private SignInService signInService;

    private  SignInTO  to;

    public SignInService getSignInService() {
        return signInService;
    }

    public void setSignInService(SignInService signInService) {
        this.signInService = signInService;
    }

     

    public SignInTO getTo() {
        return to;
    }

    public void setTo(SignInTO to) {
        this.to = to;
    }

	public String showPage()
    {
        return SUCCESS;
    }

    public String saveDetails(){
        System.out.println("this is from action");
        HttpServletRequest request = ServletActionContext.getRequest();
        try{
            Boolean  flag = signInService.saveSignInDetails(to);
            System.out.println("flag:::"+flag);
            if(flag){
                request.setAttribute(ApplicationConstants.SUBMIT_STATUS, "User Registerd Successfully, Now you can proceed to Signin....!");
                return SUCCESS;
            }else{
                request.setAttribute(ApplicationConstants.ERR_MSG, "Ooooops, User Not Registerd Successfully, Better luck next time....!");
            }
        }catch(Exception e){
            e.printStackTrace();
            request.setAttribute(ApplicationConstants.ERR_MSG, "User Not Registerd Successfully!");
            return ApplicationConstants.FAILED;
        }
        System.out.println("this is from action end");
        return ApplicationConstants.FAILED;

    }
}
