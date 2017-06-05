package com.project;



public interface IProject {
	void AddProject(ProjectInfo pro);
	void DeleteProjectInfo(String pro_id);
	ProjectInfo QueryProject(String pro_id);
	void UpdateProject(ProjectInfo pro);
}
