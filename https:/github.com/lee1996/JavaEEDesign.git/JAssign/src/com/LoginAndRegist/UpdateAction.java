package com.LoginAndRegist;

import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateAction extends ActionSupport implements Action,ServletResponseAware{
	private String username;
	private String pwdupdate;
	private HttpServletResponse response;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPwdupdate() {
		return pwdupdate;
	}
	public void setPwdupdate(String pwdupdate) {
		this.pwdupdate = pwdupdate;
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
//		userImpl.UpdateUser(username, pwdupdate);
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession user=request.getSession();
		String us=(String) user.getAttribute("username");
		System.out.println("更新的用户名是"+us);
		userImpl.UpdateUser(us, pwdupdate);
		ActionContext atx=ActionContext.getContext();
		Cookie c=new Cookie(URLEncoder.encode("password", "UTF-8"),URLEncoder.encode(pwdupdate, "UTF-8"));	 
		c.setMaxAge(60*60);
		response.addCookie(c);
		return SUCCESS;
	}
	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		this.response=arg0;
	}

}
