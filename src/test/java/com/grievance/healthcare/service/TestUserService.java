package com.grievance.healthcare.service;

import static org.junit.Assert.*;


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
public class TestUserService {
	
	@Autowired
	UserService userService ;
	
	private static final Logger logger = Logger.getLogger(TestUserService.class.getName() );
	


	@Test
	public void testFindAll() {
		
		List<User> users = userService.getUsers();
		
		logger.info("Number of users found in table is " + users.size() );
		
		assertEquals("Number of users in table is not 10", 10, users.size() );
		
		
		
	}
	
	
	

}
