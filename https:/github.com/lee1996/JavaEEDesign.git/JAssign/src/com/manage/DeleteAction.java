package com.manage;

import java.util.Date;
import java.util.Map;
import java.util.Set;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.company.Company;
import com.company.CompanyImpl;
import com.contract.ContractImpl;
import com.contract.ProjectManage;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.project.ProjectImpl;
import com.project.ProjectInfo;

public class DeleteAction extends ActionSupport{
	private String project_id;
	private String project_name;
	private String project_property;
	private String project_type;
	private Double project_cost;
	private String project_state;
	private Date project_start_time;
	private Date project_finish_time;
	private Double project_rest_cost;
	private String contract_id;
	private String username;
	private String company_id;
	private String company_name;
	private String company_property;
	private String contact_name;
	private String contact_number;
	private String contact_email;
	public String getProject_id() {
		return project_id;
	}
	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}
	public String getProject_name() {
		return project_name;
	}
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}
	public String getProject_property() {
		return project_property;
	}
	public void setProject_property(String project_property) {
		this.project_property = project_property;
	}
	public String getProject_type() {
		return project_type;
	}
	public void setProject_type(String project_type) {
		this.project_type = project_type;
	}
	public Double getProject_cost() {
		return project_cost;
	}
	public void setProject_cost(Double project_cost) {
		this.project_cost = project_cost;
	}
	public String getProject_state() {
		return project_state;
	}
	public void setProject_state(String project_state) {
		this.project_state = project_state;
	}
	public Date getProject_start_time() {
		return project_start_time;
	}
	public void setProject_start_time(Date project_start_time) {
		this.project_start_time = project_start_time;
	}
	public Date getProject_finish_time() {
		return project_finish_time;
	}
	public void setProject_finish_time(Date project_finish_time) {
		this.project_finish_time = project_finish_time;
	}
	public Double getProject_rest_cost() {
		return project_rest_cost;
	}
	public void setProject_rest_cost(Double project_rest_cost) {
		this.project_rest_cost = project_rest_cost;
	}
	public String getContract_id() {
		return contract_id;
	}
	public void setContract_id(String contract_id) {
		this.contract_id = contract_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getCompany_id() {
		return company_id;
	}
	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getCompany_property() {
		return company_property;
	}
	public void setCompany_property(String company_property) {
		this.company_property = company_property;
	}
	public String getContact_name() {
		return contact_name;
	}
	public void setContact_name(String contact_name) {
		this.contact_name = contact_name;
	}
	public String getContact_number() {
		return contact_number;
	}
	public void setContact_number(String contact_number) {
		this.contact_number = contact_number;
	}
	public String getContact_email() {
		return contact_email;
	}
	public void setContact_email(String contact_email) {
		this.contact_email = contact_email;
	}
	@Override
	public String execute() throws Exception {
		
		System.out.println("项目名为"+project_name);
		ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
		ContractImpl conImpl=(ContractImpl)ctx.getBean(ContractImpl.class);
		ProjectImpl proImpl=(ProjectImpl)ctx.getBean(ProjectImpl.class);
		CompanyImpl comImpl=(CompanyImpl)ctx.getBean(CompanyImpl.class);
		ProjectManage proMan=conImpl.QueryContract(contract_id);
		System.out.println("合同编号为"+contract_id);
		ProjectInfo proInfo=proMan.getProjectInfo();
		Set<Company> companies=proInfo.getCompanies();
		if(companies.size()==0){
			conImpl.DeleteContract(contract_id);
			proImpl.DeleteProjectInfo(proInfo.getProId());
		}else{
			for(Company company : companies){
				comImpl.DeleteCompany(company.getComId());
			}
			conImpl.DeleteContract(contract_id);
			proImpl.DeleteProjectInfo(proInfo.getProId());
		}
		return SUCCESS;
	}
}

