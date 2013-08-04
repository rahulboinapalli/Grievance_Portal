/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.grievance.healthcare.service;
import java.io.File;

/**
 *
 * @author sabbani
 */
public interface RegistrationService {
    public String saveRegistration(String memberStreet, String memberCity,String memberAState,String  memberzZipcode,
            Long memberPhone, String memberFirstName,String memberLastName,String memberMiddleInitail,
            String memberSuffix,String memberProviderType,String memberProviderSpeciality,String memberDateOfBirth,
            String federalFirstName, String federalLastName, String federalMiddleInitail,String federalSuffix,
            String federalProviderType,String federalProviderSpeciality, String federalDateOfBirth,
            String  federalStreet,String  federalCity,String federalAState,String  federalzZipcode, Long  federalPhone,
            String licenseType,Long licenseNum, String expiryDate,Long npi, Long taxId,String exclusionsCode,
            String exclusionsDesc, String exclusionsDate,String providerSpecialty, String taxonomy,File attachedFile);
}
