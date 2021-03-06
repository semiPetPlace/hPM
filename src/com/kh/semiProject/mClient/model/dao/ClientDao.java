package com.kh.semiProject.mClient.model.dao;

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

import com.kh.semiProject.Manager.model.dao.ManagerDao;
import com.kh.semiProject.mClient.model.vo.Client;
import static com.kh.common.JDBCTemplate.*;

public class ClientDao {

	private Properties prop;
	
	public ClientDao() {
		prop = new Properties();
		
		String filePath = ManagerDao.class.getResource("/config/manager-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}
	
	
	public ArrayList<Client> clientDetail(Connection con, int currentPage, int limit) {
		ArrayList<Client> cList = new ArrayList();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("clientList");
		
		try {
			pstmt = con.prepareStatement(sql);
			int startRow = (currentPage-1)*limit+1;
			int endRow = startRow+limit-1;
			
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Client c = new Client();
				
				c.setUserNo(rset.getInt("M_NO")); 
				c.setUserId(rset.getString("M_USERID"));
				c.setUserName(rset.getString("M_USERNAME"));
				c.setReserCount(rset.getInt("RESER_COUNT"));
				c.setReserCountByY(rset.getInt("R_COUNT_Y")); //아직안함
				c.setTotalPrice(rset.getInt("TOTAL"));
				c.setAvePrice(rset.getInt("AVG"));
				c.setCancelcnt(rset.getInt("CANCELCNT"));
				c.setEnrollDate(rset.getDate("M_REGISTERDATE")); 
				c.setStatus(rset.getString("M_STATUS"));
				cList.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return cList;
	}


	public int getListCount(Connection con) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("clientlistCount");
		
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

	
}
