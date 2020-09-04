package com.kh.semiProject.Manager.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semiProject.Hotel.model.vo.Hotel;
import com.kh.semiProject.Hotel.model.vo.HotelConvenience;
import com.kh.semiProject.Hotel.model.vo.HotelRoom;
import com.kh.semiProject.Manager.model.vo.Manager;
import com.kh.semiProject.mCompany.exception.CompanyException;
import com.kh.semiProject.mCompany.model.vo.Company;

import static com.kh.common.JDBCTemplate.*;
public class ManagerDao {

	private Properties prop;
	
	public ManagerDao() {
		prop = new Properties();
		
		String filePath = ManagerDao.class.getResource("/config/manager-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}
	public Manager mainView(Connection con) {

		Manager ma= null;


		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("mainView");

		try {
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				ma = new Manager();
				ma.setSaleY(rset.getInt("SALE_Y"));
				ma.setSaleM(rset.getInt("SALE_M"));
				ma.setSaleD(rset.getInt("SALE_D"));
				ma.setReservationM(rset.getInt("RESERVATION_M"));
				ma.setReservationY(rset.getInt("RESERVATION_Y"));
				ma.setMembercount(rset.getInt("TOTAL_M"));
				ma.setMembercountM(rset.getInt("MONTLY_M"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return ma;
	}

	public Manager chartView(Connection con) {
		int daily[] = new int[12];
		int montly[] = new int[12];
		Manager mac = new Manager(daily,montly);
//		Manager mac = new Manager(daily,montly);
		
//		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		
//		ResultSet rset = null;
		ResultSet rset2 = null;
		ResultSet rset3 = null;
		
//		String sql = prop.getProperty("chartView");
		String sql2 = prop.getProperty("dailyChart");
		String sql3 = prop.getProperty("montlyChart");
		
		try {
			pstmt2 = con.prepareStatement(sql2);
			pstmt3 = con.prepareStatement(sql3);
			
			rset2 = pstmt2.executeQuery();
			rset3 = pstmt3.executeQuery();
			for(int i =0; i<12;i++) {
				if(rset2.next() && rset3.next()) {
					daily[i] = rset2.getInt(1);
					montly[i] = rset3.getInt(1);
					System.out.println(i+"번째 날 매출"+rset2.getInt(1));
					System.out.println(i+"번째 달 매출"+rset3.getInt(1));
				}
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt2);
			close(pstmt3);
			close(rset2);
			close(rset3);
		}
		
		
		return mac;
	}
	
	public int enrollCompany(Connection con, Hotel h, HotelConvenience hc, HotelRoom hr) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("enrollHotel");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,h.gethName());
			pstmt.setString(2,h.gethTel());
			pstmt.setInt(3,h.gethPrice());
			pstmt.setInt(4,h.gethGrade());
			pstmt.setInt(5,h.gethScore());
			pstmt.setString(6,h.gethAddress());
			pstmt.setString(7,h.gethImg());
			pstmt.setString(8,h.gethPromotion());
			pstmt.setString(9,h.gethRequests());
			pstmt.setDate(10,h.gethRegisterData());
			pstmt.setString(11,h.gethRegistration());
			pstmt.setString(12,h.gethLat());
			pstmt.setString(13,h.gethLng());
			pstmt.setString(14,h.getFilter());
			
			pstmt.setString(15,hc.getTansport());
			pstmt.setString(16,hc.getAirport());
			pstmt.setString(17,hc.getLocation());
			pstmt.setString(18,hc.getWifi());
			pstmt.setString(19,hc.getTub());

			pstmt.setString(20,hr.getRname());
			pstmt.setInt(21,hr.getRprice());
			pstmt.setString(22,hr.getRimg());
			pstmt.setString(23,hr.getRtub());
			pstmt.setString(24,hr.getRbreakfast());
			pstmt.setString(25,hr.getRbadtype());
			pstmt.setString(26,hr.getRsize());
			pstmt.setString(27,hr.getRview());
			// 27개
			
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int getListCount(Connection con) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("listCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}
	
	public ArrayList<Hotel> listHotel(Connection con, int currentPage, int limit) {
		ArrayList<Hotel> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listHotel");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Hotel>();
			
			while(rset.next()) {
				Hotel h = new Hotel();
				
				h.sethNo(rset.getInt(1));
				h.sethName(rset.getString("hname"));
				h.sethTel(rset.getString("htel"));
				h.sethPrice(rset.getInt("hprice"));
				h.sethGrade(rset.getInt("hgrade"));
				h.sethScore(rset.getInt("hscore"));
				h.sethAddress(rset.getString("haddress"));
				h.sethRegisterData(rset.getDate("hregisterData"));
				h.sethRegistration(rset.getString("hregistration"));
				
				list.add(h);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<Hotel> selectOneHotel(Connection con, int hno, Hotel h, HotelConvenience hc, HotelRoom hr) {
		ArrayList<Hotel> hlist = null;
		ArrayList<HotelConvenience> hclist = null;
		ArrayList<HotelRoom> hrlist = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOneHotel");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, hno);
			
			rset = pstmt.executeQuery();
			
			hlist = new ArrayList<Hotel>();
			
			if(rset.next()) {
				h = new Hotel();
				h.sethNo(hno);
				h.sethName(rset.getString("hname"));
				h.sethTel(rset.getString("htel"));
				h.sethPrice(rset.getInt("hprice"));
				h.sethGrade(rset.getInt("hgrade"));
				h.sethScore(rset.getInt("hscore"));
				h.sethAddress(rset.getString("haddress"));
				h.sethImg(rset.getString("himg"));
				h.sethPromotion(rset.getString("hpromotion"));
				h.sethRequests(rset.getString("hrequests"));
				h.sethRegisterData(rset.getDate("hregisterData"));
				h.sethRegistration(rset.getString("hregistration"));
				h.sethLat(rset.getString("hlat"));
				h.sethLng(rset.getString("hlng"));
				h.setFilter(rset.getString("filter"));
				
				hc = new HotelConvenience();
				hc.setTansport(rset.getString("tansport"));
				hc.setAirport(rset.getString("sirport"));
				hc.setLocation(rset.getString("location"));
				hc.setWifi(rset.getString("wifi"));
				hc.setTub(rset.getString("tub"));
				
				hr = new HotelRoom();
				hr.setRname(rset.getString("rName"));
				hr.setRprice(rset.getInt("rPrice"));
				hr.setRimg(rset.getString("rImg"));
				hr.setRtub(rset.getString("rTub"));
				hr.setRbreakfast(rset.getString("rBreakfast"));
				hr.setRbadtype(rset.getString("rBadtype"));
				hr.setRsize(rset.getString("rSize"));
				hr.setRview(rset.getString("rView"));
				
				hlist.add(h);
				hclist.add(hc);
				hrlist.add(hr);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return hlist;
	}
	
	

}
