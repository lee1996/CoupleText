package com.leet.pair;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.leet.user.User;

public class PairImpl implements IPair{
	private static final ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
	private static final SessionFactory sessionFactory=(SessionFactory) ctx.getBean("sessionFactory");
	@Override
	public void savePair(User user1, User user2) {
		Session session=sessionFactory.openSession();
		Pair pair=new Pair(user1,user2);
		session.save(pair);
		Transaction transactin=session.beginTransaction();
		transactin.commit();
		session.close();
	}

	@Override
	public boolean MorFExist(String username) {
		Session session=sessionFactory.openSession();
		String hql="select id from Pair pair where pair.userByFemale.username=:femalename or pair.userByMale.username=:malename";
		Query query=session.createQuery(hql);
		query.setString("femalename",username);
		query.setString("malename",username);
		@SuppressWarnings("unchecked")
		List<Integer> list=query.list();
		if(list.size()==0){
			session.close();
			return false;//不存在该用户
		}
		session.close();
		return true;//存在
	}

	@Override
	public String lovername(String username) {
		Session session=sessionFactory.openSession();
		String hql1="select userByFemale from Pair pair where  pair.userByMale.username=:malename";
		String hql2="select userByMale from Pair pair where  pair.userByFemale.username=:femalename";
		Query query1=session.createQuery(hql1);
		Query query2=session.createQuery(hql2);
		query2.setString("femalename",username);
		query1.setString("malename",username);
		List<User> list1=query1.list();
		List<User> list2=query2.list();
		session.close();
		if(list1.size()==0){
			if(list2.size()==0){
				return "";
			}else{
				return list2.get(0).getUsername();
			}
		}else{
			return list1.get(0).getUsername();
		}
		
	}

}
