package com.leet.action;


import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.leet.note.NoteImpl;
import com.opensymphony.xwork2.ActionSupport;

public class SearchAction extends ActionSupport{
	private String title;
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public void mySearch() throws Exception{
		title=URLDecoder.decode(title,"utf-8");
		title=title.substring(1, title.length()-1);
		HttpServletRequest request=ServletActionContext.getRequest();
		Cookie[] cookies=request.getCookies();
		String user=null;
		for(Cookie cookie : cookies){
			if(URLDecoder.decode(cookie.getName(), "UTF-8").equals("username")){
				 user=URLDecoder.decode(cookie.getValue(), "UTF-8");
				 break;
			}
		}
		System.out.println("用户名是"+user);
		ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		System.out.println("json传过来的标题是"+title);
		NoteImpl noteImpl=ctx.getBean(NoteImpl.class);
		List<String> list=noteImpl.queryNote(title, user);
		
		
		JSONArray jsonArray=JSONArray.fromObject(list);
		response.getWriter().write(jsonArray.toString());
	}

}
