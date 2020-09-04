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
				hr.sethNo(rset.getInt("hr_hotelnumber"));
				hr.setrName(rset.getString("hr_roomname"));
				hr.setrPrice(rset.getInt("hr_price"));
				hr.setrCheckin(rset.getString("hr_price"));
				hr.setrCheckout(rset.getString("hr_checkout"));
				hr.setrImg(rset.getString("hr_img"));
				hr.setrTub(rset.getString("hr_convenience_tub"));
				hr.setrBreakfast(rset.getString("hr_breakfast"));
				hr.setrBadtype(rset.getString("HR_BEDTYPE"));
				hr.setrSize(rset.getString("hr_roomsize"));
				hr.setrView(rset.getString("hr_view"));
				hr.setrStatus(rset.getString("hr_status"));
				
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

	public HotelFacility facility(Connection con, int h_no) {
		HotelFacility hf = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("facility");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, h_no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				hf = new HotelFacility();
				
				hf.setHno(rset.getInt("f_hotelnumber"));
				hf.setFront(rset.getString("f_24h_front"));
				hf.setPaking(rset.getString("f_parkinglot"));
				hf.setRestaurant(rset.getString("f_restaurant"));
				hf.setRoomservice(rset.getString("f_room_service"));
				hf.setfitness(rset.getString("f_fitness_cnt"));
				hf.setNosmk(rset.getString("f_no_smk_rm"));
				hf.setAirport(rset.getString("f_airport_st"));
				hf.setDisabled(rset.getString("f_facility_disb"));
				hf.setSoundproof(rset.getString("f_soundproof"));
				hf.setFamily(rset.getString("f_family_room"));
				hf.setSpa(rset.getString("f_spa"));
				hf.setSauna(rset.getString("f_sauna"));
				hf.setWifi(rset.getString("f_wifi"));
				hf.setEvsc(rset.getString("f_ev_cs"));
				hf.setPool(rset.getString("f_s_pool"));
				hf.setKitchen(rset.getString("f_kitchen"));
				hf.setBathroom(rset.getString("f_bathroom"));
				hf.setBathtub(rset.getString("f_bathtub"));
				hf.setTv(rset.getString("f_tv"));
				hf.setWasher(rset.getString("f_washer"));
				hf.setOutlook(rset.getString("f_outlook"));
				hf.setKettle(rset.getString("f_elct_kettle"));
				hf.setBar(rset.getString("f_minibar"));
				hf.setCoffeemachine(rset.getString("f_coffeemachine"));
				hf.setRooftop(rset.getString("f_rooftop"));
				hf.setAirconditioner(rset.getString("f_air_conditioner"));
				hf.setTerrace(rset.getString("f_terrace"));
				hf.setBalcony(rset.getString("f_balcony"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return hf;
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
				
				hr.sethNo(rset.getInt("hr_hotelnumber"));
				hr.setrName(rset.getString("hr_roomname"));
				hr.setrPrice(rset.getInt("hr_price"));
				hr.setrCheckin(rset.getString("hr_checkin"));
				hr.setrCheckout(rset.getString("hr_checkout"));
				hr.setrImg(rset.getString("hr_img"));
				hr.setrTub(rset.getString("hr_convenience_tub"));
				hr.setrBreakfast(rset.getString("hr_breakfast"));
				hr.setrBadtype(rset.getString("hr_bedtype"));
				hr.setrSize(rset.getString("hr_roomsize"));
				hr.setrView(rset.getString("hr_view"));
				hr.setrStatus(rset.getString("hr_status"));
				
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

}
