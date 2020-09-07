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
import com.kh.semiProject.Hotel.model.vo.PetHotel;
import com.kh.semiProject.Manager.model.vo.Manager;
import com.kh.semiProject.cafe.model.vo.Cafe;
import com.kh.semiProject.member.model.vo.Member;
import com.kh.semiProject.restaurant.model.vo.Restaurant;

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
	
	public int getListCount1(Connection con) {
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
				h.sethRegisterData(rset.getDate("h_RegisterDate"));
				h.sethRegistration(rset.getString("h_Registration"));
				h.setLat(rset.getFloat("h_Lat"));
				h.setLng(rset.getFloat("h_Lng"));
				h.setFilter(rset.getString("h_Filter"));
				
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
				hc.setTansport(rset.getString("hc_transport"));
				hc.setAirport(rset.getString("hc_airport"));
				hc.setLocation(rset.getString("hc_location"));
				hc.setWifi(rset.getString("hc_wifi"));
				hc.setTub(rset.getString("hc_tub"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return hc;
	}

	public ArrayList<Hotel> searchHotel(Connection con) {
		// TODO Auto-generated method stub
		return null;
	}
	public ArrayList<HotelRoom> selectOneHotelRoom(Connection con, int hNo) {
		ArrayList<HotelRoom> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOneHotelRoom");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, hNo);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
				
				while(rset.next()) {

					HotelRoom hr = new HotelRoom();
					hr.setRname(rset.getString("hr_roomName"));
					hr.setRprice(rset.getInt("hr_Price"));
					hr.setRimg(rset.getString("hr_Img"));
					hr.setRtub(rset.getString("HR_CONVENIENCE_TUB"));
					hr.setRbreakfast(rset.getString("hr_Breakfast"));
					hr.setRbadtype(rset.getString("hr_Bedtype"));
					hr.setRsize(rset.getString("hr_roomSize"));
					hr.setRview(rset.getString("hr_View"));
					
					list.add(hr);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public ArrayList<Hotel> searchHotel(Connection con, int currentPage, int limit, String categorySearch,
			String keyword) {
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
			
			int startRow = (currentPage-1)*limit+1;
			int endRow = startRow+limit-1;
			pstmt.setString(1, keyword);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, startRow);
			
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
	public Hotel editViewHotel(Connection con, int hNo) {
		Hotel h = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("editViewHotel");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, hNo);
			
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) {
				System.out.println("h_lat"+rset.getFloat("h_lat"));
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
				h.sethRegisterData(rset.getDate("h_RegisterDate"));
				h.sethRegistration(rset.getString("h_Registration"));
				h.setLat(rset.getFloat("h_Lat"));
				h.setLng(rset.getFloat("h_Lng"));
				h.setFilter(rset.getString("h_Filter"));
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return h;
	}

	public HotelConvenience editViewConvenience(Connection con, int hNo) {
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
				hc.setTansport(rset.getString("hc_transport"));
				hc.setAirport(rset.getString("hc_airport"));
				hc.setLocation(rset.getString("hc_location"));
				hc.setWifi(rset.getString("hc_wifi"));
				hc.setTub(rset.getString("hc_tub"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return hc;
	}
	
	public ArrayList<HotelRoom> editViewHotelRoom(Connection con, int hNo) {
		ArrayList<HotelRoom> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOneHotelRoom");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, hNo);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<>();
				
				while(rset.next()) {

					HotelRoom hr = new HotelRoom();
					hr.setRname(rset.getString("hr_roomName"));
					hr.setRprice(rset.getInt("hr_Price"));
					hr.setRimg(rset.getString("hr_Img"));
					hr.setRtub(rset.getString("HR_CONVENIENCE_TUB"));
					hr.setRbreakfast(rset.getString("hr_Breakfast"));
					hr.setRbadtype(rset.getString("hr_Bedtype"));
					hr.setRsize(rset.getString("hr_roomSize"));
					hr.setRview(rset.getString("hr_View"));
					
					list.add(hr);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public int editHotel(Connection con, Hotel h, HotelConvenience hc, HotelRoom hr) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("editHotel");
		
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
			pstmt.setInt(27,h.gethNo());
			
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int editRoom2(Connection con, Hotel h, HotelRoom hr2) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("editRoom2");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1,h.gethNo());
			pstmt.setString(2,hr2.getRname());
			pstmt.setInt(3,hr2.getRprice());
			pstmt.setString(4,hr2.getRimg());
			pstmt.setString(5,hr2.getRtub());
			pstmt.setString(6,hr2.getRbreakfast());
			pstmt.setString(7,hr2.getRbadtype());
			pstmt.setString(8,hr2.getRsize());
			pstmt.setString(9,hr2.getRview());
			pstmt.setInt(10,h.gethNo());
			
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int enrollpetHotel(Connection con, PetHotel ph) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("enrollpetHotel");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,ph.getPhname());
			pstmt.setString(2,ph.getPhtel());
			pstmt.setInt(3,ph.getPhprice());
			pstmt.setString(4,ph.getPhaddress());
			pstmt.setString(5,ph.getImg());
			pstmt.setString(6,ph.getDimg());
			pstmt.setString(7,ph.getPhpromotion());
			pstmt.setString(8,ph.getPhrequests());
			pstmt.setDate(9,ph.getPhregisterdate());
			pstmt.setString(10,ph.getRegistration());
			pstmt.setString(11,ph.getLat());
			pstmt.setString(12,ph.getLng());

			
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public PetHotel selectOnepetHotel(Connection con, int phno) {
		PetHotel ph = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOnepetHotel");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, phno);
			
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) {
				ph = new PetHotel();
				ph.setPhno(phno);
				ph.setPhname(rset.getString("ph_Name"));
				ph.setPhtel(rset.getString("ph_Tel"));
				ph.setPhprice(rset.getInt("ph_Price"));
				ph.setPhaddress(rset.getString("ph_Address"));
				ph.setImg(rset.getString("ph_Img"));
				ph.setDimg(rset.getString("ph_Img"));
				ph.setPhpromotion(rset.getString("ph_Promotion"));
				ph.setPhrequests(rset.getString("ph_Requests"));
				ph.setPhregisterdate(rset.getDate("PH_REGISTERDATE"));
				ph.setRegistration(rset.getString("PH_REGISTRATION"));
				ph.setLat(rset.getString("ph_Lat"));
				ph.setLng(rset.getString("ph_Lng"));
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return ph;
	}
	public ArrayList<PetHotel> listpetHotel(Connection con, int currentPage, int limit) {
		ArrayList<PetHotel> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listpetHotel");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<PetHotel>();
			
			while(rset.next()) {
				PetHotel ph = new PetHotel();
				ph = new PetHotel();
				ph.setPhno(rset.getInt("ph_No"));
				ph.setPhname(rset.getString("ph_Name"));
				ph.setPhtel(rset.getString("ph_Tel"));
				ph.setPhprice(rset.getInt("ph_Price"));
				ph.setPhaddress(rset.getString("ph_Address"));
				ph.setPhregisterdate(rset.getDate("PH_REGISTERDATE"));
				ph.setRegistration(rset.getString("PH_REGISTRATION"));
				
				list.add(ph);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public ArrayList<PetHotel> searchpetHotel(Connection con) {
		// TODO Auto-generated method stub
		return null;
	}
	public ArrayList<PetHotel> searchpetHotel(Connection con, int currentPage, int limit, String categorySearch,
			String keyword) {
		ArrayList<PetHotel> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = null;
		
		switch(categorySearch) {
		case "phno":
			sql = prop.getProperty("searchNumpetHotel");
			break;
		case "phname":
			sql = prop.getProperty("searchNamepetHotel");
			break;
		case "phtel":
			sql = prop.getProperty("searchTelpetHotel");
			break;
		case "phaddress":
			sql = prop.getProperty("searchAddresspetHotel");
			break;
		case "phprice":
			sql = prop.getProperty("searchPricepetHotel");
			break;
		case "phregisterdate":
			sql = prop.getProperty("searchRegisterDatapetHotel");
			break;
		case "registration":
			sql = prop.getProperty("searchRegistrationpetHotel");
			break;
		}
		
		try {
			pstmt = con.prepareStatement(sql);
			
			int startRow = (currentPage-1)*limit+1;
			int endRow = startRow+limit-1;
			pstmt.setString(1, keyword);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, startRow);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			
			while(rset.next()) {
				PetHotel ph = new PetHotel();
				ph.setPhno(rset.getInt("ph_No"));
				ph.setPhname(rset.getString("ph_Name"));
				ph.setPhtel(rset.getString("ph_Tel"));
				ph.setPhprice(rset.getInt("ph_Price"));
				ph.setPhaddress(rset.getString("ph_Address"));
				ph.setPhregisterdate(rset.getDate("PH_REGISTERDATE"));
				ph.setRegistration(rset.getString("PH_REGISTRATION"));
				
				list.add(ph);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return list;
	}
	public int deletePetHotel(Connection con, PetHotel ph) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deletepetHotel");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, ph.getPhno());
			
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int editpetHotel(Connection con, PetHotel ph) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("editpetHotel");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,ph.getPhname());
			pstmt.setString(2,ph.getPhtel());
			pstmt.setInt(3,ph.getPhprice());
			pstmt.setString(4,ph.getPhaddress());
			pstmt.setString(5,ph.getImg());
			pstmt.setString(6,ph.getDimg());
			pstmt.setString(7,ph.getPhpromotion());
			pstmt.setString(8,ph.getPhrequests());
			pstmt.setDate(9,ph.getPhregisterdate());
			pstmt.setString(10,ph.getRegistration());
			pstmt.setString(11,ph.getLat());
			pstmt.setString(12,ph.getLng());
			pstmt.setInt(13,ph.getPhno());
			
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int enrollCafe(Connection con, Cafe c) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("enrollCafe");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,c.getCname());
			pstmt.setString(2,c.getCtel());
			pstmt.setString(3,c.getCtime());
			pstmt.setString(4,c.getCaddress());
			pstmt.setString(5,c.getCimage());
			pstmt.setString(6,c.getCrimage());
			pstmt.setString(7,c.getCdogCompInfo());
			pstmt.setString(8,c.getCpromotion());
			pstmt.setString(9,c.getCrequest());
			pstmt.setDate(10,c.getCregisterDate());
			pstmt.setString(11,c.getCregistration());
			pstmt.setString(12,c.getCpetSize());
			pstmt.setFloat(13,c.getLat());
			pstmt.setFloat(14,c.getLng());

			
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public int enrollRest(Connection con, Restaurant r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("enrollRest");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,r.getRname());
			pstmt.setString(2,r.getRtel());
			pstmt.setString(3,r.getRtime());
			pstmt.setString(4,r.getRaddress());
			pstmt.setString(5,r.getRimage());
			pstmt.setString(6,r.getRrimage());
			pstmt.setString(7,r.getRdogCompInfo());
			pstmt.setString(8,r.getRpromotion());
			pstmt.setString(9,r.getRrequest());
			pstmt.setDate(10,r.getRregisterDate());
			pstmt.setString(11,r.getRregistration());
			pstmt.setString(12,r.getRpetSize());
			pstmt.setFloat(13,r.getLat());
			pstmt.setFloat(14,r.getLng());

			
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public ArrayList<Cafe> listcafe(Connection con, int currentPage, int limit) {
		ArrayList<Cafe> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listcafe");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Cafe>();
			
			while(rset.next()) {
				Cafe c = new Cafe();
				c = new Cafe();
				c.setCno(rset.getInt("c_No"));
				c.setCname(rset.getString("c_Name"));
				c.setCtel(rset.getString("c_Tel"));
				c.setCaddress(rset.getString("c_Address"));
				c.setCregisterDate(rset.getDate("C_REGISTERDATE"));
				c.setCregistration(rset.getString("C_REGISTRATION"));
				c.setCpetSize(rset.getString("C_PETSIZE"));
				
				list.add(c);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public ArrayList<Restaurant> listrest(Connection con, int currentPage, int limit) {
		ArrayList<Restaurant> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listrest");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Restaurant>();
			
			while(rset.next()) {
				Restaurant r = new Restaurant();
				r.setRno(rset.getInt("r_No"));
				r.setRname(rset.getString("r_Name"));
				r.setRtel(rset.getString("r_Tel"));
				r.setRaddress(rset.getString("r_Address"));
				r.setRregisterDate(rset.getDate("R_REGISTERDATE"));
				r.setRregistration(rset.getString("R_REGISTRATION"));
				r.setRpetSize(rset.getString("R_PETSIZE"));
				
				list.add(r);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	public ArrayList<Cafe> searchcafe(Connection con) {
		// TODO Auto-generated method stub
		return null;
	}
	public ArrayList<Restaurant> searchrest(Connection con) {
		// TODO Auto-generated method stub
		return null;
	}
	public ArrayList<Cafe> searchcafe(Connection con, int currentPage, int limit, String categorySearch,
			String keyword) {
		ArrayList<Cafe> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = null;
		
		switch(categorySearch) {
		case "cno":
			sql = prop.getProperty("searchNumCafe");
			break;
		case "cname":
			sql = prop.getProperty("searchNameCafe");
			break;
		case "ctel":
			sql = prop.getProperty("searchTelCafe");
			break;
		case "caddress":
			sql = prop.getProperty("searchAddressCafe");
			break;
		case "cpetSize":
			sql = prop.getProperty("searchCpetSizeCafe");
			break;
		case "cregisterDate":
			sql = prop.getProperty("searchRegisterDataCafe");
			break;
		case "cregistration":
			sql = prop.getProperty("searchRegistrationCafe");
			break;
		}
		
		try {
			pstmt = con.prepareStatement(sql);
			
			int startRow = (currentPage-1)*limit+1;
			int endRow = startRow+limit-1;
			pstmt.setString(1, keyword);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, startRow);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			
			while(rset.next()) {
				Cafe c = new Cafe();
				c = new Cafe();
				c.setCno(rset.getInt("c_No"));
				c.setCname(rset.getString("c_Name"));
				c.setCtel(rset.getString("c_Tel"));
				c.setCaddress(rset.getString("c_Address"));
				c.setCregisterDate(rset.getDate("C_REGISTERDATE"));
				c.setCregistration(rset.getString("C_REGISTRATION"));
				c.setCpetSize(rset.getString("C_PETSIZE"));
				
				
				list.add(c);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return list;
	}
	public ArrayList<Restaurant> searchrest(Connection con, int currentPage, int limit, String categorySearch,
			String keyword) {
		ArrayList<Restaurant> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = null;
		
		switch(categorySearch) {
		case "rno":
			sql = prop.getProperty("searchNumRest");
			break;
		case "rname":
			sql = prop.getProperty("searchNameRest");
			break;
		case "rtel":
			sql = prop.getProperty("searchTelRest");
			break;
		case "raddress":
			sql = prop.getProperty("searchAddressRest");
			break;
		case "rpetSize":
			sql = prop.getProperty("searchCpetSizeRest");
			break;
		case "rregisterDate":
			sql = prop.getProperty("searchRegisterDataRest");
			break;
		case "rregistration":
			sql = prop.getProperty("searchRegistrationRest");
			break;
		}
		
		try {
			pstmt = con.prepareStatement(sql);
			
			int startRow = (currentPage-1)*limit+1;
			int endRow = startRow+limit-1;
			pstmt.setString(1, keyword);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, startRow);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			
			while(rset.next()) {
				Restaurant r = new Restaurant();
				r.setRno(rset.getInt("r_No"));
				r.setRname(rset.getString("r_Name"));
				r.setRtel(rset.getString("r_Tel"));
				r.setRaddress(rset.getString("r_Address"));
				r.setRregisterDate(rset.getDate("R_REGISTERDATE"));
				r.setRregistration(rset.getString("R_REGISTRATION"));
				r.setRpetSize(rset.getString("R_PETSIZE"));
				
				list.add(r);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return list;
	}
	public Cafe selectOnecafe(Connection con, int cno) {
		Cafe c = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOnecafe");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, cno);
			
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) {
				c = new Cafe();
				c.setCno(cno);
				c.setCname(rset.getString("c_Name"));
				c.setCtel(rset.getString("c_Tel"));
				c.setCaddress(rset.getString("c_Address"));
				c.setCtime(rset.getString("c_time"));
				c.setCimage(rset.getString("c_image"));
				c.setCrimage(rset.getString("c_r_image"));
				c.setCdogCompInfo(rset.getString("C_DOG_COMPINFO"));
				c.setCpromotion(rset.getString("C_PROMOTION"));
				c.setCrequest(rset.getString("C_REQUEST"));
				c.setCregisterDate(rset.getDate("C_REGISTERDATE"));
				c.setCregistration(rset.getString("C_REGISTRATION"));
				c.setCpetSize(rset.getString("C_PETSIZE"));
				c.setLat(rset.getFloat("LAT"));
				c.setLng(rset.getFloat("LNG"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return c;
	}
	public Restaurant selectOnerest(Connection con, int rno) {
		Restaurant r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOnerest");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, rno);
			
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) {
				r = new Restaurant();
				r.setRno(rno);
				r.setRname(rset.getString("r_Name"));
				r.setRtel(rset.getString("r_Tel"));
				r.setRaddress(rset.getString("r_Address"));
				r.setRtime(rset.getString("r_time"));
				r.setRimage(rset.getString("r_image"));
				r.setRrimage(rset.getString("r_r_image"));
				r.setRdogCompInfo(rset.getString("R_DOG_COMPINFO"));
				r.setRpromotion(rset.getString("R_PROMOTION"));
				r.setRrequest(rset.getString("R_REQUEST"));
				r.setRregisterDate(rset.getDate("R_REGISTERDATE"));
				r.setRregistration(rset.getString("R_REGISTRATION"));
				r.setRpetSize(rset.getString("R_PETSIZE"));
				r.setLat(rset.getFloat("LAT"));
				r.setLng(rset.getFloat("LNG"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return r;
	}
	

}
