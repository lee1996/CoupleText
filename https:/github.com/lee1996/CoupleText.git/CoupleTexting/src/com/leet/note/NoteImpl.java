package com.leet.note;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class NoteImpl implements INote{
	private static final ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
	private static final SessionFactory sessionFactory=(SessionFactory) ctx.getBean("sessionFactory");
	@Override
	public void saveNote(Note note) {
		Session session=sessionFactory.openSession();
		Transaction transaction=session.beginTransaction();
		session.save(note);
		transaction.commit();
		session.close();
		
	}

	@Override
	public void updateNote(Note note) {
		Session session=sessionFactory.openSession();
		Transaction transaction=session.beginTransaction();
		Note not=(Note) session.get(Note.class, note.getNoteId());
		not=note;
		session.merge(not);
		transaction.commit();
		session.close();
		
	}

	@Override
	public void deleteNote(int note_id) {
		Session session=sessionFactory.openSession();
		Transaction transaction=session.beginTransaction();
		Note note=(Note) session.get(Note.class, note_id);
		session.delete(note);
		transaction.commit();
		session.close();
	}

	@Override
	public List<Note> queryNote(String title) {
		Session session=sessionFactory.openSession();
		String hql="from Note note where note.title like :name";
		Query query=session.createQuery(hql);
		query.setString("name","%"+title+"%");
		List<Note> list=query.list();
		session.close();
		return list;
	}

	@Override
	public Note querySingleNote(String title) {
		Session session=sessionFactory.openSession();
		String hql="from Note note where note.title=:name";
		Query query=session.createQuery(hql);
		query.setString("name", title);
		List<Note> list=query.list();
		Note result=new Note();
		for(Note note : list){
			result=note;
			break;
		}
		session.close();
		return result;
	}

//	@Override
//	public int noteSize() {
//		Session session=sessionFactory.openSession();
//		String hql="from Note";
//		Query query=session.createQuery(hql);
//		List<Note> list=query.list();
//		session.close();
//		return list.size();
//	}

	@Override
	public Note queryViaId(int id) {
		Session session=sessionFactory.openSession();
		Note note=(Note) session.get(Note.class, id);
		session.close();
		return note;
	}

	@Override
	public List<String> queryNote(String title, String username) {
		Session session=sessionFactory.openSession();
		String hql="select title from Note where title like :title and user.username=:name";
		Query query=session.createQuery(hql);
		query.setString("title", "%"+title+"%");
		query.setString("name", username);
		List<String> result=query.list();
		return result;
	}

}
