package domain;

/**
 * Comment entity. @author MyEclipse Persistence Tools
 */

public class Comment implements java.io.Serializable {

	// Fields

	private CommentId id;
	private String content;
	private String commentType;

	// Constructors

	/** default constructor */
	public Comment() {
		//
	}

	/** full constructor */
	public Comment(CommentId id, String content, String commentType) {
		this.id = id;
		this.content = content;
		this.commentType = commentType;
	}

	// Property accessors

	public CommentId getId() {
		return this.id;
	}

	public void setId(CommentId id) {
		this.id = id;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCommentType() {
		return this.commentType;
	}

	public void setCommentType(String commentType) {
		this.commentType = commentType;
	}

}