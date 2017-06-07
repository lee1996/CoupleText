package com.leet.action;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
	private String email;
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
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String execute() throws Exception {
		ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
		UserImpl userImpl=(UserImpl) ctx.getBean(UserImpl.class);
		User user=new User(username,password,gender,email);
		userImpl.saveUser(user);
		return SUCCESS;
	}
	@Override
	public void validate() {
		ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
		UserImpl userImpl=(UserImpl) ctx.getBean(UserImpl.class);
		String check = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
		Pattern pEmail = Pattern.compile(check);
		Matcher mEmail = pEmail.matcher(email);
		if(!(password.equals(pwdAgain))){
			this.addFieldError("registError", "密码不一致！");
		}else if(userImpl.isExistUser(username)){
			this.addFieldError("registError","用户已经存在！");
		}else if(!mEmail.matches()){
			this.addFieldError("registError", "邮箱格式错误！");
		}
	}
}
