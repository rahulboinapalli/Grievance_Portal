/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.grievance.healthcare.service;
import com.grievance.healthcare.dao.RegistrationDAO;
import com.grievance.healthcare.model.Registration;
import com.grievance.healthcare.to.RegistrationTO;
import java.sql.Timestamp;
import java.util.Date;
/**
 *
 * @author sabbani
 */
public class RegistrationServiceImpl implements RegistrationService{
    private RegistrationDAO registrationDAO;
    private Registration registration;
    
    /*public String saveRegistration(String memberStreet, String memberCity,String memberState,String memberZipcode,
            Long memberPhone, String memberFirstName,String memberLastName,String memberMiddleInitail,
            String memberSuffix,String memberProviderType,String memberProviderSpeciality,String memberDateOfBirth,
            String federalFirstName, String federalLastName, String federalMiddleInitail,String federalSuffix,
            String federalProviderType,String federalProviderSpeciality, String federalDateOfBirth,
            String  federalStreet,String  federalCity,String federalAState,String  federalZipcode, Long  federalPhone,
            String licenseType,Long licenseNum, String expiryDate,Long npi, Long taxId,String exclusionsCode,
            String exclusionsDesc, String exclusionsDate,String providerSpecialty, String taxonomy,File attachedFile)*/
    @Override
    public String saveRegistration(RegistrationTO to)
    {
        Long id=0L;
       try{
            registration = new Registration();
        registration.setExclusionsCode(to.getExclusionsCode());
        registration.setExclusionsDate(new Timestamp(new Date().getTime()));
        registration.setExclusionsDesc(to.getExclusionsDesc());
        registration.setFederalCity(to.getFederalCity());
        registration.setFederalDateOfBirth(new Timestamp(new Date().getTime()));
        registration.setFederalFirstName(to.getFederalFirstName());
        registration.setFederalLastName(to.getFederalFirstName());
        registration.setFederalMiddleInitail(to.getFederalMiddleInitail());
        registration.setFederalPhone(to.getFederalPhone());
        registration.setFederalProviderSpeciality(to.getFederalProviderSpeciality());
        registration.setFederalProviderType(to.getFederalProviderType());
        registration.setFederalState(to.getFederalAState());
        registration.setFederalStreet(to.getFederalStreet());
        registration.setFederalSuffix(to.getFederalSuffix());
        registration.setFederalZip((to.getFederalzZipcode() != null && !to.getFederalzZipcode().equals(""))?Integer.valueOf(to.getFederalzZipcode()):Integer.valueOf(0));
        registration.setMemberCity(to.getMemberCity());
        registration.setMemberFirstName(to.getMemberFirstName());
        registration.setMemberLastName(to.getMemberLastName());
        registration.setMemberMiddleInitail(to.getMemberMiddleInitail());
        registration.setMemberPhone((to.getMemberPhone() != null && !to.getMemberPhone().equals(""))?Long.valueOf(to.getMemberPhone()):Long.valueOf(0));
        registration.setMemberProviderSpeciality(to.getMemberProviderSpeciality());
        registration.setMemberProviderType(to.getMemberProviderType());
        registration.setMemberState(to.getMemberAState());
        registration.setMemberStreet(to.getMemberStreet());
        registration.setMemberSuffix(to.getMemberSuffix());
        registration.setMemberZip((to.getMemberzZipcode() != null && !to.getMemberzZipcode().equals(""))?Integer.valueOf(to.getMemberzZipcode()):0);

        registration.setNpi(to.getNpi());
        registration.setProviderSpecialty(to.getProviderSpecialty());
        registration.setTaxId(to.getTaxId());
        registration.setTaxonomy(to.getTaxonomy());
        //        registration.setAttachedFile(null);
        registration.setStatus("currunt");
        //System.out.println("RegistrationServiceImpl saveRegistration:::" +to.getMemberCity()+"-"+to.getMemberFirstName()+"-"+to.getMemberMiddleInitail()+"-"+to.getMemberPhone()
          //      +"-"+to.getMemberProviderSpeciality()+"-"+to.getMemberProviderType()+"-"+to.getMemberAState()+"-"+to.getMemberStreet()
            //    +"-"+to.getMemberSuffix()+"-"+to.getMemberzZipcode());
            id=registrationDAO.saveRegistration(registration);
       }catch(Exception e){
           e.printStackTrace();
       }
        if(id > 0){
            return "SUCCESS";
        }
        return "FAILED";
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

    public RegistrationDAO getRegistrationDAO() {
        return registrationDAO;
    }

    public void setRegistrationDAO(RegistrationDAO registrationDAO) {
        this.registrationDAO = registrationDAO;
    }

    public Registration getRegistration() {
        return registration;
    }

    public void setRegistration(Registration registration) {
        this.registration = registration;
    }

    
}
