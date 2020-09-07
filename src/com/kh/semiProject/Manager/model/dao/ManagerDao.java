package com.kh.semiProject.Manager.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
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
import com.kh.semiProject.member.model.vo.Member;


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

	public Member MemberDetail(Connection con, String userName) {
		Member m = new Member();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userName);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m.setMno(rset.getString("M_NO"));
				m.setMuserId(rset.getString("M_USERID"));
				m.setMuserName(rset.getString("M_USERNAME"));
				m.setMemail(rset.getString("M_EMAIL"));
				m.setMaddress(rset.getString("M_ADDRESS"));
				m.setMphone(rset.getString("M_PHONE"));
				m.setMbirth(rset.getString("M_BIRTH"));
				m.setTel(rset.getString("M_PHONE"));
				m.setmRegisterdate(rset.getDate("M_REGISTERDATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return m;
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
			pstmt.setString(5,h.gethAddress());
			pstmt.setString(6,h.gethImg());
			pstmt.setString(7,h.gethPromotion());
			pstmt.setString(8,h.gethRequests());
			pstmt.setDate(9,h.gethRegisterData());
			pstmt.setString(10,h.gethRegistration());
			pstmt.setFloat(11,h.getLat());
			pstmt.setFloat(12,h.getLng());
			pstmt.setString(13,h.getFilter());
			
			pstmt.setString(14,hc.getTansport());
			pstmt.setString(15,hc.getAirport());
			pstmt.setString(16,hc.getLocation());
			pstmt.setString(17,hc.getWifi());
			pstmt.setString(18,hc.getTub());

			pstmt.setString(19,hr.getRname());
			pstmt.setInt(20,hr.getRprice());
			pstmt.setString(21,hr.getRimg());
			pstmt.setString(22,hr.getRtub());
			pstmt.setString(23,hr.getRbreakfast());
			pstmt.setString(24,hr.getRbadtype());
			pstmt.setString(25,hr.getRsize());
			pstmt.setString(26,hr.getRview());
			
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int enrollRoom2(Connection con, HotelRoom hr2) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("enrollRoom2");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,hr2.getRname());
			pstmt.setInt(2,hr2.getRprice());
			pstmt.setString(3,hr2.getRimg());
			pstmt.setString(4,hr2.getRtub());
			pstmt.setString(5,hr2.getRbreakfast());
			pstmt.setString(6,hr2.getRbadtype());
			pstmt.setString(7,hr2.getRsize());
			pstmt.setString(8,hr2.getRview());
			
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
		String sql = prop.getProperty("hsaleslistCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
				System.out.println(listCount);
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
			System.out.println("endRow : "+endRow);
			System.out.println("startRow : "+startRow);
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Hotel>();
			
			while(rset.next()) {
				Hotel h = new Hotel();
				h.sethNo(rset.getInt("H_No"));
				h.sethName(rset.getString("h_Name"));
				h.sethTel(rset.getString("h_Tel"));
				h.sethPrice(rset.getInt("h_Price"));
				h.sethGrade(rset.getInt("h_Grade"));
				h.sethAddress(rset.getString("h_Address"));
				h.sethRegisterData(rset.getDate("h_RegisterDate"));
				h.sethRegistration(rset.getString("h_Registration"));
				
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
	
	public Hotel selectOneHotel(Connection con, int hNo) {
		Hotel h = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOneHotel");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, hNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {	
				h = new Hotel();
				h.sethNo(hNo);
				h.sethName(rset.getString("h_Name"));
				h.sethTel(rset.getString("h_Tel"));
				h.sethPrice(rset.getInt("h_Price"));
				h.sethGrade(rset.getInt("h_Grade"));
				h.sethAddress(rset.getString("h_Address"));
				h.sethImg(rset.getString("h_Img"));
				h.sethPromotion(rset.getString("h_Promotion"));
				h.sethRequests(rset.getString("h_Requests"));
				h.sethRegisterData(rset.getDate("h_RegisterData"));
				h.sethRegistration(rset.getString("h_Registration"));
				h.setLat(rset.getFloat("h_lat"));
				h.setLng(rset.getFloat("h_lng"));
				h.setFilter(rset.getString("h_filter"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return h;
	}
	public HotelConvenience selectOneConvenience(Connection con, int hNo) {
		HotelConvenience hc = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOneConvenience");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, hNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {	
				hc = new HotelConvenience();
				hc.setTansport(rset.getString("tansport"));
				hc.setAirport(rset.getString("airport"));
				hc.setLocation(rset.getString("location"));
				hc.setWifi(rset.getString("wifi"));
				hc.setTub(rset.getString("tub"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return hc;
	}
	public HotelRoom selectOneRoom(Connection con, int hNo) {
		HotelRoom hr = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOneRoom");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, hNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {	
				hr = new HotelRoom();
				hr.setRname(rset.getString("r_Name1"));
				hr.setRprice(rset.getInt("r_Price1"));
				hr.setRimg(rset.getString("r_Img1"));
				hr.setRtub(rset.getString("r_Tub1"));
				hr.setRbreakfast(rset.getString("r_Breakfast1"));
				hr.setRbadtype(rset.getString("r_Badtype1"));
				hr.setRsize(rset.getString("r_Size1"));
				hr.setRview(rset.getString("r_View1"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return hr;
	}
	public HotelRoom selectOneRoom2(Connection con, int hNo) {
		HotelRoom hr2 = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOneRoom");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, hNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {	
				hr2 = new HotelRoom();
				hr2.setRname(rset.getString("r_Name2"));
				hr2.setRprice(rset.getInt("r_Price2"));
				hr2.setRimg(rset.getString("r_Img2"));
				hr2.setRtub(rset.getString("r_Tub2"));
				hr2.setRbreakfast(rset.getString("r_Breakfast2"));
				hr2.setRbadtype(rset.getString("r_Badtype2"));
				hr2.setRsize(rset.getString("r_Size2"));
				hr2.setRview(rset.getString("r_View2"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return hr2;
	}
	public ArrayList<Hotel> searchHotel(Connection con, String categorySearch, String keyword) {
		ArrayList<Hotel> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = null;
		
		switch(categorySearch) {
		case "hNo":
			sql = prop.getProperty("searchNumHotel");
			break;
		case "hName":
			sql = prop.getProperty("searchNameHotel");
			break;
		case "hTel":
			sql = prop.getProperty("searchTelHotel");
			break;
		case "hAddress":
			sql = prop.getProperty("searchAddressHotel");
			break;
		case "hPrice":
			sql = prop.getProperty("searchPriceHotel");
			break;
		case "hGrade":
			sql = prop.getProperty("searchGradeHotel");
			break;
		case "hRegisterData":
			sql = prop.getProperty("searchRegisterDataHotel");
			break;
		case "hRegistration":
			sql = prop.getProperty("searchRegistrationHotel");
			break;
		}
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			
			while(rset.next()) {
				Hotel h = new Hotel();
				h.sethNo(rset.getInt("h_No"));
				h.sethName(rset.getString("h_Name"));
				h.sethTel(rset.getString("h_Tel"));
				h.sethPrice(rset.getInt("h_Price"));
				h.sethGrade(rset.getInt("h_Grade"));
				h.sethAddress(rset.getString("h_Address"));
				h.sethRegisterData(rset.getDate("h_RegisterDate"));
				h.sethRegistration(rset.getString("h_Registration"));
				
				list.add(h);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return list;
	}
	public ArrayList<Hotel> searchHotel(Connection con) {
		// TODO Auto-generated method stub
		return null;
	}

	
//	public ArrayList<HotelRoom> selectOneRoom(Connection con, int hNo) {
//		ArrayList<HotelRoom> hrlist = null;
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		
//		String sql = prop.getProperty("selectOneRoom");
//		
//		try {
//			pstmt = con.prepareStatement(sql);
//			
//			pstmt.setInt(1, hNo);
//			
//			rset = pstmt.executeQuery();
//			
//			hrlist = new ArrayList<>();
//				
//				while(rset.next()) {
//					HotelRoom hr = new HotelRoom();
//					HotelRoom hr2 = new HotelRoom();
//					hr.setRname(rset.getString("rName1"));
//					hr.setRprice(rset.getInt("rPrice1"));
//					hr.setRimg(rset.getString("rImg1"));
//					hr.setRtub(rset.getString("rTub1"));
//					hr.setRbreakfast(rset.getString("rBreakfast1"));
//					hr.setRbadtype(rset.getString("rBadtype1"));
//					hr.setRsize(rset.getString("rSize1"));
//					hr.setRview(rset.getString("rView1"));
//					
//					hr2.setRname(rset.getString("rName2"));
//					hr2.setRprice(rset.getInt("rPrice2"));
//					hr2.setRimg(rset.getString("rImg2"));
//					hr2.setRtub(rset.getString("rTub2"));
//					hr2.setRbreakfast(rset.getString("rBreakfast2"));
//					hr2.setRbadtype(rset.getString("rBadtype2"));
//					hr2.setRsize(rset.getString("rSize2"));
//					hr2.setRview(rset.getString("rView2"));
//					
//					hrlist.add(hr);
//					hrlist.add(hr2);
//			}
//			
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close(rset);
//			close(pstmt);
//		}
//		return hrlist;
//	}


	
	

}
