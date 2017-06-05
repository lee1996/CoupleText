package com.project;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * AbstractProjectInfo entity provides the base persistence definition of the
 * ProjectInfo entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractProjectInfo  implements
		java.io.Serializable {

	// Fields

	private String proId;
	private String proName;
	private String proProperty;
	private String proType;
	private Double proCost;
	private String proState;
	private Date proStartTime;
	private Date proFinishTime;
	private Double proRestCost;
	private Set projectManages = new HashSet(0);
	private Set companies = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractProjectInfo() {
	}

	/** minimal constructor */
	public AbstractProjectInfo(String proId, String proName,
			String proProperty, String proType, Double proCost,
			String proState, Date proStartTime, Date proFinishTime,
			Double proRestCost) {
		this.proId = proId;
		this.proName = proName;
		this.proProperty = proProperty;
		this.proType = proType;
		this.proCost = proCost;
		this.proState = proState;
		this.proStartTime = proStartTime;
		this.proFinishTime = proFinishTime;
		this.proRestCost = proRestCost;
	}

	/** full constructor */
	public AbstractProjectInfo(String proId, String proName,
			String proProperty, String proType, Double proCost,
			String proState, Date proStartTime, Date proFinishTime,
			Double proRestCost, Set projectManages, Set companies) {
		this.proId = proId;
		this.proName = proName;
		this.proProperty = proProperty;
		this.proType = proType;
		this.proCost = proCost;
		this.proState = proState;
		this.proStartTime = proStartTime;
		this.proFinishTime = proFinishTime;
		this.proRestCost = proRestCost;
		this.projectManages = projectManages;
		this.companies = companies;
	}

	// Property accessors

	public String getProId() {
		return this.proId;
	}

	public void setProId(String proId) {
		this.proId = proId;
	}

	public String getProName() {
		return this.proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getProProperty() {
		return this.proProperty;
	}

	public void setProProperty(String proProperty) {
		this.proProperty = proProperty;
	}

	public String getProType() {
		return this.proType;
	}

	public void setProType(String proType) {
		this.proType = proType;
	}

	public double getProCost() {
		return this.proCost;
	}

	public void setProCost(Double proCost) {
		this.proCost = proCost;
	}

	public String getProState() {
		return this.proState;
	}

	public void setProState(String proState) {
		this.proState = proState;
	}

	public Date getProStartTime() {
		return this.proStartTime;
	}

	public void setProStartTime(Date proStartTime) {
		this.proStartTime = proStartTime;
	}

	public Date getProFinishTime() {
		return this.proFinishTime;
	}

	public void setProFinishTime(Date proFinishTime) {
		this.proFinishTime = proFinishTime;
	}

	public double getProRestCost() {
		return this.proRestCost;
	}

	public void setProRestCost(Double proRestCost) {
		this.proRestCost = proRestCost;
	}

	public Set getProjectManages() {
		return this.projectManages;
	}

	public void setProjectManages(Set projectManages) {
		this.projectManages = projectManages;
	}

	public Set getCompanies() {
		return this.companies;
	}

	public void setCompanies(Set companies) {
		this.companies = companies;
	}

}