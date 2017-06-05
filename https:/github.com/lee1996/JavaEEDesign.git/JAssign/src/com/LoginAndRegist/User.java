package com.LoginAndRegist;

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
	public User(String username, String password) {
		super(username, password);
	}

	/** full constructor */
	public User(String username, String password, Set projectManages) {
		super(username, password, projectManages);
	}

}
