/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.grievance.healthcare.model;

import java.io.Serializable;
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
@Table(name="address")
public class Address implements Serializable {

    
    private Long addrId;
    private String street;
    private String city;
    private String aState;
    private String zipcode;
    private Long phone;

    public Address() {
    }

    public Address(String street,String city,String aState,String zipcode,Long phone){
        this.street =street;
        this.city = city;
        this.aState = aState;
        this.zipcode = zipcode;
        this.phone = phone;
    }
    

    @Id
    @Column(name="addr_id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    public Long getAddrId() {
        return addrId;
    }

    public void setAddrId(Long addrId) {
        this.addrId = addrId;
    }

    @Column(name="city", nullable= true)
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Column(name="street", nullable= true)
    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    @Column(name="a_state", nullable= true)
    public String getaState() {
        return aState;
    }

    public void setaState(String aState) {
        this.aState = aState;
    }

    @Column(name="zipcode", nullable= true)
    public String getZipcode() {
        return zipcode;
    }

    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }

    @Column(name="phone", nullable= true)
    public Long getPhone() {
        return phone;
    }

    public void setPhone(Long phone) {
        this.phone = phone;
    }

}
