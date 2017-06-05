package com.company;

public interface ICompany {
	void AddCompany(Company company);
	void DeleteCompany(String com_id);
	Company QueryCompany(String com_id);
	void UpdateCompany(Company company);
}
