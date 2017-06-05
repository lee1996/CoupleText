package com.LoginAndRegist;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class UserImpl implements IUser{
	private static final ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
	private static final SessionFactory sessionFactroy=(SessionFactory) ctx.getBean("sessionFactory");
	@Override
	public void SaveUser(String username, String password) {
		Session session=sessionFactroy.openSession();
		Transaction transaction=session.beginTransaction();
		User user=new User(username,password);
		session.save(user);
		transaction.commit();
		session.close();	
	}

	@Override
	public List<User> QueryUser() {
		Session session=sessionFactroy.openSession();
		String hql="from User";
		@SuppressWarnings("unchecked")
		List<User> users=session.createQuery(hql).list();
		for(Object user :users){
			System.out.println(user);
		}
		session.close();
		return users;
		
		
	}

	@Override
	public void ChangeUser(String username, String password) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean IsUser(String username, String password) {
		UserImpl userimpl=new UserImpl();
		Session session=sessionFactroy.openSession();
		List<User> users=userimpl.QueryUser();
		for(User user : users){
			if(user.getUsername().equals(username)&&user.getPassword().equals(password)){
				session.close();
				return true;
			}
		}
		session.close();
		return false;
		
		
	}

	@Override
	public boolean ExistUser(String username) {
		UserImpl userimpl=new UserImpl();
		Session session=sessionFactroy.openSession();
		List<User> users=userimpl.QueryUser();
		for(User user : users){
			if(user.getUsername().equals(username)){
				session.close();
				return true;
			}
		}
		session.close();
		return false;
	}

	@Override
	public void UpdateUser(String username, String password) {
		Session session=sessionFactroy.openSession();
		User user=(User) session.get(User.class, username);
		user.setPassword(password);
		Transaction transaction=session.beginTransaction();
		session.update(user);
		transaction.commit();
		session.close();
		
	}

	@Override
	public User QuerySingleUser(String username) {
		Session session=sessionFactroy.openSession();
		User user=(User) session.get(User.class, username);
		Hibernate.initialize(user.getProjectManages());
		session.close();
		return user;
	}

}
