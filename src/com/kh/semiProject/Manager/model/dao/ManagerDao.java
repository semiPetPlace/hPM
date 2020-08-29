package com.kh.semiProject.Manager.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.semiProject.Manager.model.vo.Manager;
import static common.JDBCTemplate.*;
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

}
