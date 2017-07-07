package domain;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Commodity entity. @author MyEclipse Persistence Tools
 */

public class Commodity implements java.io.Serializable {

	// Fields

	private CommodityId id;
	private String commName;
	private String commPrice;
	private String commNumber;
	private String commDescription;
	private String commPicUrl;
	private String type;
	private Boolean isSold;
	private Timestamp expireTime;
	private Set orders = new HashSet(0);

	// Constructors

	/** default constructor */
	public Commodity() {
	}

	/** minimal constructor */
	public Commodity(CommodityId id, String commName, String commPrice, String commNumber, String commDescription,
			String type, Boolean isSold) {
		this.id = id;
		this.commName = commName;
		this.commPrice = commPrice;
		this.commNumber = commNumber;
		this.commDescription = commDescription;
		this.type = type;
		this.isSold = isSold;
	}

	/** full constructor */
	public Commodity(CommodityId id, String commName, String commPrice, String commNumber, String commDescription,
			String commPicUrl, String type, Boolean isSold, Timestamp expireTime, Set orders) {
		this.id = id;
		this.commName = commName;
		this.commPrice = commPrice;
		this.commNumber = commNumber;
		this.commDescription = commDescription;
		this.commPicUrl = commPicUrl;
		this.type = type;
		this.isSold = isSold;
		this.expireTime = expireTime;
		this.orders = orders;
	}

	// Property accessors

	public CommodityId getId() {
		return this.id;
	}

	public void setId(CommodityId id) {
		this.id = id;
	}

	public String getCommName() {
		return this.commName;
	}

	public void setCommName(String commName) {
		this.commName = commName;
	}

	public String getCommPrice() {
		return this.commPrice;
	}

	public void setCommPrice(String commPrice) {
		this.commPrice = commPrice;
	}

	public String getCommNumber() {
		return this.commNumber;
	}

	public void setCommNumber(String commNumber) {
		this.commNumber = commNumber;
	}

	public String getCommDescription() {
		return this.commDescription;
	}

	public void setCommDescription(String commDescription) {
		this.commDescription = commDescription;
	}

	public String getCommPicUrl() {
		return this.commPicUrl;
	}

	public void setCommPicUrl(String commPicUrl) {
		this.commPicUrl = commPicUrl;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Boolean getIsSold() {
		return this.isSold;
	}

	public void setIsSold(Boolean isSold) {
		this.isSold = isSold;
	}

	public Timestamp getExpireTime() {
		return this.expireTime;
	}

	public void setExpireTime(Timestamp expireTime) {
		this.expireTime = expireTime;
	}

	public Set getOrders() {
		return this.orders;
	}

	public void setOrders(Set orders) {
		this.orders = orders;
	}

}