package com.LoginAndRegist;

import java.util.List;

public interface IUser {
	void SaveUser(String username,String password);
	List<User> QueryUser();
	void ChangeUser(String username,String password);
	boolean IsUser(String username,String password);
	boolean ExistUser(String username);
	void UpdateUser(String username,String password);
	User QuerySingleUser(String username);
}
