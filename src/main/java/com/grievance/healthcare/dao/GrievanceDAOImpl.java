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
public class GrievanceDAOImpl extends HibernateDaoSupport implements GrievanceDAO {

    /*
     * saveGrievanceDetails() used to save Grievance details to DB,
     * @returns Long id
     *
     */
    @Override
    @Transactional
    public Long saveGrievanceDetails(Grievance grievance) {
        System.out.println("saveGrievanceDetails GrievanceDAOImpl::: start ");
        try {
            /**calling save from hibernate template */
            getHibernateTemplate().save(grievance);
            /**returns grievance id */
            return Long.valueOf(grievance.getId());
        } catch (Exception e) {
            System.out.println("exception occured in GrievanceDAOImpl saveGrievanceDetails method ::" + e.getMessage());
        }
        return Long.valueOf(0);
    }
}
