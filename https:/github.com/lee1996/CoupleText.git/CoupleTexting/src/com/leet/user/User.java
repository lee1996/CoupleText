package com.leet.user;

import java.util.Set;

/**
 * User entity. @author MyEclipse Persistence Tools
 */
public class User extends AbstractUser implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String username, String password, String gender,String email) {
		super(username, password, gender,email);
	}

	/** full constructor */
	public User(String username, String password, String gender,String email, Set notes,
			Set pairsForFemale, Set pairsForMale) {
		super(username, password, gender,email, notes, pairsForFemale, pairsForMale);
	}

}
