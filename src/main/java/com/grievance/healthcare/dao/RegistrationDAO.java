/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.grievance.healthcare.dao;
import com.grievance.healthcare.model.Registration;
import java.util.List;
/**
 *
 * @author sabbani
 */
public interface RegistrationDAO {
    public Long saveRegistration(Registration registration);
    public List<Registration> getRegistrationDetailsByStatus();
}
