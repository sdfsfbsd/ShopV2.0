package service.Impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.ICommentDao;
import domain.Comment;
import service.ICommentService;
@Transactional
@Service
public class CommentServiceImpl implements ICommentService {

	@Resource
	private ICommentDao icommentDao;
	@Override
	public boolean addComment(Comment comment) {
		try {
			icommentDao.addComment(comment);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}

}
