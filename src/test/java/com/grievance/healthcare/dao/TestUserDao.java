package com.grievance.healthcare.dao;

import static org.junit.Assert.*;


import java.util.GregorianCalendar;
import java.util.List;

import com.grievance.healthcare.model.User;

import org.apache.log4j.Logger;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;





@ContextConfiguration(locations={"classpath:applicationContextTest.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class TestUserDao {
	
	@Autowired
	UserDao userDao ;
	
	private static final Logger logger = Logger.getLogger(TestUserDao.class.getName() );
	


	@Test
	public void testFindAll() {
		
		List<User> users = userDao.findAll();
		
		logger.info("Number of users found in table is " + users.size() );
		
		assertEquals("Number of users in table is not 10", 10, users.size() );
		
		
	}
	
	@Test
	
	public void testEmailUnverified() {
		
		List<User> users = userDao.findEmailUnverified();
		
		logger.info(users);
		
		logger.info("Number of users with unverified email is " + users.size());
		
		assertEquals("Number of users with unverified email is not 6",  6, users.size());
		
		
		
	}
	
	@Test
	
	public void testEmailUnverifiedWithDate() {
		
		List<User> users = userDao.findEmailUnverifiedWithDate( new GregorianCalendar(2007,12,12) );
		
		logger.info(users);
		
		logger.info("Number of users with unverified email who registered on 12-12-2007 is " + users.size());
		
		assertEquals("Number of users with unverified email who registered on 12-12-2007 is not 1",  1, users.size());

		
		
	}
	
	@Test

	public void testFindByLoginNameAndPassword() {
		
		User user = userDao.findByLoginNameAndPassword("mj", "abc123");
		
		logger.info("User found with loginname of mj and password of abc123 is " + user);
		
		assertNotNull("No user found with loginname of mj and password of abc123. User object is null ", user);
		
		
		
	}
	
	@Test
	
	public void testFindUsersWithEmailingEnding() {
		
		List<User> users = userDao.findUsersWithEmailingEnding(".com");
		
		logger.info(users);
		
		logger.info("Number of users with email ending in .com is " + users.size());
		
		assertEquals("Number of users with email ending in .com is not 8",  8, users.size());
		
		
		
		
	}
	
	@Test
	
	public void testFindMaxUsersFromStart() {
		
		List<User> users = userDao.findMaxUsersFromStart(0, 5);
		
		logger.info(users);
		
		logger.info("Number of User objects returned is " + users.size());
		
		assertEquals("Number of User objects returned is not 5 ", 5, users.size());
		
		
		
		
	}
	
	

}
