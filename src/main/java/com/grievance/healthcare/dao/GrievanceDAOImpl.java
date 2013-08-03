/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.grievance.healthcare.dao;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.grievance.healthcare.model.Grievance;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author sabbani
 */
@Repository("grievanceDAO")
public class GrievanceDAOImpl extends HibernateDaoSupport implements GrievanceDAO{

    @Override
    @Transactional
    public Long saveGrievanceDetails(Grievance grievance) {
        try {

            getHibernateTemplate().save(grievance);
            return Long.valueOf(grievance.getId());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Long.valueOf(0);
    }

}
