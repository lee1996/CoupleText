package com.contract;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.company.Company;

public class ContractImpl implements IContract{
	private static final ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
	private static final SessionFactory sessionFactroy=(SessionFactory) ctx.getBean("sessionFactory");
	@Override
	public void AddContract(ProjectManage proMan) {
		Session session=sessionFactroy.openSession();
		Transaction transaction=session.beginTransaction();
		session.save(proMan);
		transaction.commit();
		session.close();
		
	}

	@Override
	public void DeleteContract(String con_id) {
		Session session=sessionFactroy.openSession();
		Transaction transaction=session.beginTransaction();
		ProjectManage proMan=(ProjectManage) session.get(ProjectManage.class, con_id);
		session.delete(proMan);
		transaction.commit();
		session.close();
		
	}

	@Override
	public ProjectManage QueryContract(String con_id) {
		Session session=sessionFactroy.openSession();
		ProjectManage result=(ProjectManage) session.get(ProjectManage.class, con_id);
		session.close();
		return result;
	}

	@Override
	public void UpdateContract(ProjectManage proMan) {
		Session session=sessionFactroy.openSession();
		Transaction transaction=session.beginTransaction();
		ProjectManage pro=(ProjectManage) session.get(ProjectManage.class, proMan.getContractId());
		pro=proMan;
		session.merge(pro);
		transaction.commit();
		session.close();
		
	}

	@Override
	public List<String> VagueQueryCon(String con_id,String username) {
		Session session=sessionFactroy.openSession();
		String hql="select contractId from ProjectManage pro where pro.contractId like :conid and pro.user.username=:usename";
		Query query=session.createQuery(hql);
		query.setString("conid","%"+con_id+"%");
		query.setString("usename",username );
		List<String> list=query.list();
		session.close();
		return list;
	}

	

}
