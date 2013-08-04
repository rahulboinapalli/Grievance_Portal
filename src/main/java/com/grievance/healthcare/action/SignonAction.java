package com.grievance.healthcare.action;

import com.grievance.healthcare.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
import com.grievance.healthcare.model.User;
import java.util.List;

public class SignonAction extends ActionSupport{

        private UserService userService;
	private User user;
	private List<User> users;

        private String username;
        private String password;

        public void setUsername(String username){
            this.username = username;
        }

        public String getUsername(){
            return this.username;
        }
        
        public void setPassword(String password){
            this.password = password;
        }

        public String getPassword(){
            return this.password;
        }
	public String showPage()
        {
        return SUCCESS;
        }
        public String checkUserCredentials()
        {
        if(username != null &&!username.equalsIgnoreCase("")
                && password != null && !password.equalsIgnoreCase(""))
        {
//            Boolean flag = userService.checkUserCredentials(username, password);
            if(userService.checkUserCredentials(username, password)){
                return SUCCESS;
            }
        }
        return "failure";
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
