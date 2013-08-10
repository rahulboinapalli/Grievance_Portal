package com.grievance.healthcare.action;

import com.grievance.healthcare.service.RegistrationService;
import com.grievance.healthcare.to.RegistrationTO;
import com.opensymphony.xwork2.ActionSupport;
import java.io.File;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;

public class StartRegistrationAction extends ActionSupport{

    private RegistrationTO to;

    /*private Long regId;
   //member address
    private String memberStreet;
    private String memberCity;
    private String memberAState;
    private String memberzZipcode;
    private String memberPhone;
    //member personal info
    private String memberFirstName;
    private String memberLastName;
    private String memberMiddleInitail;
    private String memberSuffix;
    private String memberProviderType;
    private String memberProviderSpeciality;
    private String memberDateOfBirth;
// federal basic info
    private String federalFirstName;
    private String federalLastName;
    private String federalMiddleInitail;
    private String federalSuffix;
    private String federalProviderType;
    private String federalProviderSpeciality;
    private String federalDateOfBirth;
 // federal address
     private String  federalStreet;
    private String  federalCity;
    private String federalAState;
    private String  federalzZipcode;
    private String  federalPhone;
      // license info
    private String licenseType;
    private String licenseNum;
    private String expiryDate;

//member Identifiers
    private String npi;
    private String taxId;
   //member exclusion
    private String exclusionsCode;
    private String exclusionsDesc;
    private String exclusionsDate;
    //federal
    private String providerSpecialty;
    private String taxonomy;


    private File attachedFile;*/

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

            request.setAttribute("SUBMIT_STATUS", "Registration Successfully Completed!");
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
       /*String status=registrationService.saveRegistration(memberStreet,  memberCity, memberAState, memberzZipcode,
                 memberPhone,  memberFirstName, memberLastName, memberMiddleInitail, memberSuffix,
                 memberProviderType, memberProviderSpeciality, memberDateOfBirth, federalFirstName,
                 federalLastName,  federalMiddleInitail, federalSuffix,  federalProviderType, federalProviderSpeciality,
                  federalDateOfBirth,  federalStreet,  federalCity, federalAState,  federalzZipcode,
                    federalPhone, licenseType, licenseNum,  expiryDate, npi,  taxId, exclusionsCode,
                    exclusionsDesc,  exclusionsDate, providerSpecialty,  taxonomy, attachedFile);*/
         
//                    System.out.println("StartRegistrationAction saveRegistration:::" +to.getMemberCity()+"-"+to.getMemberFirstName()+"-"+to.getMemberMiddleInitail()+"-"+to.getMemberPhone()
//                +"-"+to.getMemberProviderSpeciality()+"-"+to.getMemberProviderType()+"-"+to.getMemberAState()+"-"+to.getMemberStreet()
//                +"-"+to.getMemberSuffix()+"-"+to.getMemberzZipcode());

                String status=registrationService.saveRegistration(to);


                System.out.println("status="+status);
                if(status!=null && !status.equals("") && status.equalsIgnoreCase("SUCCESS")){
                    request.setAttribute("SUBMIT_STATUS", "Registration Successfully Completed!");
                }else{
                    request.setAttribute("SUBMIT_STATUS", "Registration Not Success!");
                }
                
         }catch(Exception e){
             e.printStackTrace();
         }
        
        return SUCCESS;
    }



}
