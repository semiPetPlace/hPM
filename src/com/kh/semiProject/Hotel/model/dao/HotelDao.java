package com.kh.semiProject.Hotel.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semiProject.Hotel.model.vo.Hotel;
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

	public Hotel selectHotel(Connection con) {
		Hotel hd = new Hotel();
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectHotel");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				
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
			close(stmt);
		}
		return hd;
	}

}
