package com.flowerforest.backend.work.action;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LogoutAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -629305548596495143L;

	public LogoutAction() {
		// TODO Auto-generated constructor stub
	}

	public String logout() {
		Map session = ActionContext.getContext().getSession();
		session.remove("logged-in");
		session.remove("login");
		return SUCCESS;
	}

}
