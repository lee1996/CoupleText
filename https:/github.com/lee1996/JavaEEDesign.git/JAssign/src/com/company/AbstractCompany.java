package com.company;

import com.project.ProjectInfo;

/**
 * AbstractCompany entity provides the base persistence definition of the
 * Company entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractCompany implements java.io.Serializable {

	// Fields

	private String comId;
	private ProjectInfo projectInfo;
	private String comName;
	private String comProperty;
	private String contactName;
	private String contactNumber;
	private String contactEmail;

	// Constructors

	/** default constructor */
	public AbstractCompany() {
	}

	/** full constructor */
	public AbstractCompany(String comId, ProjectInfo projectInfo,
			String comName, String comProperty, String contactName,
			String contactNumber, String contactEmail) {
		this.comId = comId;
		this.projectInfo = projectInfo;
		this.comName = comName;
		this.comProperty = comProperty;
		this.contactName = contactName;
		this.contactNumber = contactNumber;
		this.contactEmail = contactEmail;
	}

	// Property accessors

	public String getComId() {
		return this.comId;
	}

	public void setComId(String comId) {
		this.comId = comId;
	}

	public ProjectInfo getProjectInfo() {
		return this.projectInfo;
	}

	public void setProjectInfo(ProjectInfo projectInfo) {
		this.projectInfo = projectInfo;
	}

	public String getComName() {
		return this.comName;
	}

	public void setComName(String comName) {
		this.comName = comName;
	}

	public String getComProperty() {
		return this.comProperty;
	}

	public void setComProperty(String comProperty) {
		this.comProperty = comProperty;
	}

	public String getContactName() {
		return this.contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public String getContactNumber() {
		return this.contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getContactEmail() {
		return this.contactEmail;
	}

	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}

}