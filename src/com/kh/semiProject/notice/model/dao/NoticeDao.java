package com.kh.semiProject.notice.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semiProject.board.model.vo.Board;
import com.kh.semiProject.notice.model.vo.Notice;
import com.kh.semiProject.search.model.dao.SearchDao;

public class NoticeDao {
	private Properties prop;

	public NoticeDao() {
		prop = new Properties();
		String filePath = SearchDao.class.getResource("/config/notice-query.properties").getPath();

		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public int getListCount(Connection con) {
		int listCount = 0;
		System.out.println(listCount);
		Statement stmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("listCount");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);

			if (rset.next()) {
				listCount = rset.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}
	public ArrayList<Notice> boardList(Connection con, int currentPage, int limit) {
		ArrayList<Notice> nlist = new ArrayList<Notice>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("noticelist");

		try {
			pstmt = con.prepareStatement(sql);
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				Notice n = new Notice();
				n.setnNo(rset.getInt("N_NO"));
				n.setnTitle(rset.getString("N_TITLE"));
				n.setnImg(rset.getString("N_IMG"));
				n.setnDate(rset.getDate("N_DATE"));
				n.setnContent(rset.getString("N_CONTENT"));
				n.setnWriter(rset.getString("USERNAME"));
				n.setStatus(rset.getString("STATUS"));

				nlist.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return nlist;
	}
	public Notice selectOne(Connection con, int nno) {
		Notice n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, nno);
			
			rset = pstmt.executeQuery();
			rset = pstmt.executeQuery();
			if (rset.next()) {
				n = new Notice();
				n.setnNo(rset.getInt("N_NO"));
				n.setnTitle(rset.getString("N_TITLE"));
				n.setnContent(rset.getString("N_CONTENT"));
				n.setnWriter(rset.getString("USERNAME"));
				n.setnDate(rset.getDate("N_DATE"));
				n.setnImg(rset.getString("N_IMG"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(rset);
		}
		return n;
	}
	public int insertNotice(Connection con, Notice n) {
		int result =0;
		PreparedStatement pstmt =null;
		String sql = prop.getProperty("insertNotice");
		String Image = "resources/images/"+n.getnImg();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, n.getnTitle());
			pstmt.setString(2, n.getnContent());
			pstmt.setString(3, n.getnWriter());
			pstmt.setString(4, Image);
			result = pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int noticeDelete(Connection con, int nno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteNotice");
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, nno);
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int updateNotice(Connection con, Notice n) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = null;
		String Image = "resources/images/"+n.getnImg();
		if(n.getnImg() !=null) {
			sql = prop.getProperty("updateNoticeChangeFile");
		}else {
			sql = prop.getProperty("updateNotice");
		}
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, n.getnTitle());
			pstmt.setString(2, n.getnContent());
			if(n.getnImg() != null) {
				pstmt.setString(3, Image);
				pstmt.setInt(4, n.getnNo());
			}else {
				pstmt.setInt(3, n.getnNo());
			}
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}


}
