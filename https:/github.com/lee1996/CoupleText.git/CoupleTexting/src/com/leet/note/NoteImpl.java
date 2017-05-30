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
		Note not=(Note) session.load(Note.class, note.getNoteId());
		session.update(not);
		transaction.commit();
		session.close();
		
	}

	@Override
	public void deleteNote(String note_id) {
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

	@Override
	public int noteSize() {
		Session session=sessionFactory.openSession();
		String hql="from Note";
		Query query=session.createQuery(hql);
		List<Note> list=query.list();
		return list.size();
	}

}
