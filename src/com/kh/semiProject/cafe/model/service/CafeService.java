package com.kh.semiProject.cafe.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semiProject.cafe.model.dao.CafeDao;
import com.kh.semiProject.cafe.model.vo.Cafe;

import static common.JDBCTemplate.*;

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

}
