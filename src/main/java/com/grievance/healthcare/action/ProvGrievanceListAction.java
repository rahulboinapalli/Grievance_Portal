package com.grievance.healthcare.action;

import com.grievance.healthcare.service.GrievanceService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import javax.servlet.http.HttpServletRequest;
import com.grievance.healthcare.to.GrievanceTO;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sabbani
 */
public class ProvGrievanceListAction extends ActionSupport {

    private GrievanceTO grievanceTo;
    private GrievanceService grievanceService;

    /*
     *  showPage, used to populate provGrievance page.
     *  @returns success string.
     **/
    public String showPage() {

        return SUCCESS;
    }

    /**
     *  saveGrievanceDetails, Is an Ajax call,
     *  @return response back.
     **/
    public void saveGrievanceDetails() {
        System.out.println("prov grievance action saveGrievanceDetails method start");
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        PrintWriter out = null;
        try {

            /**Getting the Writer Object*/
            out = response.getWriter();
            /** Getting the values from query parameters*/
            String memberId = request.getParameter("v_rid");
            String SSN = request.getParameter("v_npi");
            String memberName = request.getParameter("v_pname");
            String date = request.getParameter("v_date");
            String requestType = request.getParameter("type");
            String emailAddress = request.getParameter("v_email");
            String phone = request.getParameter("v_phone");
            String comments = request.getParameter("v_comments");
            System.out.println(memberId + "-" + SSN);

            /**Setting all values to Grievance Transfer Object*/
            grievanceTo = new GrievanceTO();
            if (memberId != null && !memberId.equals("")) {
                grievanceTo.setMemberId(Long.valueOf(memberId));
            }
            grievanceTo.setSSN(SSN);
            grievanceTo.setMemberName(memberName);
            grievanceTo.setRequestType(requestType);
            grievanceTo.setDate(date);
            grievanceTo.setEmailAddress(emailAddress);
            grievanceTo.setContactPhone(phone);
            grievanceTo.setComments(comments);

            /*
             *  Service call to save Grievance Details to DB.
             */
            grievanceService.saveGrievanceDetails(grievanceTo);
            /**writing response back*/
            out.print("success");

        } catch (Exception e) {
            System.out.println("exception occured in saveGrievanceDetails method ::" + e.getMessage());
        }
        
    }

    /**
     * @return the grievanceService
     */
    public GrievanceService getGrievanceService() {
        return grievanceService;
    }

    /**
     * @param grievanceService the grievanceService to set
     */
    public void setGrievanceService(GrievanceService grievanceService) {
        this.grievanceService = grievanceService;
    }

    /**
     * @return the grievanceTo
     */
    public GrievanceTO getGrievanceTo() {
        return grievanceTo;
    }

    /**
     * @param grievanceTo the grievanceTo to set
     */
    public void setGrievanceTo(GrievanceTO grievanceTo) {
        this.grievanceTo = grievanceTo;
    }
}
