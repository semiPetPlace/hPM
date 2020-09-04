package com.kh.semiProject.mSales.model.service;


import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semiProject.mSales.model.dao.SalesDao;
import com.kh.semiProject.mSales.model.vo.Hsales;

public class SalesService {

	private SalesDao sDao = new SalesDao(); 
	
	public ArrayList<Hsales> hSalesChart() {
		Connection con = getConnection();
		ArrayList<Hsales> hList = sDao.hSalesChart(con);
		
		if(hList != null) commit(con);
		else rollback(con);
		return hList;
	}

}
