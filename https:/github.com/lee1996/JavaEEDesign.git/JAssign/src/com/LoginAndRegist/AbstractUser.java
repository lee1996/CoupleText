package com.LoginAndRegist;

import java.util.HashSet;
import java.util.Set;

/**
 * AbstractUser entity provides the base persistence definition of the User
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractUser implements java.io.Serializable {

	// Fields

	private String username;
	private String password;
	private Set projectManages = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractUser() {
	}

	/** minimal constructor */
	public AbstractUser(String username, String password) {
		this.username = username;
		this.password = password;
	}

	/** full constructor */
	public AbstractUser(String username, String password, Set projectManages) {
		this.username = username;
		this.password = password;
		this.projectManages = projectManages;
	}

	// Property accessors

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set getProjectManages() {
		return this.projectManages;
	}

	public void setProjectManages(Set projectManages) {
		this.projectManages = projectManages;
	}

}