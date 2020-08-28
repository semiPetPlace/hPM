package com.kh.semiProject.Hotel.model.service;


import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semiProject.Hotel.model.dao.HotelDao;
import com.kh.semiProject.Hotel.model.vo.Hotel;
import com.kh.semiProject.Hotel.model.vo.HotelConvenience;
import com.kh.semiProject.Hotel.model.vo.HotelRoom;

public class HotelService {
	
	private HotelDao hDao = new HotelDao();

	public ArrayList<Hotel> hotelList() {
		Connection con = getConnection();
		
		ArrayList<Hotel> hlist = hDao.hotelList(con);
		
		close(con);
		return hlist;
	}

	public Hotel selectHotel(int h_no) {
		Connection con = getConnection();
		
		Hotel hd = hDao.selectHotel(con,h_no);
		
		close(con);
		return hd;
	}

	public ArrayList<HotelRoom> roomlist(int hr_no) {
		Connection con = getConnection();
		
		ArrayList<HotelRoom> hrlist = hDao.roomlist(con,hr_no);
		
		close(con);
		return hrlist;
	}

	public HotelConvenience Convenience(int h_no) {
		Connection con = getConnection();
		
		HotelConvenience hc = hDao.convenience(con,h_no);
		
		close(con);
		return hc;
	}

}
