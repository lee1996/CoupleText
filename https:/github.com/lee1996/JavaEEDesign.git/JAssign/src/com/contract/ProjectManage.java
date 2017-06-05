package com.contract;

import com.LoginAndRegist.User;
import com.project.ProjectInfo;

/**
 * ProjectManage entity. @author MyEclipse Persistence Tools
 */
public class ProjectManage extends AbstractProjectManage implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public ProjectManage() {
	}

	/** full constructor */
	public ProjectManage(String contractId, ProjectInfo projectInfo, User user) {
		super(contractId, projectInfo, user);
	}

}
