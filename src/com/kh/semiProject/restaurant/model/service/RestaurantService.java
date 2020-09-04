package com.kh.semiProject.restaurant.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semiProject.restaurant.model.dao.RestaurantDao;
import com.kh.semiProject.restaurant.model.vo.Restaurant;

import static com.kh.common.JDBCTemplate.*;

public class RestaurantService {
	
	private RestaurantDao rDao = new RestaurantDao();

	public int getListCount() {
		
		Connection con = getConnection();
		int listCount = rDao.getListCount(con);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Restaurant> selectList(int currentPage, int limit) {
		
		Connection con = getConnection();
		ArrayList<Restaurant> list = rDao.selectList(con, currentPage, limit);
		
		close(con);
		
		return list;

	}

	public Restaurant selectOne(int rno) {
		
		Connection con = getConnection();
		Restaurant r = rDao.selectOne(con, rno);
		
		close(con);
		
		return r;
		
	}
	
}