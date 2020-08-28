package com.kh.semiProject.cafe.model.service;


import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semiProject.cafe.model.dao.CafeDao;
import com.kh.semiProject.cafe.model.vo.Cafe;

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

}
