package com.kh.semiProject.cafe.model.dao;

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

import com.kh.semiProject.cafe.model.vo.Cafe;

public class CafeDao {
	
	private Properties prop;
	
	public CafeDao() {
		
		prop = new Properties();
		
		String filePath = CafeDao.class.getResource("/config/cafe-query.properties").getPath();
		
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
		
		return listCount;
	}


	public ArrayList<Cafe> selectList(Connection con, int currentPage, int limit) {
		
		ArrayList<Cafe> list = null;
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
			
			list = new ArrayList<Cafe>();
			
			while(rset.next()) {
				Cafe c = new Cafe();
				c.setCno(rset.getInt("C_NO"));
				c.setCimage(rset.getString("C_IMAGE"));
				c.setCname(rset.getString("C_NAME"));
				c.setCscore(rset.getDouble("C_SCORE"));
				
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


	public Cafe selectOne(Connection con, int cno) {
		
		Cafe c = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c = new Cafe();
				c.setCrimage(rset.getString("C_R_IMAGE"));
				c.setCimage(rset.getString("C_IMAGE"));
				c.setCname(rset.getString("C_NAME"));
				c.setCtel(rset.getString("C_TEL"));
				c.setCtime(rset.getString("C_TIME"));
				c.setCscore(rset.getDouble("C_SCORE"));
				c.setCaddress(rset.getString("C_ADDRESS"));
				c.setCdogCompInfo(rset.getString("C_DOG_COMPINFO"));
				c.setCpromotion(rset.getString("C_PROMOTION"));
				c.setCreview(rset.getString("C_REVIEW"));
				c.setCrequest(rset.getString("C_REQUEST"));
				c.setCregisterDate(rset.getDate("C_REGISTERDATE"));
				c.setCregistration(rset.getString("C_REGISTRATION"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return c;
	}


	public ArrayList<Cafe> searchCafe(Connection con, String local, String size, String keyword) {
		
		ArrayList<Cafe> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchCafe");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, local);
			pstmt.setString(2, size);
			pstmt.setString(3, keyword);
			rset = pstmt.executeQuery();
			list = new ArrayList<Cafe>();
			
			while(rset.next()) {
				Cafe c = new Cafe();
				c.setCno(rset.getInt("C_NO"));
				c.setCimage(rset.getString("C_IMAGE"));
				c.setCname(rset.getString("C_NAME"));
				c.setCscore(rset.getDouble("C_SCORE"));
			
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


	public int getSearchListCount(Connection con, String local, String size, String keyword) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchListCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, local);
			pstmt.setString(2, size);
			pstmt.setString(3, keyword);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

}
