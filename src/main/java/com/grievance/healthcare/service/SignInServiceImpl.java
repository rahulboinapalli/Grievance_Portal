/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.grievance.healthcare.service;

import com.grievance.healthcare.dao.SignInDAO;
import com.grievance.healthcare.dao.SignInDAOImpl;
import com.grievance.healthcare.model.SignIn;
import com.grievance.healthcare.to.SignInTO;


/**
 *
 * @author sabbani
 */
public class SignInServiceImpl implements SignInService{
   private  SignInDAO signInDAO;

    public SignInDAO getSignInDAO() {
        return signInDAO;
    }

    public void setSignInDAO(SignInDAO signInDAO) {
        this.signInDAO = signInDAO;
    }
    @Override
    public Boolean saveSignInDetails(SignInTO  signInTO) {
        SignIn signin=null;
       System.out.println("this is from service");
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

             System.out.println(signInTO.getFirstName());
             Boolean flag = signInDAO.save(signin);
             System.out.println("this is from service end::-"+flag);
            return flag;
       }
       catch(Exception e){
         e.printStackTrace();
         return  false;
       }
    
    }

}
