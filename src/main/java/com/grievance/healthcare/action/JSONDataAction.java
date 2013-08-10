package com.grievance.healthcare.action;

import com.grievance.healthcare.model.Grievance;
import com.grievance.healthcare.service.GrievanceService;
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

public class JSONDataAction extends ActionSupport{

	
        private List<GrievanceTO> greivanceList;

        public void setGreivanceList(List<GrievanceTO> greivanceList) {
            this.greivanceList = greivanceList;
        }

        public List<GrievanceTO> getGreivanceList() {
            return greivanceList;
        }
        Map<String, String> grievance = new HashMap<String, String> ();

	public JSONDataAction(){
            System.out.println("start JSONDataAction constructor");
            greivanceList = new ArrayList<GrievanceTO>();
	    HttpServletRequest request = ServletActionContext.getRequest();
               HttpSession ssession = request.getSession();
               GrievanceTO grievanceTo =(GrievanceTO)ssession.getAttribute("grievance");
               grievance.put("memberId", grievanceTo.getMemberId()+"");
               grievance.put("ssn", grievanceTo.getSSN()+"");
               grievance.put("memberName", grievanceTo.getMemberName()+"");
               grievance.put("requestType", grievanceTo.getRequestType()+"");
               grievance.put("gtype", grievanceTo.getgType()+"");
               grievance.put("requestDate", grievanceTo.getDate());
               grievance.put("status", grievanceTo.getStatus());
               //setGreivanceList(list);
               request.setAttribute("grievanceTo",grievance);
               System.out.println("end of JSONDataAction constructor::"+grievance);
      }

	public String getJson() {
             
               return Action.SUCCESS;
        }

	

}