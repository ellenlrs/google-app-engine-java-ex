package com.flowerforest.backend.work.action;

import java.util.Map;
import java.util.logging.Logger;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7894070292158586842L;
	private static final Logger log = Logger.getLogger(LoginAction.class.getName());
	private String userId;
	private String password;

	public String login() throws Exception {
		if ("admin".equals(userId) && "admin".equals(password)) {
			Map session = ActionContext.getContext().getSession();
			session.put("logged-in", "true");
			session.put("login", "admin");
			return SUCCESS;
		} else {
			return ERROR;
		}
	}

	public LoginAction() {

	}

	public String logout() throws Exception {

		Map session = ActionContext.getContext().getSession();
		session.remove("logged-in");
		session.remove("login");
		return SUCCESS;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
}
