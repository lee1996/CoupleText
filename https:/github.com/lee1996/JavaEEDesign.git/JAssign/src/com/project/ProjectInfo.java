package com.project;

import java.util.Date;
import java.util.Set;

/**
 * ProjectInfo entity. @author MyEclipse Persistence Tools
 */
public class ProjectInfo extends AbstractProjectInfo implements
		java.io.Serializable {

	// Constructors

	/** default constructor */
	public ProjectInfo() {
	}

	/** minimal constructor */
	public ProjectInfo(String proId, String proName, String proProperty,
			String proType, Double proCost, String proState, Date proStartTime,
			Date proFinishTime, Double proRestCost) {
		super(proId, proName, proProperty, proType, proCost, proState,
				proStartTime, proFinishTime, proRestCost);
	}

	/** full constructor */
	public ProjectInfo(String proId, String proName, String proProperty,
			String proType, Double proCost, String proState, Date proStartTime,
			Date proFinishTime, Double proRestCost, Set projectManages,
			Set companies) {
		super(proId, proName, proProperty, proType, proCost, proState,
				proStartTime, proFinishTime, proRestCost, projectManages,
				companies);
	}

}
