package com.kh.semiProject.mQnA.model.dao;

import static com.kh.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semiProject.mQnA.model.vo.QnA;
public class MtMListDao {

	private Properties prop;

	public MtMListDao() {
		prop = new Properties();

		String filePath = MtMListDao.class.getResource("/config/mtm-query.properties").getPath();

		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	public ArrayList<QnA> viewList(Connection con, String type) {
		ArrayList<QnA> qList = new ArrayList();
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		String sql="";
		if(type.equals("N")) {
			sql = prop.getProperty("viewList");
		}else if(type.equals("Y")){
			sql = prop.getProperty("requestedList");
		}
		try {
			pstmt = con.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			System.out.println(rset);
			
			while(rset.next()) {
				QnA q ;
	
				int qno = rset.getInt("Q_NO");
				String cName = rset.getString("C_NAME");
				String cId = rset.getString("C_ID");
				String qTitle = rset.getString("QNA_TITLE");
				String Qcategory = rset.getString("QNA_CATEGORY");
				Date qDate = rset.getDate("QNA_DATE");
				
				q = new QnA(qno,cName,cId,qTitle,qDate,Qcategory);
				
				System.out.println("dao check: " +q);
				qList.add(q);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return qList;
	}

}
