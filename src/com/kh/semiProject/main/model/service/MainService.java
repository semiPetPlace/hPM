package com.kh.semiProject.main.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semiProject.Hotel.model.vo.Hotel;
import com.kh.semiProject.cafe.model.vo.Cafe;
import com.kh.semiProject.main.model.dao.MainDao;
//import com.kh.semiProject.restaurant.model.vo.Restaurant;
import com.kh.semiProject.restaurant.model.vo.Restaurant;

public class MainService {

	private MainDao mDao = new MainDao();

	public ArrayList<Cafe> selectCafeList() {
		Connection con = getConnection();
		ArrayList<Cafe> clist = mDao.selectCafeList(con);
		
		close(con);

		return clist;
	}

	public ArrayList<Hotel> selectHotelList() {
		Connection con = getConnection();
		ArrayList<Hotel> hlist = mDao.selectHotelList(con);
		
		close(con);

		return hlist;
	}

	public ArrayList<Restaurant> selectRtList() {
		Connection con = getConnection();
		ArrayList<Restaurant> rlist = mDao.selectRtList(con);
		
		close(con);

		return rlist;
	}

	public ArrayList<Hotel> selectPetHotelList() {
		Connection con = getConnection();
		ArrayList<Hotel> plist = mDao.selectPetHotelList(con);
		
		close(con);

		return plist;
	}

}
