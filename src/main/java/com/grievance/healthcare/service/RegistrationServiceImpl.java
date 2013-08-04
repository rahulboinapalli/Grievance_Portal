/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.grievance.healthcare.service;
import com.grievance.healthcare.dao.RegistrationDAO;
import com.grievance.healthcare.model.Registration;
import java.io.File;
import java.sql.Timestamp;
import java.util.Date;
/**
 *
 * @author sabbani
 */
public class RegistrationServiceImpl implements RegistrationService{
    private RegistrationDAO registrationDAO;
    private Registration registration;
    @Override
    public String saveRegistration(String memberStreet, String memberCity,String memberState,String memberZipcode,
            Long memberPhone, String memberFirstName,String memberLastName,String memberMiddleInitail,
            String memberSuffix,String memberProviderType,String memberProviderSpeciality,String memberDateOfBirth,
            String federalFirstName, String federalLastName, String federalMiddleInitail,String federalSuffix,
            String federalProviderType,String federalProviderSpeciality, String federalDateOfBirth,
            String  federalStreet,String  federalCity,String federalAState,String  federalZipcode, Long  federalPhone,
            String licenseType,Long licenseNum, String expiryDate,Long npi, Long taxId,String exclusionsCode,
            String exclusionsDesc, String exclusionsDate,String providerSpecialty, String taxonomy,File attachedFile){
        Long id=0L;
       try{
            registration = new Registration();
        registration.setExclusionsCode(exclusionsCode);
        registration.setExclusionsDate(new Timestamp(new Date().getTime()));
        registration.setExclusionsDesc(exclusionsDesc);
        registration.setFederalCity(federalCity);
        registration.setFederalDateOfBirth(new Timestamp(new Date().getTime()));
        registration.setFederalFirstName(federalFirstName);
        registration.setFederalLastName(federalLastName);
        registration.setFederalMiddleInitail(federalMiddleInitail);
        registration.setFederalPhone(federalPhone);
        registration.setFederalProviderSpeciality(federalProviderSpeciality);
        registration.setFederalProviderType(federalProviderType);
        registration.setFederalState(federalAState);
        registration.setFederalStreet(federalStreet);
        registration.setFederalSuffix(federalSuffix);
        registration.setFederalZip((federalZipcode != null && !federalZipcode.equals(""))?Integer.valueOf(federalZipcode):0);
        registration.setMemberCity(memberCity);
        registration.setMemberFirstName(memberFirstName);
        registration.setMemberMiddleInitail(memberMiddleInitail);
        registration.setMemberPhone(memberPhone);
        registration.setMemberProviderSpeciality(memberProviderSpeciality);
        registration.setMemberProviderType(memberProviderType);
        registration.setMemberState(memberState);
        registration.setMemberStreet(memberStreet);
        registration.setMemberSuffix(memberSuffix);
        registration.setMemberZip((memberZipcode != null && !memberZipcode.equals(""))?Integer.valueOf(memberZipcode):0);
        registration.setNpi(npi);
        registration.setProviderSpecialty(providerSpecialty);
        registration.setTaxId(taxId);
        registration.setTaxonomy(taxonomy);
        //        registration.setAttachedFile(null);
        id=registrationDAO.saveRegistration(registration);
       }catch(Exception e){
           e.printStackTrace();
       }
        if(id > 0){
            return "SUCCESS";
        }
        return "FAILED";
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
