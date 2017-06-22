package com.leet.user;





import java.util.List;

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
	public void saveUser(User user) {
		Session session=sessionFactroy.openSession();
		Transaction transaction=session.beginTransaction();
		session.save(user);
		transaction.commit();
		session.close();
		
	}

	@Override
	public boolean isExistUser(String username) {
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
	public boolean isExistUser(String username,String gender) {
		UserImpl userimpl=new UserImpl();
		Session session=sessionFactroy.openSession();
		List<User> users=userimpl.QueryUser();
		for(User user : users){
			if(user.getUsername().equals(username)&&user.getGender().equals(gender)){
				session.close();
				return true;
			}
		}
		session.close();
		return false;
	}
	@Override
	public void updateUser(String username, String password) {
		Session session=sessionFactroy.openSession();
		Transaction transaction=session.beginTransaction();
		User user=(User) session.get(User.class,username);
		user.setPassword(password);
		session.update(user);
		transaction.commit();
		session.close();
		
	}

	@Override
	public List<com.leet.user.User> QueryUser() {
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
	public boolean isPWDCorrect(String username, String password) {
		Session session=sessionFactroy.openSession();
		User user=(User) session.get(User.class,username);
		if(!(user.getPassword().equals(password))){
			session.close();
			return false;
		}else{
			session.close();
			return true;
		}
		
	}

	@Override
	public User querySingleUser(String username) {
		Session session=sessionFactroy.openSession();
		User user=(User) session.get(User.class, username);
		session.close();
		return user;
	}

	@Override
	public String getEmail(String username, String gender) {
		Session session=sessionFactroy.openSession();
		String email=null;
		UserImpl userimpl=new UserImpl();
		List<User> users=userimpl.QueryUser();
		for(User user : users){
			if(user.getUsername().equals(username)&&user.getGender().equals(gender)){
				email=user.getEmail();
				session.close();
				return email;
			}
		}
		session.close();
		return email;
	}

	@Override
	public boolean isExistEmail(String email) {
		Session session=sessionFactroy.openSession();
		String hql="select username from User user where user.email=:email";
		Query query=session.createQuery(hql);
		query.setString("email", email);
		List<String> list=query.list();
		if(list.size()==0){
			return false;
		}
		return true;
	}

}
