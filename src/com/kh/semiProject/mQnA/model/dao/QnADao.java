package com.kh.semiProject.mQnA.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.mail.MessagingException;

import com.kh.semiProject.Manager.controller.SendMail;
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

	public QnA qnaRequest(Connection con, int qno) {

		QnA q= new QnA();


		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOne");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qno);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				q.setQno(qno);
				q.setQnaTitle(rset.getString("QNA_TITLE"));
				q.setClientName(rset.getString("C_NAME"));
				q.setClientEmail(rset.getString("C_EMAIL"));
				q.setQnaDate(rset.getDate("QNA_DATE"));
				q.setQnaText(rset.getString("QNA_TEXT"));
				q.setReDate(rset.getDate("RE_DATE"));
				
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return q;
	}

	public int reClear(Connection con, int qno, String requester, String reText) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("clearRequest");

		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,requester);
			pstmt.setString(2, reText);
			pstmt.setInt(3, qno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return result;
	}

	public int sendMessage(Connection con, int qno) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("requestData");
		
		try {
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			QnA q = new QnA();
			if(rset.next()) {
			q.setQnaTitle(rset.getString("QNA_TITLE"));
			q.setQnaText(rset.getString("QNA_TEXT"));
			q.setQnaDate(rset.getDate("QNA_DATE"));
			q.setRequester(rset.getString("REQUESTER"));
			q.setReText(rset.getString("RE_TEXT"));
			q.setReDate(rset.getDate("RE_DATE"));
			}
			
			new SendMail().sendMessage(q);
			
			result = 1;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return result;
	}
	
	
}
