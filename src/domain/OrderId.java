package domain;

/**
 * OrderId entity. @author MyEclipse Persistence Tools
 */

public class OrderId implements java.io.Serializable {

	// Fields

	private Integer idorder;
	private User user;

	// Constructors

	/** default constructor */
	public OrderId() {
	}

	/** full constructor */
	public OrderId(Integer idorder, User user) {
		this.idorder = idorder;
		this.user = user;
	}

	// Property accessors

	public Integer getIdorder() {
		return this.idorder;
	}

	public void setIdorder(Integer idorder) {
		this.idorder = idorder;
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
		if (!(other instanceof OrderId))
			return false;
		OrderId castOther = (OrderId) other;

		return ((this.getIdorder() == castOther.getIdorder()) || (this.getIdorder() != null
				&& castOther.getIdorder() != null && this.getIdorder().equals(castOther.getIdorder())))
				&& ((this.getUser() == castOther.getUser()) || (this.getUser() != null && castOther.getUser() != null
						&& this.getUser().equals(castOther.getUser())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + (getIdorder() == null ? 0 : this.getIdorder().hashCode());
		result = 37 * result + (getUser() == null ? 0 : this.getUser().hashCode());
		return result;
	}

}