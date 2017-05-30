package com.leet.note;

import java.util.Date;

import com.leet.user.User;

/**
 * Note entity. @author MyEclipse Persistence Tools
 */
public class Note extends AbstractNote implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Note() {
	}

	/** full constructor */
	public Note(User user, String title, String content, Date date) {
		super(user, title, content, date);
	}

}
