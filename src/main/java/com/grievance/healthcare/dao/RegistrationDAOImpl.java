/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.grievance.healthcare.dao;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.grievance.healthcare.model.Registration;

/**
 *
 * @author sabbani
 */
@Repository("registrationDAO")
public class RegistrationDAOImpl extends HibernateDaoSupport implements RegistrationDAO {

    @Override
    @Transactional
    public Long saveRegistration(Registration registration) {
        try {
            getHibernateTemplate().save(registration);
            if(registration != null)
            System.out.println("reg id="+registration.getRegId());
            else
                System.out.println("reg id="+0);
            return Long.valueOf(registration.getRegId());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Long.valueOf(0);
    }

}
