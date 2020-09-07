package com.kh.semiProject.Manager.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semiProject.Hotel.model.vo.Hotel;
import com.kh.semiProject.Hotel.model.vo.HotelConvenience;
import com.kh.semiProject.Hotel.model.vo.HotelRoom;
import com.kh.semiProject.Hotel.model.vo.PetHotel;
import com.kh.semiProject.Manager.model.dao.ManagerDao;
import com.kh.semiProject.Manager.model.vo.Manager;
import com.kh.semiProject.cafe.model.vo.Cafe;
import com.kh.semiProject.mCompany.model.vo.Company;
import com.kh.semiProject.member.model.vo.Member;
import com.kh.semiProject.restaurant.model.vo.Restaurant;


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
	
	public ArrayList<HotelRoom> selectOneHotelRoom(int hNo) {
		Connection con = getConnection();
		
		ArrayList<HotelRoom> list = mDao.selectOneHotelRoom(con, hNo);
		
		close(con);
		return list;
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

	public ArrayList<Hotel> searchHotel(int currentPage, int limit, String categorySearch, String keyword) {
		Connection con = getConnection();
		ArrayList<Hotel> list = null;
		
		if(categorySearch.length() > 0) list = mDao.searchHotel(con,currentPage,limit,categorySearch,keyword);
		else list = mDao.searchHotel(con);
		
		close(con);
		return list;
	}

	public Hotel editViewHotel(int hNo) {
		Connection con = getConnection();
		
		Hotel h = mDao.selectOneHotel(con,hNo);
		
		close(con);
		return h;
	}

	public ArrayList<HotelRoom> editViewHotelRoom(int hNo) {
		Connection con = getConnection();
		
		ArrayList<HotelRoom> list = mDao.selectOneHotelRoom(con, hNo);
		
		close(con);
		return list;
	}

	public HotelConvenience editViewConvenience(int hNo) {
		Connection con = getConnection();
		
		HotelConvenience hc = mDao.selectOneConvenience(con,hNo);
		
		close(con);
		return hc;
	}

	public int editHotel(Hotel h, HotelConvenience hc, HotelRoom hr, HotelRoom hr2) {
		Connection con = getConnection();
		
		int result = mDao.editHotel(con,h,hc,hr);
		
		if(result > 0) {
			int result1 = mDao.editRoom2(con,h,hr2);
			
			if(result1 > 0) commit(con);
			else rollback(con);
		}	
		
		close(con);
		
		return result;
	}

	public int enrollpetHotel(PetHotel ph) {
		Connection con = getConnection();
		
		int result = mDao.enrollpetHotel(con,ph);
			
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public PetHotel selectOnepetHotel(int phno) {
		Connection con = getConnection();
		
		PetHotel ph = mDao.selectOnepetHotel(con,phno);
		
		close(con);
		return ph;
	}

	public ArrayList<PetHotel> listpetHotel(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<PetHotel> list = mDao.listpetHotel(con, currentPage, limit);
		
		close(con);
		return list;
	}

	public ArrayList<PetHotel> searchpetHotel(int currentPage, int limit, String categorySearch, String keyword) {
		Connection con = getConnection();
		ArrayList<PetHotel> list = null;
		
		if(categorySearch.length() > 0) list = mDao.searchpetHotel(con,currentPage,limit,categorySearch,keyword);
		else list = mDao.searchpetHotel(con);
		
		close(con);
		return list;
	}

	public PetHotel editViewpetHotel(int phno) {
		Connection con = getConnection();
		
		PetHotel ph = mDao.selectOnepetHotel(con,phno);
		
		close(con);
		return ph;
	}

	public int deletePetHotel(PetHotel ph) {
		Connection con = getConnection();
		
		int result = mDao.deletePetHotel(con,ph);
			
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int editpetHotel(PetHotel ph) {
		Connection con = getConnection();
		
		int result = mDao.editpetHotel(con,ph);
			
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int enrollCafe(Cafe c) {
		Connection con = getConnection();
		
		int result = mDao.enrollCafe(con,c);
			
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int enrollRest(Restaurant r) {
		Connection con = getConnection();
		
		int result = mDao.enrollRest(con,r);
			
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public ArrayList<Cafe> listcafe(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Cafe> list = mDao.listcafe(con, currentPage, limit);
		
		close(con);
		return list;
	}

	public ArrayList<Restaurant> listrest(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Restaurant> list = mDao.listrest(con, currentPage, limit);
		
		close(con);
		return list;
	}

	public ArrayList<Cafe> searchcafe(int currentPage, int limit, String categorySearch, String keyword) {
		Connection con = getConnection();
		ArrayList<Cafe> list = null;
		
		if(categorySearch.length() > 0) list = mDao.searchcafe(con,currentPage,limit,categorySearch,keyword);
		else list = mDao.searchcafe(con);
		
		close(con);
		return list;
	}

	public ArrayList<Restaurant> searchrest(int currentPage, int limit, String categorySearch, String keyword) {
		Connection con = getConnection();
		ArrayList<Restaurant> list = null;
		
		if(categorySearch.length() > 0) list = mDao.searchrest(con,currentPage,limit,categorySearch,keyword);
		else list = mDao.searchrest(con);
		
		close(con);
		return list;
	}

	public Cafe selectOnecafe(int cno) {
		Connection con = getConnection();
		
		Cafe c = mDao.selectOnecafe(con,cno);
		
		close(con);
		return c;
	}

	public Restaurant selectOnerest(int rno) {
		Connection con = getConnection();
		
		Restaurant r = mDao.selectOnerest(con,rno);
		
		close(con);
		return r;
	}

	
	



}
