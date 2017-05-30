package com.leet.pair;

import com.leet.user.User;

/**
 * Pair entity. @author MyEclipse Persistence Tools
 */
public class Pair extends AbstractPair implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Pair() {
	}

	/** full constructor */
	public Pair(User userByFemale, User userByMale) {
		super(userByFemale, userByMale);
	}

}
