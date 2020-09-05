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
import com.kh.semiProject.mCompany.model.vo.Company;
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

	public Member MemberDetail(String userName) {
		Connection con = getConnection();

		Member m = mDao.MemberDetail(con,userName);

		if(m != null) commit(con);
		else rollback(con);

		close(con);
		return m;
	}

	public int enrollHotel(Hotel h, HotelConvenience hc, HotelRoom hr) {
		Connection con = getConnection();
		
		int result = mDao.enrollCompany(con,h,hc,hr);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int getListCount() {
		Connection con = getConnection();
		int listCount = mDao.getListCount(con);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Hotel> listHotel(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Hotel> list = mDao.listHotel(con, currentPage, limit);
		
		close(con);
		return list;
	}


}
