/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.grievance.healthcare.dao;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.grievance.healthcare.model.SignIn;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author sabbani
 */
@Repository("signInDAO")
public class SignInDAOImpl extends HibernateDaoSupport implements SignInDAO{

    @Override
    @Transactional
    public boolean save(SignIn signin){
       boolean status;
       System.out.println("this is from DAO");
        try {

            getHibernateTemplate().save(signin);
            status=true;

        } catch (Exception e) {
            e.printStackTrace();
            status=false;
        }
       System.out.println("this is from DAO end");
       return  status;

}
}
