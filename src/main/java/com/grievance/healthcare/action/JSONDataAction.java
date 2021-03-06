package com.grievance.healthcare.action;

import com.grievance.healthcare.to.GrievanceTO;
import java.util.List;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author sabbani
 */
public class JSONDataAction extends ActionSupport {

    private List<GrievanceTO> greivanceList;
    private Map<String, String> grievance = null;

    /*
     *  constucts greivance Model values to populate  in grid
     *  @param 
     *  @return greivanceList
     **/
    public JSONDataAction() {
        System.out.println("start JSONDataAction constructor");
        greivanceList = new ArrayList<GrievanceTO>();
        grievance = new HashMap<String, String>();
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession ssession = request.getSession();
        GrievanceTO grievanceTo = (GrievanceTO) ssession.getAttribute("grievance");
        grievance.put("memberId", grievanceTo.getMemberId() + "");
        grievance.put("ssn", grievanceTo.getSSN() + "");
        grievance.put("memberName", grievanceTo.getMemberName() + "");
        grievance.put("requestType", grievanceTo.getRequestType() + "");
        grievance.put("gtype", grievanceTo.getgType() + "");
        grievance.put("requestDate", grievanceTo.getDate());
        grievance.put("status", grievanceTo.getStatus());
        //setGreivanceList(list);
        request.setAttribute("grievanceTo", grievance);
        System.out.println("end of JSONDataAction constructor::" + grievance);
    }

    /*
     *  getJson action method call
     *  @param
     *  @return Success
     */
    public String getJson() {
        return Action.SUCCESS;
    }

    /**
     * @return the grievance
     **/
    public Map<String, String> getGrievance() {
        return grievance;
    }

    /**
     * @param grievance the grievance to set
     */
    public void setGrievance(Map<String, String> grievance) {
        this.grievance = grievance;
    }

    /**
     * @param greivanceList the greivanceList to set
     */
    public void setGreivanceList(List<GrievanceTO> greivanceList) {
        this.greivanceList = greivanceList;
    }

    /**
     * @return the greivanceList
     **/
    public List<GrievanceTO> getGreivanceList() {
        return greivanceList;
    }
}
