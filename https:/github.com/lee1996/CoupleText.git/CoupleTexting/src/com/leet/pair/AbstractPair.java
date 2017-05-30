package com.leet.pair;

import com.leet.user.User;

/**
 * AbstractPair entity provides the base persistence definition of the Pair
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractPair implements java.io.Serializable {

	// Fields

	private Integer id;
	private User userByFemale;
	private User userByMale;

	// Constructors

	/** default constructor */
	public AbstractPair() {
	}

	/** full constructor */
	public AbstractPair(User userByFemale, User userByMale) {
		this.userByFemale = userByFemale;
		this.userByMale = userByMale;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUserByFemale() {
		return this.userByFemale;
	}

	public void setUserByFemale(User userByFemale) {
		this.userByFemale = userByFemale;
	}

	public User getUserByMale() {
		return this.userByMale;
	}

	public void setUserByMale(User userByMale) {
		this.userByMale = userByMale;
	}

}