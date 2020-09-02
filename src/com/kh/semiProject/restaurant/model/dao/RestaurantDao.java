package com.kh.semiProject.restaurant.model.dao;

import static com.kh.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semiProject.restaurant.model.vo.Restaurant;

public class RestaurantDao {

	private Properties prop;

	public RestaurantDao() {

		prop = new Properties();

		String filePath = RestaurantDao.class.getResource("/config/restaurant-query.properties").getPath();

		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {			
			e.printStackTrace();
		}
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
		System.out.println(listCount);
		return listCount;
	}


	public ArrayList<Restaurant> selectList(Connection con, int currentPage, int limit) {

		ArrayList<Restaurant> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectList");

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
				r.setRno(rset.getInt("R_NO"));
				r.setRimage(rset.getString("R_IMAGE"));
				r.setRname(rset.getString("R_NAME"));
				r.setRscore(rset.getDouble("R_SCORE"));

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


	public Restaurant selectOne(Connection con, int rno) {

		Restaurant r = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOne");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rno);

			rset = pstmt.executeQuery();

			if(rset.next()) {
				r = new Restaurant();
				r.setRrimage(rset.getString("R_R_IMAGE"));
				r.setRimage(rset.getString("R_IMAGE"));
				r.setRname(rset.getString("R_NAME"));
				r.setRtel(rset.getString("R_TEL"));
				r.setRtime(rset.getString("R_TIME"));
				r.setRscore(rset.getDouble("R_SCORE"));
				r.setRaddress(rset.getString("R_ADDRESS"));
				r.setRdogCompInfo(rset.getString("R_DOG_COMPINFO"));
				r.setRpromotion(rset.getString("R_PROMOTION"));
				r.setRreview(rset.getString("R_REVIEW"));
				r.setRrequest(rset.getString("R_REQUEST"));
				r.setRregisterDate(rset.getDate("R_REGISTERDATE"));
				r.setRregistration(rset.getString("R_REGISTRATION"));
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