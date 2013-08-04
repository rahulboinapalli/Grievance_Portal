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
import javax.persistence.Table;

/**
 *
 * @author sabbani
 */
@Entity
@Table(name="license_info")
public class LicenseInfo implements Serializable {
    
    private Long licId;
    private String licenseType;
    private Long licenseNum;
    private Timestamp expiryDate;

    public LicenseInfo() {
    }

    public LicenseInfo(String licenseType,Long licenseNum,Timestamp expiryDate){
        this.licenseType = licenseType;
        this.licenseNum = licenseNum;
        this.expiryDate = expiryDate;
    }

    @Column(name = "exp_date", nullable= true )
    public Timestamp getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(Timestamp expiryDate) {
        this.expiryDate = expiryDate;
    }

    @Column(name = "lic_num",  nullable= true)
    public Long getLicenseNum() {
        return licenseNum;
    }

    public void setLicenseNum(Long licenseNum) {
        this.licenseNum = licenseNum;
    }

    @Column(name = "lic_type",  nullable= true)
    public String getLicenseType() {
        return licenseType;
    }

    public void setLicenseType(String licenseType) {
        this.licenseType = licenseType;
    }

    @Id
    @Column(name = "lic_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getLicId() {
        return licId;
    }

    public void setLicId(Long licId) {
        this.licId = licId;
    }
    

}
