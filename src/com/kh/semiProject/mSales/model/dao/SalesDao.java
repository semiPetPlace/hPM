package com.kh.semiProject.mSales.model.dao;

import static com.kh.common.JDBCTemplate.*;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semiProject.Manager.model.dao.ManagerDao;
import com.kh.semiProject.mClient.model.vo.Client;
import com.kh.semiProject.mSales.model.vo.Hsales;

public class SalesDao {

	private Properties prop;

	public SalesDao() {
		prop = new Properties();

		String filePath = ManagerDao.class.getResource("/config/sales-query.properties").getPath();

		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public ArrayList<Hsales> hSalesChart(Connection con, int currentPage, int limit) {
		ArrayList<Hsales> hList = new ArrayList();

		PreparedStatement pstmt = null;

		ResultSet rset = null;
		
		String sql = prop.getProperty("hotelChart");

		try {
			pstmt = con.prepareStatement(sql);
			int startRow = (currentPage-1)*limit+1;
			int endRow = startRow+limit-1;
			
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			System.out.println("endRow:"+endRow);
			System.out.println("startRow:"+startRow);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Hsales h = new Hsales();

				h.sethNum(rset.getInt("H_NO")); 
				h.sethName(rset.getString("H_NAME"));
				h.sethLocation(rset.getString("H_ADDRESS"));
				h.setDailyAvg(rset.getInt("DAYLYAVG")); 
				h.setTotalSales(rset.getInt("HSALES")); 
				h.setDailySales(rset.getInt("DAILY_SALES"));
				h.setMontlySales(rset.getInt("MONTHLY_SALES"));
				h.setYearlySales(rset.getInt("YEARLY_SALES"));
				h.setEnrolldate(rset.getDate("H_REGISTERDATE"));
				hList.add(h);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}

		return hList;
	}


}
