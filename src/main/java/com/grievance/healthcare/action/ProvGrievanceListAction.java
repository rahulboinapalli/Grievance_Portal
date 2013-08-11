package com.grievance.healthcare.action;

import com.grievance.healthcare.service.GrievanceService;
import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import java.io.File;
import com.grievance.healthcare.model.Grievance;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;
import com.grievance.healthcare.to.GrievanceTO;

// implements ServletRequestAware
public class ProvGrievanceListAction extends ActionSupport implements ServletRequestAware{


    private File attachFile;
    private String attachFileContentType;
    private String attachFileFileName;

    private GrievanceTO grievanceTo;

    public GrievanceTO getGrievanceTo() {
        return grievanceTo;
    }

    public void setGrievanceTo(GrievanceTO grievanceTo) {
        this.grievanceTo = grievanceTo;
    }
    
    private List<Grievance> list = new ArrayList<Grievance>();
    private GrievanceService grievanceService;
    private Grievance grievance;
    
    private List<String> greivanceList;

    public void setGreivanceList(List<String> greivanceList) {
        this.greivanceList = greivanceList;
    }

    public List<String> getGreivanceList() {
        return greivanceList;
    }

	 public String showPage()
	    {
                System.out.println("prov grievance action showpage method start");
                HttpServletRequest request = ServletActionContext.getRequest();
                HttpSession ssession = request.getSession();
               List<String> list =(List<String>)ssession.getAttribute("grievanceListAll");
               setGreivanceList(list);
               request.setAttribute("greivanceList",list);
               System.out.println("prov grievance action showpage method end");
	        return SUCCESS;
	    }

     public String saveGrievanceDetails()
	    {
                System.out.println("prov grievance action saveGrievanceDetails method start");
                HttpServletRequest request = ServletActionContext.getRequest();
                HttpSession ssession = request.getSession();
                try {
                   grievanceService.saveGrievanceDetails(grievanceTo,list);
                   /*grievanceTo = new GrievanceTO();
                   grievanceTo.setMemberId(memberId);
                   grievanceTo.setSSN(SSN);
                   grievanceTo.setMemberName(memberName);
                   grievanceTo.setRequestType(requestType);
                   grievanceTo.setDate(date);
                   grievanceTo.setEmailAddress(emailAddress);
                   grievanceTo.setContactPhone(contactPhone);
                   grievanceTo.setComments(comments);*/
                   
                    /*StringBuffer strBuff=new StringBuffer("");
                    if(grievList != null && grievList.size() > 0){
                        greivanceList = new ArrayList<String>();
//                            var mydata1 = [ {rid:v_rid,pnpi:v_npi,pname:v_pname,pyear:"Self",gtype:v_type,date:v_date,status:"Submitted"}];
                            strBuff.append("[")
                                    .append("{")
                                    .append("rid:")
                                    .append(memberId)
                                    .append(",pnpi:")
                                    .append(SSN)
                                    .append(",pname:")
                                    .append(memberName)
                                    .append(",pyear:")
                                    .append("Self")
                                    .append(",gtype:")
                                    .append(requestType)
                                    .append(",date:")
                                    .append(date)
                                    .append(",status:Submitted")
                                    .append("}").append("]");
                                 greivanceList.add(strBuff.toString());

                    }*/
                     ssession.setAttribute("grievanceList", greivanceList);
                    ssession.setAttribute("grievance", grievanceTo);

                   // response.getOutputStream().print(strBuff.toString());

                } catch (Exception e) {
                    e.printStackTrace();
                   return "failed";
                }
                System.out.println("prov grievance action saveGrievanceDetails method end");
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
