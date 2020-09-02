package com.kh.semiProject.mQnA.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.semiProject.Manager.model.vo.Manager;
import com.kh.semiProject.mQnA.model.vo.QnA;


public class QnADao {

	private Properties prop;
	
	public QnADao() {
		prop = new Properties();
		
		String filePath = QnADao.class.getResource("/config/mtm-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}

	public QnA qnaRequest(Connection con) {

		QnA q= null;


		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("");

		try {
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				q = new QnA();
			
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return q;
	}
	
	
}
