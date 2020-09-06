package com.kh.semiProject.Hotel.model.dao;

import static com.kh.common.JDBCTemplate.close;

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
import com.kh.semiProject.Hotel.model.vo.HotelFacility;
import com.kh.semiProject.Hotel.model.vo.HotelRoom;

import com.kh.semiProject.Hotel.model.vo.PetHotel;

public class HotelDao {
	private Properties prop;

	public HotelDao() {
		prop= new Properties();
		String filePath = HotelDao.class.getResource("/config/Hotel-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Hotel> hotelList(Connection con) {
		ArrayList<Hotel> hlist = new ArrayList<>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				Hotel h = new Hotel();
				
				h.sethNo(rset.getInt("h_no"));
				h.sethName(rset.getString("h_Name"));
				h.sethPrice(rset.getInt("h_Price"));
				h.sethGrade(rset.getInt("h_Grade"));
				h.sethScore(rset.getInt("h_Score"));
				h.sethImg(rset.getString("h_Img"));
				h.sethAddress(rset.getString("h_Address"));
				h.sethPromotion(rset.getString("h_Promotion"));

				
				hlist.add(h);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return hlist;
	}

	public Hotel selectHotel(Connection con, int h_no) {
		Hotel hd = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectHotel");
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, h_no);
			
			rset= pstmt.executeQuery();
			if(rset.next()) {
				hd= new Hotel();
				
				hd.sethNo(rset.getInt("h_no"));
				hd.sethName(rset.getString("h_Name"));
				hd.sethTel(rset.getString("h_tel"));
				hd.sethPrice(rset.getInt("h_Price"));
				hd.sethGrade(rset.getInt("h_Grade"));
				hd.sethScore(rset.getInt("h_Score"));
				hd.sethImg(rset.getString("h_Img"));
				hd.sethAddress(rset.getString("h_Address"));
				hd.sethPromotion(rset.getString("h_Promotion"));
				hd.sethRequests(rset.getString("h_requests"));
				hd.setLat(rset.getFloat("h_lat"));
				hd.setLng(rset.getFloat("h_lng"));
				
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return hd;
	}

	public ArrayList<HotelRoom> roomlist(Connection con, int hr_no) {
		ArrayList<HotelRoom> hrlist = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("roomlist");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, hr_no);
			
			rset = pstmt.executeQuery();
			
			hrlist = new ArrayList<>();
			while(rset.next()) {
				HotelRoom hr = new HotelRoom();
				hr.setHno(rset.getInt("hr_hotelnumber"));
				hr.setRname(rset.getString("hr_roomname"));
				hr.setRprice(rset.getInt("hr_price"));
				hr.setRcheckin(rset.getString("hr_price"));
				hr.setRcheckout(rset.getString("hr_checkout"));
				hr.setRimg(rset.getString("hr_img"));
				hr.setRtub(rset.getString("hr_convenience_tub"));
				hr.setRbreakfast(rset.getString("hr_breakfast"));
				hr.setRbadtype(rset.getString("HR_BEDTYPE"));
				hr.setRsize(rset.getString("hr_roomsize"));
				hr.setRview(rset.getString("hr_view"));
				hr.setRstatus(rset.getString("hr_status"));
				
				hrlist.add(hr);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return hrlist;
	}

	public HotelConvenience convenience(Connection con, int h_no) {
		HotelConvenience hc =null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("convenience");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, h_no);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				hc = new HotelConvenience();
				
				hc.setHno(rset.getInt("hc_hotelnumber"));
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

	

	public HotelRoom payment(int hno, String rname, Connection con) {
		HotelRoom hr = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("payment");
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, hno);
			pstmt.setString(2, rname);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				hr = new HotelRoom();
				
				hr.setHno(rset.getInt("hr_hotelnumber"));
				hr.setRname(rset.getString("hr_roomname"));
				hr.setRprice(rset.getInt("hr_price"));
				hr.setRcheckin(rset.getString("hr_checkin"));
				hr.setRcheckout(rset.getString("hr_checkout"));
				hr.setRimg(rset.getString("hr_img"));
				hr.setRtub(rset.getString("hr_convenience_tub"));
				hr.setRbreakfast(rset.getString("hr_breakfast"));
				hr.setRbadtype(rset.getString("hr_bedtype"));
				hr.setRsize(rset.getString("hr_roomsize"));
				hr.setRview(rset.getString("hr_view"));
				hr.setRstatus(rset.getString("hr_status"));
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return hr;
	}

