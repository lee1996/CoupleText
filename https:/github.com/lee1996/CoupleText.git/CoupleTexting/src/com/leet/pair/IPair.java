package com.leet.pair;

import com.leet.user.User;

public interface IPair {
	void savePair(User user1,User user2);//保存新的一对
	boolean MorFExist(String username);//查询是否有一方已经存在于数据库中，防止一方脚踏两只船
	String lovername(String username);//根据姓名查找另一半
}
