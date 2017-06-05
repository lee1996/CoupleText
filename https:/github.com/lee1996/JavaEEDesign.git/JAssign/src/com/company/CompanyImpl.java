package com.company;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class CompanyImpl implements ICompany{
	private static final ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
	private static final SessionFactory sessionFactroy=(SessionFactory) ctx.getBean("sessionFactory");
	@Override
	public void AddCompany(Company company) {
		Session session=sessionFactroy.openSession();
		Transaction transaction=session.beginTransaction();
		session.save(company);
		transaction.commit();
		session.close();
		
	}
	@Override
	public void DeleteCompany(String com_id) {
		Session session=sessionFactroy.openSession();
		Transaction transaction=session.beginTransaction();
		Company company=(Company) session.get(Company.class, com_id);
		session.delete(company);
		transaction.commit();
		session.close();
	}

	@Override
	public Company QueryCompany(String com_id) {
		Session session=sessionFactroy.openSession();
		String hql="from Company where comId=?";
		Query query=session.createQuery(hql);
		query.setParameter(0, com_id);
		List<Company> list=query.list();
		Company result=new Company();
		for(Company company : list){
			 result=company;
		}
		session.close();
		return result;
	}

	@Override
	public void UpdateCompany(Company company) {
		Session session=sessionFactroy.openSession();
		Transaction transaction=session.beginTransaction();
		Company com=(Company) session.get(Company.class, company.getComId());
		com=company;
		session.merge(com);
		transaction.commit();
		session.close();
		
	}

}
