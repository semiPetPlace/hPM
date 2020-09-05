package com.kh.semiProject.main.model.dao;

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
import com.kh.semiProject.cafe.model.vo.Cafe;
import com.kh.semiProject.restaurant.model.vo.Restaurant;
//import com.kh.semiProject.restaurant.model.vo.Restaurant;
import com.kh.semiProject.search.model.dao.SearchDao;

public class MainDao {
	private Properties prop;

	public MainDao() {
		prop = new Properties();
		String filePath = SearchDao.class
				.getResource("/config/main-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	public ArrayList<Cafe> selectCafeList(Connection con) {
		ArrayList<Cafe> clist =new ArrayList<Cafe>();
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCafeList");
		
		try {
			stmt=con.createStatement();
			rset=stmt.executeQuery(sql);
			
			while(rset.next()) {
				Cafe c = new Cafe();
				c.setCno(rset.getInt("C_NO"));
				c.setCname(rset.getString("C_NAME"));
				c.setCimage(rset.getString("C_IMAGE"));
				c.setCscore(rset.getDouble("C_SCORE"));
				c.setCpromotion(rset.getString("C_PROMOTION"));
				
				clist.add(c);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return clist;
	}
	
	public ArrayList<Hotel> selectHotelList(Connection con) {
		ArrayList<Hotel> hlist =new ArrayList<Hotel>();
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectHotelList");
		
		try {
			stmt=con.createStatement();
			rset=stmt.executeQuery(sql);
			
			while(rset.next()) {
				Hotel h = new Hotel();
				h.sethNo(rset.getInt("H_NO"));
				h.sethName(rset.getString("H_NAME"));
				h.sethImg(rset.getString("H_IMG"));
				h.sethPrice(rset.getInt("H_PRICE"));
				h.sethPromotion(rset.getString("H_PROMOTION"));
				
				hlist.add(h);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return hlist;
	}
	
	public ArrayList<Restaurant> selectRtList(Connection con) {
		ArrayList<Restaurant> rlist =new ArrayList<Restaurant>();
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRtList");
		
		try {
			stmt=con.createStatement();
			rset=stmt.executeQuery(sql);
			
			while(rset.next()) {
				Restaurant r = new Restaurant();
				r.setRno(rset.getInt("R_NO"));
				r.setRname(rset.getString("R_NAME"));
				r.setRimage(rset.getString("R_IMAGE"));
				r.setRscore(rset.getDouble("R_SCORE"));
				r.setRpromotion(rset.getString("R_PROMOTION"));
				
				rlist.add(r);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return rlist;
	}
	public ArrayList<Hotel> selectPetHotelList(Connection con) {
		ArrayList<Hotel> plist =new ArrayList<Hotel>();
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPetHotelList");
		
		try {
			stmt=con.createStatement();
			rset=stmt.executeQuery(sql);
			
			while(rset.next()) {
				Hotel h = new Hotel();
				h.sethNo(rset.getInt("PH_NO"));
				h.sethName(rset.getString("PH_NAME"));
				h.sethImg(rset.getString("PH_IMG"));
				h.sethPrice(rset.getInt("PH_PRICE"));
				h.sethPromotion(rset.getString("PH_PROMOTION"));
				
				plist.add(h);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return plist;
	}

}
