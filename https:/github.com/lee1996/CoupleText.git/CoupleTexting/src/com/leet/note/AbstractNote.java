package com.leet.note;

import java.util.Date;

import com.leet.user.User;

/**
 * AbstractNote entity provides the base persistence definition of the Note
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractNote implements java.io.Serializable {

	// Fields

	private Integer noteId;
	private User user;
	private String title;
	private String content;
	private Date date;

	// Constructors

	/** default constructor */
	public AbstractNote() {
	}

	/** full constructor */
	public AbstractNote(User user, String title, String content, Date date) {
		this.user = user;
		this.title = title;
		this.content = content;
		this.date = date;
	}

	// Property accessors

	public Integer getNoteId() {
		return this.noteId;
	}

	public void setNoteId(Integer noteId) {
		this.noteId = noteId;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}