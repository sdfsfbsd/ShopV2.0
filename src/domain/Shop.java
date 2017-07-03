package domain;

import java.util.HashSet;
import java.util.Set;

/**
 * Shop entity. @author MyEclipse Persistence Tools
 */

public class Shop implements java.io.Serializable {

	// Fields

	private ShopId id;
	private Set commodities = new HashSet(0);
	private Set comments = new HashSet(0);

	// Constructors

	/** default constructor */
	public Shop() {
	}

	/** minimal constructor */
	public Shop(ShopId id) {
		this.id = id;
	}

	/** full constructor */
	public Shop(ShopId id, Set commodities, Set comments) {
		this.id = id;
		this.commodities = commodities;
		this.comments = comments;
	}

	// Property accessors

	public ShopId getId() {
		return this.id;
	}

	public void setId(ShopId id) {
		this.id = id;
	}

	public Set getCommodities() {
		return this.commodities;
	}

	public void setCommodities(Set commodities) {
		this.commodities = commodities;
	}

	public Set getComments() {
		return this.comments;
	}

	public void setComments(Set comments) {
		this.comments = comments;
	}

}