package com.kh.semiProject.restaurant.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semiProject.restaurant.model.dao.RestaurantDao;
import com.kh.semiProject.restaurant.model.vo.Restaurant;
import com.kh.semiProject.review.model.vo.Review;

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

	public ArrayList<Restaurant> searchRestaurant(String local, String size, String keyword, int currentPage,
			int limit) {
		
		Connection con = getConnection();
		ArrayList<Restaurant> list = null;
		
		if(local.length() > 0) list = rDao.searchRestaurant(con, local, size, keyword);
		else list = rDao.selectList(con, currentPage, limit);
		close(con);
		
		return list;
		
	}

	public int getSearchListCount(String local, String size, String keyword) {
		
		Connection con = getConnection();
		int listCount = rDao.getSearchListCount(con, local, size, keyword);
		
		close(con);
		
		return listCount;
		
	}
	
	public ArrayList<Review> restaurantReview(int rno) {
		
		Connection con = getConnection();
		ArrayList<Review> list = rDao.restaurantReview(con, rno);
		
		close(con);
		
		return list;
	}
}
