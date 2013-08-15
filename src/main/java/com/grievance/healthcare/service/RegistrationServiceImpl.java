/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.grievance.healthcare.service;
import com.grievance.healthcare.dao.RegistrationDAO;
import com.grievance.healthcare.model.Registration;
import com.grievance.healthcare.to.RegistrationTO;
import com.grievance.healthcare.utililty.ApplicationConstants;
import com.grievance.healthcare.utililty.DateUtils;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
/**
 *
 * @author sabbani
 */
public class RegistrationServiceImpl implements RegistrationService{
    
    private RegistrationDAO registrationDAO;
    private Registration registration;

    /*
     *  saveRegistration accepts
     *  used to call save the registration details to db.
     *  @param RegistrationTO to
     *  @return status
     *  @throws Exception, InvocationTargetException
     */
    @Override
    public String saveRegistration(RegistrationTO to) throws Exception, InvocationTargetException
    {
        Long id=0L;
       try{
            registration = new Registration();
            registration.setExclusionsCode(to.getExclusionsCode());
            registration.setExclusionsDate(DateUtils.convertStringToTimestamp(to.getExclusionsDate()));
            registration.setExclusionsDesc(to.getExclusionsDesc());
            registration.setFederalCity(to.getFederalCity());
            registration.setFederalDateOfBirth(DateUtils.convertStringToTimestamp(to.getFederalDateOfBirth()));
            registration.setFederalFirstName(to.getFederalFirstName());
            registration.setFederalLastName(to.getFederalFirstName());
            registration.setFederalMiddleInitail(to.getFederalMiddleInitail());
            registration.setFederalPhone(to.getFederalPhone());
            registration.setFederalProviderSpeciality(to.getFederalProviderSpeciality());
            registration.setFederalProviderType(to.getFederalProviderType());
            registration.setFederalState(to.getFederalAState());
            registration.setFederalStreet(to.getFederalStreet());
            registration.setFederalSuffix(to.getFederalSuffix());
            registration.setFederalZip((to.getFederalzZipcode() != null && !to.getFederalzZipcode().equals(ApplicationConstants.EMPTY_STRING))?Integer.valueOf(to.getFederalzZipcode()):null);
            registration.setMemberCity(to.getMemberCity());
            registration.setMemberFirstName(to.getMemberFirstName());
            registration.setMemberLastName(to.getMemberLastName());
            registration.setMemberMiddleInitail(to.getMemberMiddleInitail());
            registration.setMemberPhone((to.getMemberPhone() != null && !to.getMemberPhone().equals(ApplicationConstants.EMPTY_STRING))?Long.valueOf(to.getMemberPhone()):null);
            registration.setMemberProviderSpeciality(to.getMemberProviderSpeciality());
            registration.setMemberProviderType(to.getMemberProviderType());
            registration.setMemberState(to.getMemberAState());
            registration.setMemberStreet(to.getMemberStreet());
            registration.setMemberSuffix(to.getMemberSuffix());
            registration.setMemberZip((to.getMemberzZipcode() != null && !to.getMemberzZipcode().equals(ApplicationConstants.EMPTY_STRING))?Integer.valueOf(to.getMemberzZipcode()):null);
            registration.setNpi((to.getNpi() != null && !to.getNpi().equals(ApplicationConstants.EMPTY_STRING))?Long.valueOf(to.getNpi()):null);
            registration.setProviderSpecialty(to.getProviderSpecialty());
            registration.setTaxId((to.getTaxId() != null && !to.getTaxId().equals(ApplicationConstants.EMPTY_STRING))?Long.valueOf(to.getTaxId()):null);
            registration.setTaxonomy(to.getTaxonomy());
            registration.setStatus(ApplicationConstants.CURRUNT);
            
            /**calling save registration of dao class.*/
            id=registrationDAO.saveRegistration(registration);
         if(id > 0){
            return ApplicationConstants.SUCCESS ;
         }else{
            return ApplicationConstants.FAILED;
         }
       }catch(Exception e){
           System.out.println("exception occured in RegistrationServiceImpl saveRegistration method ::" + e.getMessage());
           throw  new Exception(ApplicationConstants.FAILED);
       }
    }

    @Override
    public Object getRegistrationJsonArray(){
        /*JsonArrayBuilder jsonArrayBuilder  = null;
        JsonArray jsonArray=null;
        JsonObject obj = null;
        try{
            List<Registration>  regDetails = registrationDAO.getRegistrationDetailsByStatus();
            JsonObjectBuilder jsonObj  = Json.createObjectBuilder();
            jsonArrayBuilder  = Json.createArrayBuilder();
            //adding value in JSON object
            for(int i=0;i<regDetails.size();i++){
                jsonObj.add("pid", regDetails.get(i).getRegId());
                jsonObj.add("taxid", regDetails.get(i).getNpi());
                jsonObj.add("regid", regDetails.get(i).getTaxId());
                jsonObj.add("pname", regDetails.get(i).getMemberFirstName()
                                     +" "+regDetails.get(i).getMemberLastName());
                jsonObj.add("regstatus", regDetails.get(i).getStatus());
                obj = jsonObj.build();
            }
            jsonArrayBuilder.add(obj);
            jsonArray = jsonArrayBuilder.build();
        }catch(Exception e){
            e.printStackTrace();
        }*/
        return null;
    }

    /**
     *
     * retrieve registration records,
     * @param 
     * @returns List of Registration records.
     * @throws Exception
     **/
    @Override
    public List<Registration> getCuuruntRegistrations() throws Exception{
        System.out.println("RegistrationServiceImpl getCuuruntRegistration::: start");
        List<Registration> list = registrationDAO.getRegistrationDetailsByStatus();
        System.out.println("RegistrationServiceImpl getCuuruntRegistration::: end");
        return list;
    }

    /**
     * @return the registrationDAO
     **/
    public RegistrationDAO getRegistrationDAO() {
        return registrationDAO;
    }

    /**
     * @param registrationDAO the registrationDAO to set for setter injection
     */
    public void setRegistrationDAO(RegistrationDAO registrationDAO) {
        this.registrationDAO = registrationDAO;
    }

    /**
     * @return the registration
     **/
    public Registration getRegistration() {
        return registration;
    }

    /**
     * @param registration the registration to set
     */
    public void setRegistration(Registration registration) {
        this.registration = registration;
    }
}
