package com.leet.action;



import java.net.URLDecoder;
import java.sql.Date;
import java.util.Calendar;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.leet.note.Note;
import com.leet.note.NoteImpl;
import com.leet.user.User;
import com.leet.user.UserImpl;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class AddNoteAction extends ActionSupport implements Action,ServletResponseAware{
	private String title;
	private String content;
	private HttpServletResponse response;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public HttpServletResponse getResponse() {
		return response;
	}
	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}
	@Override
	public String execute() throws Exception {
		Calendar cal=Calendar.getInstance();
		Date date=new Date(cal.get(Calendar.YEAR)-1900,cal.get(Calendar.MONTH),cal.get(Calendar.DAY_OF_MONTH));
		System.out.println(date);
		HttpServletRequest request=ServletActionContext.getRequest();
		Cookie[] cookies=request.getCookies();
		String user=null,pwd=null;
		for(Cookie cookie : cookies){
			if(URLDecoder.decode(cookie.getName(), "UTF-8").equals("username")){
				 user=URLDecoder.decode(cookie.getValue(), "UTF-8");
				 break;
			}
		}
		ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
		UserImpl userImpl=ctx.getBean(UserImpl.class);
		User user2=userImpl.querySingleUser(user);
		NoteImpl noteImpl=ctx.getBean(NoteImpl.class);
		Note note=new Note(user2,title,content,date);
		noteImpl.saveNote(note);
		return SUCCESS;
	}
	@Override
	public void setServletResponse(HttpServletResponse response) {
		// TODO Auto-generated method stub
		this.response=response;
	}

}
