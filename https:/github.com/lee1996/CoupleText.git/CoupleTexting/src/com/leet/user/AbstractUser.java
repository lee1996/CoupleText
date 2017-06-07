package com.leet.user;

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
	private String gender;
	private String email;
	private Set notes = new HashSet(0);
	private Set pairsForFemale = new HashSet(0);
	private Set pairsForMale = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractUser() {
	}

	/** minimal constructor */
	public AbstractUser(String username, String password, String gender,String email) {
		this.username = username;
		this.password = password;
		this.gender = gender;
		this.email=email;
	}

	/** full constructor */
	public AbstractUser(String username, String password, String gender,String email,
			Set notes, Set pairsForFemale, Set pairsForMale) {
		this.username = username;
		this.password = password;
		this.gender = gender;
		this.notes = notes;
		this.email=email;
		this.pairsForFemale = pairsForFemale;
		this.pairsForMale = pairsForMale;
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

	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Set getNotes() {
		return this.notes;
	}

	public void setNotes(Set notes) {
		this.notes = notes;
	}

	public Set getPairsForFemale() {
		return this.pairsForFemale;
	}

	public void setPairsForFemale(Set pairsForFemale) {
		this.pairsForFemale = pairsForFemale;
	}

	public Set getPairsForMale() {
		return this.pairsForMale;
	}

	public void setPairsForMale(Set pairsForMale) {
		this.pairsForMale = pairsForMale;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	

}