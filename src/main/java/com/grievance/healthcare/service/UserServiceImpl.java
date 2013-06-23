package com.grievance.healthcare.service;

import java.util.List;

import com.grievance.healthcare.dao.UserDao;
import com.grievance.healthcare.model.User;

public class UserServiceImpl implements UserService {
	
	private UserDao userDao;
	

	
	public User getUser(Long id) {
		
		return userDao.findById(id);
		
	}

	
	public List<User> getUsers() {
		
		return userDao.findAll();
		
	}
	
	
	public void createUser(User user) {
		
		userDao.create(user);
		
	}
	
	
	public void deleteUser(User user) {
		
		userDao.delete(user);
		
	}
	
	
	public int deleteAllUsers() {
		
		return userDao.deleteAll();
		
	}
	
	
	public void updateUser(User user) {
		
		userDao.update(user);
		
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}









}
