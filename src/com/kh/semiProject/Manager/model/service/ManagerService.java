package com.kh.semiProject.Manager.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semiProject.Hotel.model.vo.Hotel;
import com.kh.semiProject.Hotel.model.vo.HotelConvenience;
import com.kh.semiProject.Hotel.model.vo.HotelRoom;
import com.kh.semiProject.Manager.model.dao.ManagerDao;
import com.kh.semiProject.Manager.model.vo.Manager;
import com.kh.semiProject.member.model.vo.Member;


public class ManagerService {

	private ManagerDao mDao = new ManagerDao();

	public Manager mainView() {
		Connection con = getConnection();

		Manager ma = mDao.mainView(con);

		if(ma != null) commit(con);
		else rollback(con);

		close(con);
		return ma;
	}

	public Manager chartView() {
		Connection con = getConnection();

		Manager mac = mDao.chartView(con);

		if(mac != null) commit(con);
		else rollback(con);

		close(con);
		return mac;
	}
	
	public Member MemberDetail(String userid) {
		Connection con = getConnection();

		Member m = mDao.MemberDetail(con,userid);

		if(m != null) commit(con);
		else rollback(con);

		close(con);
		return m;
	}
	
	public int enrollHotel(Hotel h, HotelConvenience hc, HotelRoom hr, HotelRoom hr2) {
		Connection con = getConnection();
		
		int result = mDao.enrollCompany(con,h,hc,hr);
		
		if(result > 0) {
			int result1 = mDao.enrollRoom2(con,hr2);
			
			if(result1 > 0) commit(con);
			else rollback(con);
		}	
		
		close(con);
		
		return result;
	}

	public Hotel selectOneHotel(int hNo) {
		Connection con = getConnection();
		
		Hotel h = mDao.selectOneHotel(con,hNo);
		
		close(con);
		return h;
	}

	public HotelConvenience selectOneConvenience(int hNo) {
		Connection con = getConnection();
		
		HotelConvenience hc = mDao.selectOneConvenience(con,hNo);
		
		close(con);
		return hc;
	}

	public HotelRoom selectOneRoom(int hNo) {
		Connection con = getConnection();
		
		HotelRoom hr = mDao.selectOneRoom(con,hNo);
		
		close(con);
		return hr;
	}

	public HotelRoom selectOneRoom2(int hNo) {
		Connection con = getConnection();
		
		HotelRoom hr2 = mDao.selectOneRoom2(con,hNo);
		
		close(con);
		return hr2;
	}


	public int getListCount1() {
		Connection con = getConnection();
		int listCount = mDao.getListCount1(con);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Hotel> listHotel(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Hotel> list = mDao.listHotel(con, currentPage, limit);
		
		close(con);
		return list;
	}

	public ArrayList<Hotel> searchHotel(String categorySearch, String keyword) {
		Connection con = getConnection();
		ArrayList<Hotel> list = null;
		
		if(categorySearch.length() > 0) list = mDao.searchHotel(con,categorySearch,keyword);
		else list = mDao.searchHotel(con);
		
		close(con);
		return list;
	}


}
