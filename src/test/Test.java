package test;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import domain.User;
import hibernate.session.HibernateSessionFactory;
class HibernateUtils {
	private static Configuration configuration;
	private static SessionFactory sessionFactory;

	static {
		configuration = new Configuration().configure();
		sessionFactory = configuration.buildSessionFactory();
	}

	public static Session openSession() {
		return sessionFactory.openSession();
	}
}
public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		Session session = HibernateSessionFactory.getSession();
//		org.hibernate.Transaction transaction = session.beginTransaction();
		Session session = HibernateUtils.openSession();
		Transaction transaction = session.beginTransaction();
		User loginUser = (User) session.createQuery("from User where username=admin");
	 
		String sql = "select * from user where username=\"" + "admin"+ "\"";
		@SuppressWarnings("unchecked")
		List<User>list = session.createSQLQuery(sql).addEntity(User.class).list();
		System.out.println(loginUser.getPassword());
		transaction.commit();
		session.close();
	}

}
