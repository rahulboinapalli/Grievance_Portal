/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.grievance.healthcare.dao;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.grievance.healthcare.model.Registration;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author sabbani
 */
@Repository("registrationDAO")
public class RegistrationDAOImpl extends HibernateDaoSupport implements RegistrationDAO {

    /*
     *  @param registration accepts registration details
     *  @return Long id
     *  used to save the registration details to db.
     */
    @Override
    @Transactional
    public Long saveRegistration(Registration registration) throws InvocationTargetException {
        try {
            /** calling save from hibernate template*/
            getHibernateTemplate().save(registration);
            if (registration != null) {
                /** returns registration id*/
                return registration.getRegId();
            } else {
                return Long.valueOf(0);
            }
        } catch (Exception e) {
            System.out.println("exception occured in RegistrationDAOImpl saveRegistration method ::" + e.getMessage());
            throw new InvocationTargetException(e);
        }
    }

    /**
     * 
     * retrieve registration records based on CURRUNT status
     * @returns List of Registration records.
     * 
     **/
    @Override
    @Transactional
    public List<Registration> getRegistrationDetailsByStatus() {
        System.out.println("RegistrationDAOImpl getRegistrationDetailsByStatus::: start");
        List<Registration> results = null;
        try {
 
            Session session=getHibernateTemplate().getSessionFactory().openSession();
            Criteria criteria =session.createCriteria(Registration.class);
            criteria.add(Restrictions.eq("status", "currunt"));
            results = criteria.setMaxResults(10).list();
            
        } catch (Exception e) {
            System.out.println("exception occured in RegistrationDAOImpl getRegistrationDetailsByStatus method ::" + e.getMessage());
        }
        System.out.println("RegistrationDAOImpl getRegistrationDetailsByStatus::: end");
        return results;
    }
}
