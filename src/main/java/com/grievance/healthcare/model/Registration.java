/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.grievance.healthcare.model;

import java.io.Serializable;
import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;

import javax.persistence.Table;

/**
 *
 * @author sabbani
 */
@Entity
@Table(name="greivance_registration")
@NamedQuery(name="reg.findByStatus", query="from Registration where status = :status")
public class Registration implements Serializable {

    @Id
    @Column(name="reg_id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long regId;

    @Column(name="mem_first_name")
    private String memberFirstName;
    @Column(name="mem_last_name")
    private String memberLastName;
    @Column(name="mem_middle_initial")
    private String memberMiddleInitail;
    @Column(name="mem_suffix")
    private String memberSuffix;
    @Column(name="mem_provider_type")
    private String memberProviderType;
    @Column(name="mem_provider_speciality")
    private String memberProviderSpeciality;
    @Column(name="fed_first_name")
    private String federalFirstName;
    @Column(name="fed_last_name")
    private String federalLastName;
    @Column(name="fed_middle_initail")
    private String federalMiddleInitail;
    @Column(name="fed_suffix")
    private String federalSuffix;
    @Column(name="fed_provider_type")
    private String federalProviderType;
    @Column(name="fed_provider_speciality")
    private String federalProviderSpeciality;
    @Column(name="fed_date_of_birth")
    private Timestamp federalDateOfBirth;

    @Column(name="mem_street")
    private String memberStreet;
    @Column(name="mem_city")
    private String memberCity;
    @Column(name="mem_state")
    private String memberState;
    @Column(name="mem_zip")
    private Integer memberZip;
    @Column(name="mem_phone")
    private Long memberPhone;

    @Column(name="fed_street")
    private String federalStreet;
    @Column(name="fed_city")
    private String federalCity;
    @Column(name="fed_state")
    private String federalState;
    @Column(name="fed_zip")
    private Integer federalZip;
    @Column(name="fed_phone")
    private Long federalPhone;

    @Column(name="npi")
    private Long npi;

    @Column(name="tax_id")
    private Long taxId;

    @Column(name="exclusion_code")
    private String exclusionsCode;
    
    @Column(name="exclusion_desc")
    private String exclusionsDesc;

    @Column(name="exclusion_date")
    private Timestamp exclusionsDate;

    @Column(name="prov_speciality")
    private String providerSpecialty;
    
    @Column(name="taxonomy")
    private String taxonomy;


   @Column(name="attach_file")
    private byte[] attachedFile;

    @Column(name="reg_status")
    private String status;

  
    public Long getRegId() {
        return regId;
    }

    public void setRegId(Long regId) {
        this.regId = regId;
    }

    public String getFederalCity() {
        return federalCity;
    }

    public void setFederalCity(String federalCity) {
        this.federalCity = federalCity;
    }

    public Timestamp getFederalDateOfBirth() {
        return federalDateOfBirth;
    }

    public void setFederalDateOfBirth(Timestamp federalDateOfBirth) {
        this.federalDateOfBirth = federalDateOfBirth;
    }

    public String getFederalFirstName() {
        return federalFirstName;
    }

    public void setFederalFirstName(String federalFirstName) {
        this.federalFirstName = federalFirstName;
    }

    public String getFederalLastName() {
        return federalLastName;
    }

    public void setFederalLastName(String federalLastName) {
        this.federalLastName = federalLastName;
    }

    public String getFederalMiddleInitail() {
        return federalMiddleInitail;
    }

    public void setFederalMiddleInitail(String federalMiddleInitail) {
        this.federalMiddleInitail = federalMiddleInitail;
    }

    public Long getFederalPhone() {
        return federalPhone;
    }

    public void setFederalPhone(Long federalPhone) {
        this.federalPhone = federalPhone;
    }

    public String getFederalProviderSpeciality() {
        return federalProviderSpeciality;
    }

    public void setFederalProviderSpeciality(String federalProviderSpeciality) {
        this.federalProviderSpeciality = federalProviderSpeciality;
    }

    public String getFederalProviderType() {
        return federalProviderType;
    }

    public void setFederalProviderType(String federalProviderType) {
        this.federalProviderType = federalProviderType;
    }

    public String getFederalState() {
        return federalState;
    }

    public void setFederalState(String federalState) {
        this.federalState = federalState;
    }

    public String getFederalStreet() {
        return federalStreet;
    }

    public void setFederalStreet(String federalStreet) {
        this.federalStreet = federalStreet;
    }

    public String getFederalSuffix() {
        return federalSuffix;
    }

    public void setFederalSuffix(String federalSuffix) {
        this.federalSuffix = federalSuffix;
    }

    public Integer getFederalZip() {
        return federalZip;
    }

    public void setFederalZip(Integer federalZip) {
        this.federalZip = federalZip;
    }

    public String getMemberCity() {
        return memberCity;
    }

    public void setMemberCity(String memberCity) {
        this.memberCity = memberCity;
    }

    public String getMemberFirstName() {
        return memberFirstName;
    }

    public void setMemberFirstName(String memberFirstName) {
        this.memberFirstName = memberFirstName;
    }

    public String getMemberLastName() {
        return memberLastName;
    }

    public void setMemberLastName(String memberLastName) {
        this.memberLastName = memberLastName;
    }

    public String getMemberMiddleInitail() {
        return memberMiddleInitail;
    }

    public void setMemberMiddleInitail(String memberMiddleInitail) {
        this.memberMiddleInitail = memberMiddleInitail;
    }

    public Long getMemberPhone() {
        return memberPhone;
    }

    public void setMemberPhone(Long memberPhone) {
        this.memberPhone = memberPhone;
    }

    public String getMemberProviderSpeciality() {
        return memberProviderSpeciality;
    }

    public void setMemberProviderSpeciality(String memberProviderSpeciality) {
        this.memberProviderSpeciality = memberProviderSpeciality;
    }

    public String getMemberProviderType() {
        return memberProviderType;
    }

    public void setMemberProviderType(String memberProviderType) {
        this.memberProviderType = memberProviderType;
    }

    public String getMemberState() {
        return memberState;
    }

    public void setMemberState(String memberState) {
        this.memberState = memberState;
    }

    public String getMemberStreet() {
        return memberStreet;
    }

    public void setMemberStreet(String memberStreet) {
        this.memberStreet = memberStreet;
    }

    public String getMemberSuffix() {
        return memberSuffix;
    }

    public void setMemberSuffix(String memberSuffix) {
        this.memberSuffix = memberSuffix;
    }

    public Integer getMemberZip() {
        return memberZip;
    }

    public void setMemberZip(Integer memberZip) {
        this.memberZip = memberZip;
    }

    public String getExclusionsCode() {
        return exclusionsCode;
    }

    public void setExclusionsCode(String exclusionsCode) {
        this.exclusionsCode = exclusionsCode;
    }

    public Timestamp getExclusionsDate() {
        return exclusionsDate;
    }

    public void setExclusionsDate(Timestamp exclusionsDate) {
        this.exclusionsDate = exclusionsDate;
    }

    public String getExclusionsDesc() {
        return exclusionsDesc;
    }

    public void setExclusionsDesc(String exclusionsDesc) {
        this.exclusionsDesc = exclusionsDesc;
    }

   

    public Long getNpi() {
        return npi;
    }

    public void setNpi(Long npi) {
        this.npi = npi;
    }

    public String getProviderSpecialty() {
        return providerSpecialty;
    }

    public void setProviderSpecialty(String providerSpecialty) {
        this.providerSpecialty = providerSpecialty;
    }

    public Long getTaxId() {
        return taxId;
    }

    public void setTaxId(Long taxId) {
        this.taxId = taxId;
    }

    public String getTaxonomy() {
        return taxonomy;
    }

    public void setTaxonomy(String taxonomy) {
        this.taxonomy = taxonomy;
    }

    

    public byte[] getAttachedFile() {
        return attachedFile;
    }

    public void setAttachedFile(byte[] attachedFile) {
        this.setAttachedFile(attachedFile);
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
