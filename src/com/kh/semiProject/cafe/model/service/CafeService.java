package com.kh.semiProject.cafe.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semiProject.cafe.model.dao.CafeDao;
import com.kh.semiProject.cafe.model.vo.Cafe;
import com.kh.semiProject.review.model.vo.Review;

public class CafeService {
	
	private CafeDao cDao = new CafeDao();

	public int getListCount() {
		
		Connection con = getConnection();
		int listCount = cDao.getListCount(con);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Cafe> selectList(int currentPage, int limit) {
		
		Connection con = getConnection();
		ArrayList<Cafe> list = cDao.selectList(con, currentPage, limit);
		
		close(con);
		
		return list;

	}

	public Cafe selectOne(int cno) {
		
		Connection con = getConnection();
		Cafe c = cDao.selectOne(con, cno);
		
		close(con);
		
		return c;
		
	}
	
	public ArrayList<Cafe> searchCafe(String local, String size, String keyword, int currentPage, int limit) {

		Connection con = getConnection();
		
		ArrayList<Cafe> list = null;
		
		if(local.length() > 0) list = cDao.searchCafe(con, local, size, keyword);
		else list = cDao.selectList(con, currentPage, limit);
		
		return list;
		
	}

	public int getSearchListCount(String local, String size, String keyword) {

		Connection con = getConnection();
		int listCount = cDao.getSearchListCount(con, local, size, keyword);
		
		close(con);
		
		return listCount;
		
	}

	public ArrayList<Review> cafeReview(int cno) {

		Connection con = getConnection();
		ArrayList<Review> list = cDao.cafeReview(con, cno);
		
		close(con);
		
		return list;
	}

}
