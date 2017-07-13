package action;


import java.io.UnsupportedEncodingException;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import com.opensymphony.xwork2.ActionContext;
/**
 * 分类Action
 * @author 唐威
 * @date 2017年7月3日14:28:18
 * @modify BUPT
 * @modifyDate 
 */
import com.opensymphony.xwork2.ActionSupport;

import domain.Commodity;
import domain.Order;
import domain.User;
import service.IShowTypeService;
public class TypeAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private String type;
	private String[] typesInEN = {"yundong","huwai","jiadian","shuma","shouji","xiexue","peijian","wujindianzi","bangong"};
	static public String[] typesInCH = {"运动","户外","家电","数码","手机","鞋靴","配件","五金电子","办公"};
	static public int[] countOfTypes = {2,2};
	
	public String getType() {	
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public IShowTypeService getTypeService() {
		return typeService;
	}

	public void setTypeService(IShowTypeService typeService) {
		this.typeService = typeService;
	}

	TypeAction(){};
	TypeAction(String type){
		this.type = type;
	};

	@Resource
	private IShowTypeService typeService;
	
	
	public String classify() throws UnsupportedEncodingException{
		String real_type = null;
		for(int i =0;i<typesInEN.length;i++){
			if(typesInCH[i].equals(type)){
				real_type = typesInCH[i];
			}
			else if(typesInEN[i].equals(type)){				
				real_type = typesInCH[i];
			}
		}
		
		List<Commodity> list = typeService.findCommodityByType(real_type,false);
		System.out.println("real_type  " + real_type);
		if(list!=null){
			ActionContext actionContext = ActionContext.getContext();
			actionContext.getSession().put("Classify", list);
			System.out.println("classifysize  " + list.size());
			return SUCCESS;
		}
		else {
			return ERROR;
		}
		
	}
	public String maxType()throws UnsupportedEncodingException{
		int max = 0,cur = 0,i,index = 0;
		for( i = 0;i<countOfTypes.length;i++){				
			cur = countOfTypes[i];
			if(cur>max){
				max = cur;
				index = i;
			}
		}
		
	
		List<Commodity> list = new ArrayList<Commodity>();
		if(typeService!= null){
			list = typeService.findCommodityByType(typesInCH[index],true);
		}
		
		if(list!=null){
			ActionContext actionContext = ActionContext.getContext();
			actionContext.getSession().put("MaxCountType", list);
			return SUCCESS;
		}
		else {
			return ERROR;
		}
		
	}
	
}
