package util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import domain.Commodity;
import service.ICommodityService;
import service.IOrderService;
import service.IUserService;

/**
 * 
 * @author ����
 * @date ʱ��
 * @description AJAX
 * @modify BUPT-TC
 * @modifyDate
 */

public class DwrUtil {

	@Resource
	private IUserService userService;

	@Resource
	private ICommodityService commodityService;
	

	@Resource
	private IOrderService orderService;
	
	
	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public ICommodityService getCommodityService() {
		return commodityService;
	}

	public void setCommodityService(ICommodityService commodityService) {
		this.commodityService = commodityService;
	}

	public IOrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(IOrderService orderService) {
		this.orderService = orderService;
	}

	/**
	 * 
	 * @param userName
	 *            �û���
	 * @return boolean �ж��û����Ƿ�Ϊ���֣��Ƿ���true������false
	 */
	public boolean isNumeric(String userName) {
		Pattern pattern = Pattern.compile("[0-9]*");
		Matcher isNum = pattern.matcher(userName);
		if (isNum.matches()) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 
	 * @param userName
	 *            �û���
	 * @param passwWord
	 *            ����
	 * @return String ״̬��Ϣ�����ǲ�û��ʲô�ã�
	 */
	public String loginCheck(String userName, String passwWord) {
		// ��Ҫ�޸�
		System.out.println("�˴�д�û�������У��ķ�����ͨ������1��ʧ�ܷ���ʧ����Ϣ");
		System.out.println("userName: " + userName + ", passWord: " + passwWord);

		if (StringUtils.isBlank(userName) || StringUtils.isBlank(passwWord)) {
			return "�˺Ż�����δ���룡";
		}
		try {
			if (userService.findUser(userName, passwWord) == null) {
				return "�Բ��𣬸��û������ڻ������������";
			} else {
				return "1";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "1";
	}

	/**
	 * 
	 * @param userName
	 *            �û���
	 * @return String ����û��������Ƿ���Ч��10λ���֣�������Ӧ�ַ���
	 */
	public String extenceCheck(String userName) {
		System.out.println("��ʼ�����û����Ƿ����");
		try {
			if (StringUtils.isBlank(userName)) {
				System.out.println("�û�������Ϊ�գ�ӦΪ10λ");
				return "�û�������Ϊ��";
			} else if (!isNumeric(userName) || userName.length() != 10) {
				System.out.println("�û���ӦΪ10λѧ��");
				return "�û���ӦΪ10λ����";
			} else {
				if (userService.findUser(userName) != null) {
					System.out.println("�û��Ѵ��ڣ�����������");
					return "extence";
				} else {
					System.out.println("�û�������");
					return "unExtence";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

	public String usernameCheck(String userName) {
		System.out.println("��ʼ�����û����Ƿ����");
		try {

			if (userService.findUser(userName) != null) {
				System.out.println("�û��Ѵ��ڣ�����������");
				return "extence";
			} else {
				System.out.println("�û�������");
				return "unExtence";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

	public String registerCheck(String registerUserName, String registerPassWord, String registerPassWord1) {

		if (StringUtils.isBlank(registerUserName) || StringUtils.isBlank(registerPassWord)
				|| StringUtils.isBlank(registerPassWord1)) {
			System.out.println("�û���������Ϊ�գ�");
			return "error";
		} else if (!isNumeric(registerUserName) || registerUserName.length() != 10) {
			return "error";
		} else {
			try {
				if (registerPassWord.equals(registerPassWord1)) {
					System.out.println("��������������ͬ");
					return "success";
				} else {
					System.out.println("������������벻һ�£����������룡");
					return "error";
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "error";
	}
	
	
	public boolean guessPrice(String price,String hashKey){
		System.out.println("��ʼ����¼��Ƿ����");
		if (price.equals(hashKey)){
			System.out.println("��ͬ");
			return true;
		}
		else {
			System.out.println("����ͬ");
			return false;
		}
		
		
	}
}
