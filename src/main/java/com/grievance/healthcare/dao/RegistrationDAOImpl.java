/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.grievance.healthcare.dao;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.grievance.healthcare.model.Registration;
import com.grievance.healthcare.utililty.ApplicationConstants;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import org.hibernate.Query;

/**
 *
 * @author sabbani
 */
@Repository("registrationDAO")
public class RegistrationDAOImpl extends HibernateDaoSupport implements RegistrationDAO {

    @Override
    @Transactional
    public Long saveRegistration(Registration registration) throws InvocationTargetException{
        try {
            getHibernateTemplate().save(registration);
            if(registration != null){
                System.out.println("reg id="+registration.getRegId());
                return registration.getRegId();
            } else {
                System.out.println("reg id="+0);
                return Long.valueOf(0);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            throw new InvocationTargetException(e);
        }
        
    }

    @Transactional
    public List<Registration> getRegistrationDetailsByStatus(){
        List<Registration> list = null;
        try{
            Query query = getSession().getNamedQuery("reg.findByStatus");
            query.setString(ApplicationConstants.SUCCESS , ApplicationConstants.CURRUNT);
            list = (List<Registration>) query.list();
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }
}
