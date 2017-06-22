package com.leet.user;

import java.util.List;

public interface IUser {
	void saveUser(User user);//保存新用户
	boolean isExistUser(String username);//查询是否存在用户所输入的另一半
	boolean isExistUser(String username,String gender);//根据用户名，性别判断是否存在该用户
	String getEmail(String username,String gender);//根据用户名，性别取得邮件地址
	void updateUser(String username,String password);//更新用户密码
	List<User> QueryUser(); //查询所有用户
	boolean isPWDCorrect(String username,String password);//判断用户的密码是否正确
	User querySingleUser(String username);//根据用户名查找用户并返回用户实例
	boolean isExistEmail(String email);//判断邮箱是否已经注册过
}
