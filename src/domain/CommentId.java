package domain;

/**
 * CommentId entity. @author MyEclipse Persistence Tools
 */

public class CommentId implements java.io.Serializable {

	// Fields

	private Integer idcomment;
	private Shop shop;
	private User user;

	// Constructors

	/** default constructor */
	public CommentId() {
	}

	/** full constructor */
	public CommentId(Integer idcomment, Shop shop, User user) {
		this.idcomment = idcomment;
		this.shop = shop;
		this.user = user;
	}

	// Property accessors

	public Integer getIdcomment() {
		return this.idcomment;
	}

	public void setIdcomment(Integer idcomment) {
		this.idcomment = idcomment;
	}

	public Shop getShop() {
		return this.shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof CommentId))
			return false;
		CommentId castOther = (CommentId) other;

		return ((this.getIdcomment() == castOther.getIdcomment()) || (this.getIdcomment() != null
				&& castOther.getIdcomment() != null && this.getIdcomment().equals(castOther.getIdcomment())))
				&& ((this.getShop() == castOther.getShop()) || (this.getShop() != null && castOther.getShop() != null
						&& this.getShop().equals(castOther.getShop())))
				&& ((this.getUser() == castOther.getUser()) || (this.getUser() != null && castOther.getUser() != null
						&& this.getUser().equals(castOther.getUser())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + (getIdcomment() == null ? 0 : this.getIdcomment().hashCode());
		result = 37 * result + (getShop() == null ? 0 : this.getShop().hashCode());
		result = 37 * result + (getUser() == null ? 0 : this.getUser().hashCode());
		return result;
	}

}