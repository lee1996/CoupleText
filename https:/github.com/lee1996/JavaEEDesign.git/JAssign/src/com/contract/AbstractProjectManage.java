package com.contract;

import com.LoginAndRegist.User;
import com.project.ProjectInfo;

/**
 * AbstractProjectManage entity provides the base persistence definition of the
 * ProjectManage entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractProjectManage implements java.io.Serializable {

	// Fields

	private String contractId;
	private ProjectInfo projectInfo;
	private User user;

	// Constructors

	/** default constructor */
	public AbstractProjectManage() {
	}

	/** full constructor */
	public AbstractProjectManage(String contractId, ProjectInfo projectInfo,
			User user) {
		this.contractId = contractId;
		this.projectInfo = projectInfo;
		this.user = user;
	}

	// Property accessors

	public String getContractId() {
		return this.contractId;
	}

	public void setContractId(String contractId) {
		this.contractId = contractId;
	}

	public ProjectInfo getProjectInfo() {
		return this.projectInfo;
	}

	public void setProjectInfo(ProjectInfo projectInfo) {
		this.projectInfo = projectInfo;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}