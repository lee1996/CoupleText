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
	public User(String username, String password, String gender) {
		super(username, password, gender);
	}

	/** full constructor */
	public User(String username, String password, String gender, Set notes,
			Set pairsForFemale, Set pairsForMale) {
		super(username, password, gender, notes, pairsForFemale, pairsForMale);
	}

}
