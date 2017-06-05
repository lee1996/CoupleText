package com.company;

import com.project.ProjectInfo;

/**
 * Company entity. @author MyEclipse Persistence Tools
 */
public class Company extends AbstractCompany implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Company() {
	}

	/** full constructor */
	public Company(String comId, ProjectInfo projectInfo, String comName,
			String comProperty, String contactName, String contactNumber,
			String contactEmail) {
		super(comId, projectInfo, comName, comProperty, contactName,
				contactNumber, contactEmail);
	}

}
