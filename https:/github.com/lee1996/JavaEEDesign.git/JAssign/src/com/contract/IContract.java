package com.contract;

import java.util.List;



public interface IContract {
	void AddContract(ProjectManage proMan);
	void DeleteContract(String con_id);
	ProjectManage QueryContract(String con_id);
	void UpdateContract(ProjectManage proMan);
	List<String> VagueQueryCon(String con_id,String username);
}
