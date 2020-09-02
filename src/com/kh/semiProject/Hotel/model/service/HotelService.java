package com.kh.semiProject.Hotel.model.service;


import static com.kh.common.JDBCTemplate.*;


import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semiProject.Hotel.model.dao.HotelDao;
import com.kh.semiProject.Hotel.model.vo.Hotel;
import com.kh.semiProject.Hotel.model.vo.HotelConvenience;
import com.kh.semiProject.Hotel.model.vo.HotelFacility;
import com.kh.semiProject.Hotel.model.vo.HotelRoom;
import com.kh.semiProject.Hotel.model.vo.PetHotel;

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

	public HotelFacility facility(int h_no) {
		Connection con = getConnection();
		
		HotelFacility hf = hDao.facility(con,h_no);
		
		close(con);
		return hf;
	}

	public HotelRoom payment(int hno, String rname) {
		Connection con = getConnection();
		
		HotelRoom hr = hDao.payment(hno,rname,con);
		
		close(con);
		return hr;
	}

	public ArrayList<Hotel> searchHotels(String in, String out, String area) {
		Connection con = getConnection();
		
		ArrayList<Hotel> hlist = hDao.searchHotels(con,in,out,area);
		
		close(con);
		return hlist;
	}

	public ArrayList<PetHotel> pethotelList() {
		Connection con = getConnection();
		
		ArrayList<PetHotel> phlist = hDao.pethotelList(con);
		
		close(con);
		return phlist;
	}

	public PetHotel pethotelDetail(int ph_no) {
		Connection con = getConnection();
		
		PetHotel ph = hDao.pethotelDetail(con,ph_no);
		
		close(con);
		return ph;
	}

	public ArrayList<PetHotel> searchPethotels(String area) {
		Connection con = getConnection();
		
		ArrayList<PetHotel> phlist = hDao.searchPethotels(con,area);
		
		close(con);
		return phlist;
	}

}
