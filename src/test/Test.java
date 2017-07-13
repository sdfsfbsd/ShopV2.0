package test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import domain.User;
import service.IUserService;

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
	@Resource
	static private IUserService iUserService;
	public String getHashKey(String oldPrice) {

		int length = oldPrice.length();
		System.out.println("oldPrice" + oldPrice);
		java.util.Random random = new java.util.Random();// 定义随机类
		// 定义随机数
		int randomNumber = random.nextInt(10) + 20;

		int newNumber = Integer.parseInt(oldPrice) * randomNumber;

		String newNumberString = newNumber + "";
		
		int newNumberStringLength = newNumberString.length();
		// 随机
		String hashKey = "";
		//首字符不为零
		hashKey+=random.nextInt(10)+1;
		// 从newNumberString中随机获取length个字符组成新的hashKey
		for (int i = 0; i < length; i++) {
			int randomPosition = random.nextInt(newNumberStringLength);
			hashKey+= newNumberString.charAt(randomPosition);
		}
		System.out.println("hashKey" + hashKey);
		return hashKey;
	}

	
	public String[] getArea(String hashKey, String oldPrice ) {
		
		int NewPrice = Integer.parseInt(hashKey);
		int OldPrice = Integer.parseInt(oldPrice);
		
		java.util.Random random = new java.util.Random();// 定义随机类
		int randomNumber = random.nextInt(OldPrice) + 1;
		NewPrice -= randomNumber;
		
		String area[] = new String[2];
		
		area[0] = NewPrice+"";
		
		area[1] = (NewPrice+OldPrice)+"";
		
		System.out.println("start:" + area[0] + "end:" +area[1]);
		
		return area;
	}

	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");  
	        iUserService.findUser("admin");
	        iUserService.findUser("admin");
	}

}
