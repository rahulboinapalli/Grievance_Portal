package com.grievance.healthcare.action;

import com.grievance.healthcare.service.GrievanceService;
import com.opensymphony.xwork2.ActionSupport;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.components.File;
import com.grievance.healthcare.model.Grievance;

public class ProvGrievanceListAction extends ActionSupport{
    private Long memberId;
    private String SSN;
    private String memberName;
    private String requestType;
    private String date;
    private String emailAddress;
    private String contactPhone;
    private String comments;
    private File attachFile;
    
    private GrievanceService grievanceService;
    private Grievance grievance;
    


    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getSSN() {
        return SSN;
    }

    public void setSSN(String SSN) {
        this.SSN = SSN;
    }

    public File getAttachFile() {
        return attachFile;
    }

    public void setAttachFile(File attachFile) {
        this.attachFile = attachFile;
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public Long getMemberId() {
        return memberId;
    }

    public void setMemberId(Long memberId) {
        this.memberId = memberId;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public String getRequestType() {
        return requestType;
    }

    public void setRequestType(String requestType) {
        this.requestType = requestType;
    }

	 public String showPage()
	    {
	        return SUCCESS;
	    }

     public void saveGrievanceDetails()
	    {
         PrintWriter out = null;
                try {
                    HttpServletResponse response = ServletActionContext.getResponse();
                     if(grievanceService.saveGrievanceDetails(memberId,SSN,memberName,requestType,date,emailAddress,contactPhone,comments,attachFile,grievance)){
                        out = response.getWriter();
                        out.print("SUCCESS");
                     }else{
                        out.print("FAILED");
                     }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.print("FAILED");
                }
            }
         public GrievanceService getGrievanceService() {
		return grievanceService;
	}

	public void setGrievanceService(GrievanceService grievanceService) {
		this.grievanceService = grievanceService;
	}
        
        public Grievance getGrievance() {
		return grievance;
	}

	public void setGrievance(Grievance grievance) {
		this.grievance = grievance;
	}

}
