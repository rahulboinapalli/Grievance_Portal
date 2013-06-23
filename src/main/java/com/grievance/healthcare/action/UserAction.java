package com.grievance.healthcare.action;

import java.util.List;

import com.grievance.healthcare.model.User;
import com.grievance.healthcare.service.UserService;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.opensymphony.xwork2.ActionSupport;


/**
 * Controller class for actions involving
 * a User.
 * @author grievance
 *
 */
public class UserAction extends ActionSupport 
{
    /**
     * 
     */
    private static final long serialVersionUID = 1L;
	private Log logger = LogFactory.getLog(this.getClass());
	private UserService userService ;
	private User user;
	private List<User> users;


   
    /**
     * Handles actions involving saving 
     * a new or changed User object.
     * Creates or updates user instance
     * field.
     * @return success
     */
    public String save()
    {
    	logger.debug("in method save");
    	
        if (user.getId() == null)
        {
            userService.createUser(user);
        }
        else
        {
            userService.updateUser(user);
        }
        return SUCCESS;
    }

    /**
     * Handles delete User action.
     * Deletes user instance field.
     * @return success
     */
    public String delete()
    {
    	logger.debug("in method delete");
        
    	if (user != null && user.getId() != null)
        {
        	logger.debug("User ID is " + user.getId() );
            
        }
    	userService.deleteUser(user);
    	
        return SUCCESS;
    }

    /**
     * Handles list all User objects action.
     * Sets users instance field to all
     * User objects.
     * @return
     */
    public String list()
    {
        users = userService.getUsers();
        
        return SUCCESS;
        
    }

    @Override
    public String input()
    {
    	logger.debug("in method input");
    	
    	if (user != null && user.getId() != null)
        {
        	logger.debug("User ID is " + user.getId() );
            user = userService.getUser(user.getId());
        }
        return INPUT;
    }

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

 
}
