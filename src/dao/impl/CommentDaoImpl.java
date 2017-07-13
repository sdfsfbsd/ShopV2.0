package dao.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import dao.ICommentDao;
import domain.Comment;
import domain.User;

/**
 * 
 * @author buicyb
 *
 */
@Repository
public class CommentDaoImpl extends BaseDaoImpl<Comment> implements ICommentDao {
	private static Logger LOG = Logger.getLogger(CommentDaoImpl.class);
	//插入评论
	@Override
	public boolean addComment(Comment comment) {
		try {
			super.save(comment);
		} catch (Exception e) {
			e.printStackTrace();
			LOG.error(e);
			return false;
		}
		return true;
	}
    
}