	public ArrayList<Hotel> searchHotels(Connection con, String in, String out, String area) {
		
		
		ArrayList<Hotel> hlist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchHotels");
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, area);
			pstmt.setString(2, in);
			pstmt.setString(3, in);
			pstmt.setString(4, out);
			pstmt.setString(5, out);

			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Hotel h = new Hotel();
				
				h.sethNo(rset.getInt("h_no"));
				h.sethName(rset.getString("h_Name"));
				h.sethPrice(rset.getInt("h_Price"));
				h.sethGrade(rset.getInt("h_Grade"));
				h.sethScore(rset.getInt("h_Score"));
				h.sethImg(rset.getString("h_Img"));
				h.sethAddress(rset.getString("h_Address"));
				h.sethPromotion(rset.getString("h_Promotion"));
				
				hlist.add(h);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return hlist;
	}

	public ArrayList<PetHotel> pethotelList(Connection con) {
		ArrayList<PetHotel> phlist = new ArrayList<>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("petlist");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				PetHotel ph = new PetHotel();
				
				ph.setPhno(rset.getInt("ph_no"));
				ph.setPhname(rset.getString("ph_name"));
				ph.setPhtel(rset.getString("ph_tel"));
				ph.setPhprice(rset.getInt("ph_price"));
				ph.setPhscore(rset.getInt("ph_score"));
				ph.setPhaddress(rset.getString("ph_address"));
				ph.setImg(rset.getString("ph_img"));
				ph.setDimg(rset.getString("ph_dimg"));
				ph.setPhpromotion(rset.getString("ph_promotion"));
				ph.setPhrequests(rset.getString("ph_requests"));
				ph.setLat(rset.getString("ph_lat"));
				ph.setLng(rset.getString("ph_lng"));
				
				phlist.add(ph);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return phlist;
	}

	public PetHotel pethotelDetail(Connection con, int ph_no) {
		PetHotel ph = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		
		String sql = prop.getProperty("pethotelDetail");
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ph_no);
			
			rset= pstmt.executeQuery();
			
			if(rset.next()) {
				ph = new PetHotel();

				ph.setPhno(rset.getInt("ph_no"));
				ph.setPhname(rset.getString("ph_name"));
				ph.setPhtel(rset.getString("ph_tel"));
				ph.setPhprice(rset.getInt("ph_price"));
				ph.setPhscore(rset.getInt("ph_score"));
				ph.setPhaddress(rset.getString("ph_address"));
				ph.setImg(rset.getString("ph_img"));
				ph.setDimg(rset.getString("ph_dimg"));
				ph.setPhpromotion(rset.getString("ph_promotion"));
				ph.setPhrequests(rset.getString("ph_requests"));
				ph.setLat(rset.getString("ph_lat"));
				ph.setLng(rset.getString("ph_lng"));
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return ph;
	}

	public ArrayList<PetHotel> searchPethotels(Connection con, String area) {
		ArrayList<PetHotel> phlist = new ArrayList<>();
		
		PreparedStatement pstmt =null;
		ResultSet rset =null;
		
		String sql = prop.getProperty("searchPethotelList");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, area);
			
			rset =pstmt.executeQuery();
			
			while(rset.next()) {
				PetHotel ph = new PetHotel();
				
				ph.setPhno(rset.getInt("ph_no"));
				ph.setPhname(rset.getString("ph_name"));
				ph.setPhtel(rset.getString("ph_tel"));
				ph.setPhprice(rset.getInt("ph_price"));
				ph.setPhscore(rset.getInt("ph_score"));
				ph.setPhaddress(rset.getString("ph_address"));
				ph.setImg(rset.getString("ph_img"));
				ph.setDimg(rset.getString("ph_dimg"));
				ph.setPhpromotion(rset.getString("ph_promotion"));
				ph.setPhrequests(rset.getString("ph_requests"));
				ph.setLat(rset.getString("ph_lat"));
				ph.setLng(rset.getString("ph_lng"));
				
				phlist.add(ph);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return phlist;
	}

	public int inserReser(Connection con, int hno, String rname, String cin, String cout, String checkintime,
			String totalprice, String guestname, String email, String guestrequest, String breakfast, String petnum, String userid) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReser");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, hno);
			pstmt.setString(2, rname);
			pstmt.setString(3, cin);
			pstmt.setString(4, cout);
			pstmt.setString(5, checkintime);
			pstmt.setString(6, totalprice);
			pstmt.setString(7, guestname);
			pstmt.setString(8, email);
			pstmt.setString(9, guestrequest);
			pstmt.setString(10, breakfast);
			pstmt.setString(11, petnum);
			pstmt.setString(12, userid);
			
			result =pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateRoom(Connection con, int hno, String rname, String Cin, String Cout) {
		int update = 0;
		PreparedStatement pstmt = null;

		
		String sql = prop.getProperty("roomupdate");
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, Cin);
			pstmt.setString(2, Cout);
			pstmt.setString(3, rname);
			pstmt.setInt(4, hno);
			
			update = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {

			close(pstmt);
		}
		
		
		return update;
	}

	public ArrayList<Hotel> filteredHotel(Connection con, String in, String out, String area, String[] checkArr) {
		ArrayList<Hotel> hlist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		
		String sqlquery = "SELECT DISTINCT H_NO,H_NAME,H_PRICE,H_GRADE,H_SCORE,H_IMG,H_ADDRESS,H_PROMOTION FROM HOTEL JOIN HOTEL_ROOM ON(H_NO = HR_HOTELNUMBER) WHERE H_ADDRESS LIKE ? || '%' AND H_NO IN(SELECT HR_HOTELNUMBER FROM HOTEL_ROOM WHERE HR_STATUS = 'Y' OR HR_CHECKIN < TO_DATE(?,'YYYY-MM-DD') AND HR_CHECKOUT < TO_DATE(?,'YYYY-MM-DD') OR HR_CHECKIN > TO_DATE(?,'YYYY-MM-DD') AND HR_CHECKIN > TO_DATE(?,'YYYY-MM-DD')) AND ";
		for(int i=0; i<checkArr.length; i++) {
			sqlquery += "H_FILTER LIKE '%"+checkArr[i]+"%' AND ";
					
		}
		
		String filtercheck = sqlquery.substring(0,sqlquery.length()-4);
		System.out.println(filtercheck);

		try {
			pstmt = con.prepareStatement(filtercheck);
			pstmt.setString(1, area); 
			pstmt.setString(2, in);
			pstmt.setString(3, in);
			pstmt.setString(4, out);
			pstmt.setString(5, out);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Hotel h = new Hotel();
				
				h.sethNo(rset.getInt("h_no"));
				h.sethName(rset.getString("h_Name"));
				h.sethPrice(rset.getInt("h_Price"));
				h.sethGrade(rset.getInt("h_Grade"));
				h.sethScore(rset.getInt("h_Score"));
				h.sethImg(rset.getString("h_Img"));
				h.sethAddress(rset.getString("h_Address"));
				h.sethPromotion(rset.getString("h_Promotion"));
				
				hlist.add(h);
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
