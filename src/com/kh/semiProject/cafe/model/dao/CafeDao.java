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
				c.setCno(rset.getInt("CNO"));
				c.setCimage(rset.getString("CIMAGE"));
				c.setCname(rset.getString("CNAME"));
				c.setCscore(rset.getInt("CSCORE"));
				
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

}
