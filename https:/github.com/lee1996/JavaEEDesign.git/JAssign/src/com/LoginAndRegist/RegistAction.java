package com.LoginAndRegist;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.opensymphony.xwork2.ActionSupport;

public class RegistAction extends ActionSupport{
	private String username;
	private String password;
	private String pwdAgain;
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
	
	@Override
	public String execute() throws Exception {
		if(password.equals(pwdAgain)){
			ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
			UserImpl userImpl=(UserImpl) ctx.getBean("userImpl");
			if(userImpl.ExistUser(username)){
				this.addFieldError("registerror", "账号已经存在!");
				return INPUT;
			}else{
				userImpl.SaveUser(username, password);
				return SUCCESS;
			}
		}else{
			this.addFieldError("registerror", "密码不一致!");
			return INPUT;
		}
	}

}
