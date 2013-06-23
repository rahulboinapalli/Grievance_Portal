package com.grievance.healthcare.dao;

import java.util.Calendar;

import java.util.List;

import com.grievance.healthcare.model.User;

/**
 * Specifies behaviors a UserDao
 * must implement.
 * @author grievance
 *
 */
public interface UserDao {

	/**
	 * Create a User in the repository
	 * using the state of the provided
	 * User object.  Set the Id field
	 * of the provided User object
	 * to the User record's Id value.
	 * @param user User object with state
	 * to replicate in the data repository.
	 */
	 public void create(User user) ;
	
	/**
	 * Get all User objects from 
	 * the data repository.
	 * @return Collection of User objects.
	 */
	 public List<User> findAll();
	 
	/**
	 * Find the User record in the repository
	 * that has the same Id value as provided 
	 * and create a User object using that 
	 * record's column values.
	 * @param id Id value of User record.
	 * @return User object or null if no User object
	 * was found with matching Id value.
	 */
	 public User findById(Long userId);
	 
	/**
	 * Find the User record in the repository
	 * that has the same Id value as the User
	 * object provided.  Update that User record
	 * with the state of the provided User
	 * object.
	 * @param user User object to update.
	 */
	 public void update(User user);
	 
	/**
	 * Find the User record in the repository
	 * that has the same Id value as the User
	 * object provided and delete that User
	 * record.
	 * @param user User object to delete.
	 */
	 public void delete(User user);
	 
	 public User findByLoginName(String loginName);
	 
	 public int deleteAll();
	 
	 public List<User> findEmailUnverified();

	 public List<User> findEmailUnverifiedWithDate(Calendar date);
	 
	 public User findByLoginNameAndPassword(String loginName, String password);
	 
	 public List<User> findUsersWithEmailingEnding(String emailEnding);
	 
	 public List<User> findMaxUsersFromStart(int startRow, int maxRows);
	 
	
}
