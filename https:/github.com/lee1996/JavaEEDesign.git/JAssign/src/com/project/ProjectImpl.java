package com.project;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.company.Company;

public class ProjectImpl implements IProject{
	private static final ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
	private static final SessionFactory sessionFactroy=(SessionFactory) ctx.getBean("sessionFactory");
	@Override
	public void AddProject(ProjectInfo pro) {
		Session session=sessionFactroy.openSession();
		Transaction transaction=session.beginTransaction();
		session.save(pro);
		transaction.commit();
		session.close();
		
	}

	@Override
	public void DeleteProjectInfo(String pro_id) {
		Session session=sessionFactroy.openSession();
		Transaction transaction=session.beginTransaction();
		ProjectInfo project=(ProjectInfo) session.get(ProjectInfo.class, pro_id);
		session.delete(project);
		transaction.commit();
		session.close();	
	}

	@Override
	public ProjectInfo QueryProject(String pro_id) {
		Session session=sessionFactroy.openSession();
		String hql="from ProjectInfo pro where pro.proId=?";
		Query query=session.createQuery(hql);
		query.setString(0,pro_id);
		List<ProjectInfo> list=query.list();
		ProjectInfo result=new ProjectInfo();
		for(ProjectInfo company : list){
			 result=company;
		}
		session.close();
		return result;
	}

	@Override
	public void UpdateProject(ProjectInfo pro) {
		Session session=sessionFactroy.openSession();
		Transaction transaction=session.beginTransaction();
		ProjectInfo com=(ProjectInfo) session.get(ProjectInfo.class, pro.getProId());
		com=pro;
		session.merge(com);
		transaction.commit();
		session.close();
	}

}
