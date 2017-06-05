package com.LoginAndRegist;



import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;








import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.Validation;

public class LoginAction extends ActionSupport implements Action,ServletResponseAware{
	private String username;
	private String password;
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
	
	public HttpServletResponse getResponse() {
		return response;
	}
	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}
	@Override
	public String execute() throws Exception {
		
		ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
		UserImpl userImpl=(UserImpl) ctx.getBean("userImpl");
		if(userImpl.IsUser(username, password)==false){
			this.addFieldError("error", "账号或者密码错误!");
			return INPUT;
		}else{
			ActionContext atx=ActionContext.getContext();
			Cookie c=new Cookie(URLEncoder.encode("username", "UTF-8"),URLEncoder.encode(username, "UTF-8"));	 
			c.setMaxAge(60*60);
			response.addCookie(c);
			c=new Cookie(URLEncoder.encode("password", "UTF-8"),URLEncoder.encode(password, "UTF-8"));	 
			c.setMaxAge(60*60);
			response.addCookie(c);
			return SUCCESS;
		}
		
	}
	@Override
	public void setServletResponse(HttpServletResponse response) {
		// TODO Auto-generated method stub
		this.response=response;
	}
	
}
