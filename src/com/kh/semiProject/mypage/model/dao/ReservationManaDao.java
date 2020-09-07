package com.kh.semiProject.mypage.model.dao;

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

import com.kh.semiProject.mypage.model.vo.ReservationMana;
public class ReservationManaDao {
	private Properties prop;	

	public ReservationManaDao() {
		prop= new Properties();
		String filePath = ReservationManaDao.class.getResource("/config/reservationMana.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<ReservationMana> scheduledreser(Connection con, String userid) {
		ArrayList<ReservationMana> reserList = new ArrayList<>();
		
		PreparedStatement pstmt =null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("scheduledReser");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				ReservationMana  rm = new ReservationMana();
				
				rm.setReserDate(rset.getString("ma_reser_date"));
				rm.setReserHotelno(rset.getInt("ma_reser_hotel"));
				rm.setReserCheckin(rset.getString("ma_reser_checkin"));
				rm.setReserCheckout(rset.getString("ma_reser_checkout"));
				rm.setReserCheckintime(rset.getString("ma_reser_checkintime"));
				rm.setReserTotalprice(rset.getString("ma_reser_totalprice"));
				rm.setReserGuestid(rset.getString("ma_reser_guestid"));
				rm.setReserGuestemail(rset.getString("ma_reser_guestemail"));
				rm.setReserGuestrequest(rset.getString("ma_reser_guestrequest"));
				rm.setReserBreakfast(rset.getString("ma_reser_breakfast"));
				rm.setReserUserid(rset.getString("ma_reser_userid"));
				rm.setReserhotelname(rset.getString("H_NAME"));
				rm.setReserHotelimg(rset.getString("h_img"));
				rm.setReserNo(rset.getInt("ma_reser_no"));
				
				reserList.add(rm);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return reserList;
	}

	public ArrayList<ReservationMana> finishedReser(Connection con, String userid) {
		ArrayList<ReservationMana> reserList = new ArrayList<>();
		
		PreparedStatement pstmt =null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("finishedReser");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				ReservationMana  rm = new ReservationMana();
				
				rm.setReserDate(rset.getString("ma_reser_date"));
				rm.setReserHotelno(rset.getInt("ma_reser_hotel"));
				rm.setReserCheckin(rset.getString("ma_reser_checkin"));
				rm.setReserCheckout(rset.getString("ma_reser_checkout"));
				rm.setReserCheckintime(rset.getString("ma_reser_checkintime"));
				rm.setReserTotalprice(rset.getString("ma_reser_totalprice"));
				rm.setReserGuestid(rset.getString("ma_reser_guestid"));
				rm.setReserGuestemail(rset.getString("ma_reser_guestemail"));
				rm.setReserGuestrequest(rset.getString("ma_reser_guestrequest"));
				rm.setReserBreakfast(rset.getString("ma_reser_breakfast"));
				rm.setReserUserid(rset.getString("ma_reser_userid"));
				rm.setReserhotelname(rset.getString("H_NAME"));
				rm.setReserHotelimg(rset.getString("h_img"));
				rm.setReserNo(rset.getInt("ma_reser_no"));
				
				reserList.add(rm);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return reserList;
	}

	public ArrayList<ReservationMana> conceledReser(Connection con, String userid) {
		ArrayList<ReservationMana> reserList = new ArrayList<>();
		
		PreparedStatement pstmt =null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("canceledReser");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userid);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				ReservationMana  rm = new ReservationMana();
				
				rm.setReserDate(rset.getString("ma_reser_date"));
				rm.setReserHotelno(rset.getInt("ma_reser_hotel"));
				rm.setReserCheckin(rset.getString("ma_reser_checkin"));
				rm.setReserCheckout(rset.getString("ma_reser_checkout"));
				rm.setReserCheckintime(rset.getString("ma_reser_checkintime"));
				rm.setReserTotalprice(rset.getString("ma_reser_totalprice"));
				rm.setReserGuestid(rset.getString("ma_reser_guestid"));
				rm.setReserGuestemail(rset.getString("ma_reser_guestemail"));
				rm.setReserGuestrequest(rset.getString("ma_reser_guestrequest"));
				rm.setReserBreakfast(rset.getString("ma_reser_breakfast"));
				rm.setReserUserid(rset.getString("ma_reser_userid"));
				rm.setReserhotelname(rset.getString("H_NAME"));
				rm.setReserHotelimg(rset.getString("h_img"));
				rm.setReserNo(rset.getInt("ma_reser_no"));
				
				reserList.add(rm);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return reserList;
	}

	public ArrayList<ReservationMana> detailReser(Connection con, String reserno) {
		ArrayList<ReservationMana> reserList = new ArrayList<>();
		
		PreparedStatement pstmt =null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("detailReser");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, reserno);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				ReservationMana  rm = new ReservationMana();
				
				rm.setReserDate(rset.getString("ma_reser_date"));
				rm.setReserHotelno(rset.getInt("ma_reser_hotel"));
				rm.setReserCheckin(rset.getString("ma_reser_checkin"));
				rm.setReserCheckout(rset.getString("ma_reser_checkout"));
				rm.setReserCheckintime(rset.getString("ma_reser_checkintime"));
				rm.setReserTotalprice(rset.getString("ma_reser_totalprice"));
				rm.setReserGuestid(rset.getString("ma_reser_guestid"));
				rm.setReserGuestemail(rset.getString("ma_reser_guestemail"));
				rm.setReserGuestrequest(rset.getString("ma_reser_guestrequest"));
				rm.setReserBreakfast(rset.getString("ma_reser_breakfast"));
				rm.setReserUserid(rset.getString("ma_reser_userid"));
				rm.setReserhotelname(rset.getString("H_NAME"));
				rm.setReserHotelimg(rset.getString("h_img"));
				rm.setReserNo(rset.getInt("ma_reser_no"));
				rm.setReserPetnumber(rset.getInt("ma_reser_petnumber"));
				rm.setReserRoom(rset.getString("ma_reser_room"));
				
				reserList.add(rm);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return reserList;
	}

	public ArrayList<ReservationMana> recentReser(Connection con) {
		ArrayList<ReservationMana> reserList = new ArrayList<>();
		
		Statement stmt =null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("recentReser");
		
		try {
			stmt = con.createStatement();
			rset =stmt.executeQuery(sql);
			
			while(rset.next()) {
				ReservationMana  rm = new ReservationMana();
				
				rm.setReserDate(rset.getString("ma_reser_date"));
				rm.setReserHotelno(rset.getInt("ma_reser_hotel"));
				rm.setReserCheckin(rset.getString("ma_reser_checkin"));
				rm.setReserCheckout(rset.getString("ma_reser_checkout"));
				rm.setReserCheckintime(rset.getString("ma_reser_checkintime"));
				rm.setReserTotalprice(rset.getString("ma_reser_totalprice"));
				rm.setReserGuestid(rset.getString("ma_reser_guestid"));
				rm.setReserGuestemail(rset.getString("ma_reser_guestemail"));
				rm.setReserGuestrequest(rset.getString("ma_reser_guestrequest"));
				rm.setReserBreakfast(rset.getString("ma_reser_breakfast"));
				rm.setReserUserid(rset.getString("ma_reser_userid"));
				rm.setReserhotelname(rset.getString("H_NAME"));
				rm.setReserHotelimg(rset.getString("h_img"));
				rm.setReserNo(rset.getInt("ma_reser_no"));
				rm.setReserPetnumber(rset.getInt("ma_reser_petnumber"));
				rm.setReserRoom(rset.getString("ma_reser_room"));
				
				reserList.add(rm);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return reserList;
	}

}
