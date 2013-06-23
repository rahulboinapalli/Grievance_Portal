package com.grievance.healthcare.service;

import java.util.List;

import com.grievance.healthcare.model.User;

/**
 * Specifies behaviors required
 * by UserService classes.  The 
 * UserService class is typically
 * used by the UserAction to provide
 * business services.
 * @author grievance
 *
 */
public interface UserService {
	
	/**
	 * Get all User objects from 
	 * the data repository.
	 * @return Collection of User objects.
	 */
	public List<User> getUsers() ;
	
	/**
	 * Create a User in the repository
	 * using the state of the provided
	 * User object.  Set the Id field
	 * of the provided User object
	 * to the User record's Id value.
	 * @param user User object with state
	 * to replicate in the data repository.
	 */
	public void createUser(User user);
	
	/**
	 * Deletes all User objects from repository.
	 * @return number of User objects deleted.
	 */
	public int deleteAllUsers();

	/**
	 * Find the User record in the repository
	 * that has the same Id value as the User
	 * object provided.  Update that User record
	 * with the state of the provided User
	 * object.
	 * @param user User object to update.
	 */
	public void updateUser(User user);

	/**
	 * Find the User record in the repository
	 * that has the same Id value as the User
	 * object provided and delete that User
	 * record.
	 * @param user User object to delete.
	 */
	public void deleteUser(User user);

	/**
	 * Find the User record in the repository
	 * that has the same Id value as provided 
	 * and create a User object using that 
	 * record's column values.
	 * @param id Id value of User record.
	 * @return User object or null if no User object
	 * was found with matching Id value.
	 */
	public User getUser(Long id);

}
