package com.kh.semiProject.comment.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;


import com.kh.semiProject.comment.model.dao.CommentDao;
import com.kh.semiProject.comment.model.vo.Comment;

public class CommentService {
	
	private CommentDao bcDao = new CommentDao();
	
	public int insertComment(Comment bco) {
		Connection con = getConnection();
		int result = bcDao.insertComment(con,bco);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		return result;
	}

	public ArrayList<Comment> selectList(int bno) {
		Connection con = getConnection();
		ArrayList<Comment> clist = 
				bcDao.selectList(con, bno);
		close(con);
		return clist;
	}

	public int deleteComment(int cmno) {
Connection con = getConnection();
		
		int result = bcDao.deleteComment(con,cmno);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		return result;
	}

	public int updateCommnet(Comment c) {
		Connection con = getConnection();
		int result = bcDao.updateComment(con,c);
		if(result > 0) commit(con);
		else rollback(con);
		return result;
	}

	public ArrayList<Comment> nselectList(int nno) {
		Connection con = getConnection();
		ArrayList<Comment> clist = 
				bcDao.nselectList(con, nno);
		close(con);
		return clist;
	}

}
