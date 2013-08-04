/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.grievance.healthcare.model;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author sabbani
 */
@Entity
@Table(name="registration-info")
public class RegistrationInfo {

    
    private Long regInfoId;
    private String firstName;
    private String lastName;
    private String middleInitail;
    private String suffix;
    private String providerType;
    private String providerSpeciality;
    private Timestamp dateOfBirth;

    public RegistrationInfo(){

    }

     public RegistrationInfo(String firstName,String lastName, String middleInitail
             ,String suffix,String providerType,String providerSpeciality,Timestamp dateOfBirth){
         this.firstName = firstName;
         this.lastName = lastName;
         this.middleInitail = middleInitail;
         this.suffix = suffix;
         this.providerType = providerType;
         this.providerSpeciality = providerSpeciality;
         this.dateOfBirth = dateOfBirth;

    }

    @Id
    @Column(name = "reg_info_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getRegInfoId() {
        return regInfoId;
    }

    public void setRegInfoId(Long regInfoId) {
        this.regInfoId = regInfoId;
    }

    @Column(name = "date_of_birth", nullable= true)
    public Timestamp getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Timestamp dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    @Column(name = "first_name", nullable= true)
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    @Column(name = "last_name", nullable= true)
    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @Column(name = "middle_initail", nullable= true)
    public String getMiddleInitail() {
        return middleInitail;
    }

    public void setMiddleInitail(String middleInitail) {
        this.middleInitail = middleInitail;
    }

    @Column(name = "prov_speciality", nullable= true)
    public String getProviderSpeciality() {
        return providerSpeciality;
    }

    public void setProviderSpeciality(String providerSpeciality) {
        this.providerSpeciality = providerSpeciality;
    }

    @Column(name = "prov_type", nullable= true)
    public String getProviderType() {
        return providerType;
    }

    public void setProviderType(String providerType) {
        this.providerType = providerType;
    }

    @Column(name = "suffix", nullable= true)
    public String getSuffix() {
        return suffix;
    }

    public void setSuffix(String suffix) {
        this.suffix = suffix;
    }
    
}
