package com.kh.semiProject.review.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semiProject.board.model.vo.Board;
import com.kh.semiProject.review.model.dao.ReviewDao;
import com.kh.semiProject.review.model.vo.Review;

public class ReviewService {
	private ReviewDao rDao= new ReviewDao();
	public int insertReview(Review r) {
		Connection con = getConnection();
		int result =rDao.insertReview(con,r);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}
	public int getListCount() {
		Connection con = getConnection();
		System.out.println("넘어옴");
		int listCount = rDao.getListCount(con);
		System.out.println(listCount);
		close(con);
		
		return listCount;
	}
	public ArrayList<Review> reviewList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Review> rvlist = new ArrayList<Review>();
		rvlist=rDao.reviewList(con,currentPage,limit);
		
		close(con);
		return rvlist;
	}
	public Review selectOne(int rvno) {
		Connection con = getConnection();
		
		Review rv = rDao.selectOne(con,rvno);
		close(con);
		return rv;
	}
	public int reviewDelete(int rvno) {
		Connection con =getConnection();
		int result =rDao.boardDelete(con,rvno);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}
	public Review updateView(int rvno) {
		Connection con = getConnection();
		
		Review rv = rDao.selectOne(con,rvno);
		close(con);
		return rv;
	}
	public int updateReview(Review rv) {
		Connection con = getConnection();
		int result = rDao.updateReview(con,rv);
		if(result > 0) commit(con);
		else rollback(con);
		return result;
	}
	public ArrayList<Review> reviewList(int currentPage, int limit, int ctno, String type) {
		Connection con = getConnection();
		ArrayList<Review> rvlist = new ArrayList<Review>();
		rvlist=rDao.reviewList(con,currentPage,limit,ctno,type);
		
		close(con);
		return rvlist;
	}

}
