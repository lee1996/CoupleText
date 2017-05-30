package com.leet.action;

import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.leet.user.UserImpl;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements Action,ServletResponseAware{
	private String username;
	private String password;
	private String gender;
	private HttpServletResponse response;
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public HttpServletResponse getResponse() {
		return response;
	}
	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}
	@Override
	public String execute() throws Exception {
		Cookie c=new Cookie(URLEncoder.encode("username", "UTF-8"),URLEncoder.encode(username, "UTF-8"));	 
		c.setMaxAge(60*60);
		response.addCookie(c);
		c=new Cookie(URLEncoder.encode("password", "UTF-8"),URLEncoder.encode(password, "UTF-8"));	 
		c.setMaxAge(60*60);
		response.addCookie(c);
		return SUCCESS;
	}
	
	@Override
	public void validate() {
		ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
		UserImpl userImpl=ctx.getBean(UserImpl.class);
		if(!userImpl.isExistUser(username,gender)){
			this.addFieldError("loginError", "用户不存在！");
		}else if(!userImpl.isPWDCorrect(username, password)){
			this.addFieldError("loginError", "密码不正确！");
		}
	}
	@Override
	public void setServletResponse(HttpServletResponse response) {
		// TODO Auto-generated method stub
		this.response=response;
	}
	
	
}
