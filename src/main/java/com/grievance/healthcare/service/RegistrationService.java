/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.grievance.healthcare.service;
import com.grievance.healthcare.model.Registration;
import com.grievance.healthcare.to.RegistrationTO;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

/**
 *
 * @author sabbani
 */
public interface RegistrationService {
    
    public String saveRegistration(RegistrationTO to) throws Exception,InvocationTargetException;
    public Object getRegistrationJsonArray();
    public List<Registration> getCuuruntRegistrations() throws Exception;
}
