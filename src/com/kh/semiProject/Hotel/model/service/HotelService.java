package com.kh.semiProject.Hotel.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semiProject.Hotel.model.dao.HotelDao;
import com.kh.semiProject.Hotel.model.vo.Hotel;

public class HotelService {
	
	private HotelDao hDao = new HotelDao();

	public ArrayList<Hotel> hotelList() {
		Connection con = getConnection();
		
		ArrayList<Hotel> hlist = hDao.hotelList(con);
		
		close(con);
		return hlist;
	}

}
