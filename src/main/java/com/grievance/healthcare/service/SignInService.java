/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.grievance.healthcare.service;

import com.grievance.healthcare.to.SignInTO;

/**
 *
 * @author sabbani
 */
public interface SignInService {
    public Boolean saveSignInDetails(SignInTO signInTO);
}
