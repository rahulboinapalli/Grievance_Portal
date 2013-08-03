package com.grievance.healthcare.action;

import com.grievance.healthcare.service.GrievanceService;
import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import java.io.File;
import com.grievance.healthcare.model.Grievance;
import com.grievance.healthcare.to.GrievanceTO;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.ServletRequestAware;

// implements ServletRequestAware
public class ProvGrievanceListAction extends ActionSupport implements ServletRequestAware{


    private File attachFile;
    private String attachFileContentType;
    private String attachFileFileName;


    List<Grievance> list = new ArrayList<Grievance>();
    private GrievanceService grievanceService;
    private Grievance grievance;
    
    
    private Long memberId;
    private String SSN;
    private String memberName;
    private String requestType;
    private String date;
    private String emailAddress;
    private String contactPhone;
    private String comments;

//    public transient JSONSerializer serializer;
  
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

    private List<String> greivanceList;

    public void setGreivanceList(List<String> greivanceList) {
        this.greivanceList = greivanceList;
    }

    public List<String> getGreivanceList() {
        return greivanceList;
    }

	 public String showPage()
	    {
           
	        return SUCCESS;
	    }

     public String saveGrievanceDetails()
	    {
                HttpServletRequest request = ServletActionContext.getRequest();
                HttpSession ssession = request.getSession();
                HttpServletResponse response = ServletActionContext.getResponse();
//                ServletOutputStream out = null;
                
                try {
                   /* memberId=Long.valueOf(request.getParameter("v_rid"));
                    SSN =request.getParameter("v_npi");
                    memberName = request.getParameter("v_pname");
                    requestType = request.getParameter("v_type");
                    date = request.getParameter("v_date");
                    emailAddress = request.getParameter("v_email");
                    contactPhone = request.getParameter("v_phone");
                    comments = request.getParameter("v_comments");*/
//                    attachFile = request.getParameter("v_rid");
                   List<Grievance> grievListAll= (List<Grievance>)ssession.getAttribute("grievanceList");
                   List<Grievance> grievList =grievanceService.saveGrievanceDetails(memberId,SSN,
                             memberName,requestType ,date,emailAddress,contactPhone,comments,getAttachFile(),list);
                   if(grievListAll != null){
                       grievListAll.addAll(grievList);
                   }else{
                       grievListAll = new ArrayList<Grievance>();
                       grievListAll.addAll(grievList);
                   }
                    StringBuffer strBuff=new StringBuffer("");
                    if(grievListAll != null && grievListAll.size() > 0){
                        ssession.setAttribute("grievanceList", grievListAll);
                        greivanceList = new ArrayList<String>();
                        for(Grievance greivanceObj:grievList){
//                            var mydata1 = [ {rid:v_rid,pnpi:v_npi,pname:v_pname,pyear:"Self",gtype:v_type,date:v_date,status:"Submitted"}];
                            strBuff.append("[")
                                    .append("{")
                                    .append("rid:")
                                    .append(greivanceObj.getMemberId())
                                    .append(",pnpi:")
                                    .append(greivanceObj.getSsn())
                                    .append(",pname:")
                                    .append(greivanceObj.getMemberName())
                                    .append(",pyear:")
                                    .append("Self")
                                    .append(",gtype:")
                                    .append(greivanceObj.getRequestType())
                                    .append(",date:")
                                    .append(greivanceObj.getRequestDate())
                                    .append(",status:Submitted")
                                    .append("}").append("]");
                                 greivanceList.add(strBuff.toString());
                        }
                    }
                    

//                    response.getOutputStream().print(SUCCESS);
                } catch (Exception e) {
                    e.printStackTrace();
                   return "failed";
                }
                return SUCCESS;
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

        public void setAttachFile(File attachFile) {
        this.attachFile = attachFile;
    }

    public void setAttachFileContentType(String attachFileContentType) {
        this.attachFileContentType = attachFileContentType;
    }

    public void setAttachFileFileName(String attachFileFileName) {
        this.attachFileFileName = attachFileFileName;
    }

    public File getAttachFile() {
        return attachFile;
    }

    public String getAttachFileContentType() {
        return attachFileContentType;
    }

    public String getAttachFileFileName() {
        return attachFileFileName;
    }

    @Override
    public void setServletRequest(HttpServletRequest hsr) {
//        throw new UnsupportedOperationException("Not supported yet.");
    }



}
