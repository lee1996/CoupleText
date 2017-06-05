package com.leet.action;

import java.sql.Date;
import java.util.Calendar;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.leet.note.Note;
import com.leet.note.NoteImpl;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateAction extends ActionSupport{
	private String title;
	private String content;
	private int note_id;
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
	public int getNote_id() {
		return note_id;
	}
	public void setNote_id(int note_id) {
		this.note_id = note_id;
	}
	@Override
	public String execute() throws Exception {
		ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
		Calendar cal=Calendar.getInstance();
		Date date=new Date(cal.get(Calendar.YEAR)-1900,cal.get(Calendar.MONTH),cal.get(Calendar.DAY_OF_MONTH));
		NoteImpl noteImpl=ctx.getBean(NoteImpl.class);
		Note note=noteImpl.queryViaId(note_id);
		note.setContent(content);
		note.setTitle(title);
		note.setDate(date);
		noteImpl.updateNote(note);
		return SUCCESS;
	}

}
