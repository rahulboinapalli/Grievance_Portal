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
 * @author home
 */

@Entity
@Table(name="signin_details")
public class SignIn implements Serializable {
    private static final long serialVersionUID = 1L;

    private  String loginName;
    private  String password;
    private  String firstName;
    private  String lastName;
    private  String emailAddress;
    private  String repeatEmail;
    private  String birthday;

    private  String gender;
    private  String city;
    private  String contryRegion;
    private  String languege;
    private  String skypeName;
    private  String skypePassword;
    private  String repeatPassword;
    private  String skypeNameHelper;
    private  Integer signId;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "signin_id")
    @Id
    public Integer getSignId() {
        return signId;
    }

    public void setSignId(Integer signId) {
        this.signId = signId;
    }
    @Column(name ="birthday")
    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }
 @Column(name = "city")
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
 @Column(name = "country_region")
    public String getContryRegion() {
        return contryRegion;
    }

    public void setContryRegion(String contryRegion) {
        this.contryRegion = contryRegion;
    }
 @Column(name = "email_address")
    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }
 @Column(name = "first_name")
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
 @Column(name = "gender")
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
    @Column(name = "language")
    public String getLanguege() {
        return languege;
    }

    public void setLanguege(String languege) {
        this.languege = languege;
    }
 @Column(name = "last_name")
    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    @Column(name = "login_name")
    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    @Column(name = "repeat_email")
    public String getRepeatEmail() {
        return repeatEmail;
    }

    public void setRepeatEmail(String repeatEmail) {
        this.repeatEmail = repeatEmail;
    }
    @Column(name = "repeat_password")
    public String getRepeatPassword() {
        return repeatPassword;
    }

    public void setRepeatPassword(String repeatPassword) {
        this.repeatPassword = repeatPassword;
    }
 @Column(name = "skype_name")
    public String getSkypeName() {
        return skypeName;
    }

    public void setSkypeName(String skypeName) {
        this.skypeName = skypeName;
    }
 @Column(name = "skypeName_helper")
    public String getSkypeNameHelper() {
        return skypeNameHelper;
    }

    public void setSkypeNameHelper(String skypeNameHelper) {
        this.skypeNameHelper = skypeNameHelper;
    }
 @Column(name = "skype_password")
    public String getSkypePassword() {
        return skypePassword;
    }

    public void setSkypePassword(String skypePassword) {
        this.skypePassword = skypePassword;
    }




}
