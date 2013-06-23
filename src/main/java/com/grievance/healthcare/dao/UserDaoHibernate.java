package com.grievance.healthcare.dao;

import java.util.Calendar;

import java.util.List;


import com.grievance.healthcare.model.User;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.MatchMode;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Implements behaviors that enable 
 * interaction between UserService 
 * and the data repository.
 * See pages 310-315 of Spring Recipes (2008)
 * for explanation of using the
 * HibernateDaoSupport class.
 * @author grievance
 *
 */
@Repository("userDao")
public class UserDaoHibernate extends HibernateDaoSupport implements UserDao {

	@Transactional
	public void create(User user) {
		
		getHibernateTemplate().saveOrUpdate(user);

	}

	@Transactional
	public void delete(User user) {

        getHibernateTemplate().delete(user);

	}

	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true)
	public List<User> findAll() {
		
		return getHibernateTemplate().find("from User");
		
	}

	@Transactional
	public User findById(Long userId) {

		return (User) getHibernateTemplate().get(User.class, userId);
		
	}
	

	@Transactional
	public void update(User user) {
		
		getHibernateTemplate().saveOrUpdate(user);

	}

	@Transactional
	public User findByLoginName(String loginName) {
		
		Query query = getSession().getNamedQuery("user.findByLoginName");
		
		query.setString("name", loginName);
		
		User user = (User) query.uniqueResult();
		
		return user;	
		
	}

	@Transactional
	public int deleteAll() {
		
		String hql = "delete User";
		
		Query query = getSession().createQuery(hql);
		
		int rowCount = query.executeUpdate();
		
		return rowCount;	
		
	}

	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true)
	public List<User> findEmailUnverified() {
		
		User user = new User();
		user.setVerified(Boolean.FALSE);
		
		
		Example example = Example.create(user);
		
		DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
		
		criteria.add(example);
		
		return getHibernateTemplate().findByCriteria(criteria);
		

		
//		Criteria criteria = getSession().createCriteria(User.class);
//		criteria.add(example);
//		return criteria.list();
		
	}

	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true)
	public List<User> findEmailUnverifiedWithDate(Calendar date) {
		
		User user = new User();
		
		user.setVerified(Boolean.FALSE);
		
		user.setRegistrationDate(date);
		
        Example example = Example.create(user);
		
		DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
		
		criteria.add(example);
		
		return getHibernateTemplate().findByCriteria(criteria);
		
		
	}

	@Transactional
	public User findByLoginNameAndPassword(String loginName, String password) {
		
		User user = new User();
		
		user.setLoginname(loginName);
		user.setPassword(password);
		
		Example example = Example.create(user);
		
		Criteria criteria = getSession().createCriteria(User.class);
		
		criteria.add(example);
		
		User u = (User) criteria.uniqueResult();
		
		return u;
	
	}

	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true)
	public List<User> findUsersWithEmailingEnding(String emailEnding) {
		
		User user = new User();
		
		user.setEmailAddress(emailEnding);
		
        Example example = Example.create(user);
        
        example.enableLike(MatchMode.END);
        
		DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
		
		criteria.add(example);
		
		return getHibernateTemplate().findByCriteria(criteria);
	}

	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true)
	public List<User> findMaxUsersFromStart(int startRow, int maxRows) {
			
		DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
			
		return getHibernateTemplate().findByCriteria(criteria, startRow, maxRows);
		
	}

}
