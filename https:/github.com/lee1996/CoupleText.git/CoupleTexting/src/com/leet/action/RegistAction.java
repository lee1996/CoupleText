package com.leet.action;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.leet.user.User;
import com.leet.user.UserImpl;
import com.opensymphony.xwork2.ActionSupport;

public class RegistAction extends ActionSupport{
	private String username;
	private String password;
	private String pwdAgain;
	private String gender;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPwdAgain() {
		return pwdAgain;
	}
	public void setPwdAgain(String pwdAgain) {
		this.pwdAgain = pwdAgain;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	@Override
	public String execute() throws Exception {
		ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
		UserImpl userImpl=(UserImpl) ctx.getBean(UserImpl.class);
		User user=new User(username,password,gender);
		userImpl.saveUser(user);
		return SUCCESS;
	}
	@Override
	public void validate() {
		ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
		UserImpl userImpl=(UserImpl) ctx.getBean(UserImpl.class);
		if(!(password.equals(pwdAgain))){
			this.addFieldError("registError", "密码不一致！");
		}else if(userImpl.isExistUser(username)){
			this.addFieldError("registError","用户已经存在！");
		}
	}
}
