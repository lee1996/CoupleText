package com.leet.pair;

public interface IPair {
	void savePair(String maleName,String femalename);//保存新的一对
	boolean MorFExist(String username);//查询是否有一方已经存在于数据库中，防止一方脚踏两只船
}
