/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.grievance.healthcare.service;

import com.grievance.healthcare.dao.SignInDAO;
import com.grievance.healthcare.model.SignIn;
import com.grievance.healthcare.to.SignInTO;


/**
 *
 * @author sabbani
 */
public class SignInServiceImpl implements SignInService{

    private  SignInDAO signInDAO;

     /*
     * used to save the sign in details.
     * @param signInTO
     * @return Boolean 
     *  
     */
    @Override
    public Boolean saveSignInDetails(SignInTO  signInTO) {
       System.out.println("this is from service");
       SignIn signin=null;
       try{
             signin=new SignIn();
             signin.setFirstName(signInTO.getFirstName());
             signin.setBirthday(signInTO.getBirthday());
             signin.setCity(signInTO.getCity());
             signin.setContryRegion(signInTO.getContryRegion());
             signin.setEmailAddress(signInTO.getEmailAddress());
             signin.setGender(signInTO.getGender());
             signin.setLanguege(signInTO.getLanguege());
             signin.setLastName(signInTO.getLastName());
             signin.setLoginName(signInTO.getLoginName());
             signin.setPassword(signInTO.getPassword());
             signin.setRepeatEmail(signInTO.getRepeatEmail());
             signin.setRepeatPassword(signInTO.getRepeatPassword());
             signin.setSkypeName(signInTO.getSkypeName());
             signin.setSkypeNameHelper(signInTO.getSkypeNameHelper());
             signin.setSkypePassword(signInTO.getSkypePassword());
             /** calls dao save method, returns status*/
             return signInDAO.save(signin);
             
       }
       catch(Exception e){
         System.out.println("exception occured in SignInServiceImpl saveSignInDetails method ::" + e.getMessage());
         return  false;
       }
    
    }

    /**
     * @return the signInDAO
     **/
    public SignInDAO getSignInDAO() {
        return signInDAO;
    }
    /**
     * @param signInDAO the signInDAO to set
     */
    public void setSignInDAO(SignInDAO signInDAO) {
        this.signInDAO = signInDAO;
    }

}
