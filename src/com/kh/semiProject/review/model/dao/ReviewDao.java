package com.kh.semiProject.review.model.dao;

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
import com.kh.semiProject.review.model.vo.Review;
import com.kh.semiProject.search.model.dao.SearchDao;

public class ReviewDao {
	private Properties prop;

	public ReviewDao() {
		prop = new Properties();
		String filePath = SearchDao.class.getResource("/config/review-query.properties").getPath();

		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public int insertReview(Connection con, Review r) {
		int result =0;
		PreparedStatement pstmt =null;
		String sql = prop.getProperty("insertReview");
		String Image = "resources/images/"+r.getRvimage();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, r.getCtno());
			pstmt.setString(2, r.getRvtype());
			pstmt.setString(3, r.getRvwriter());
			pstmt.setString(4, r.getRvtitle());
			pstmt.setString(5, r.getRvcontent());
			pstmt.setInt(6, r.getRvScore());
			pstmt.setString(7, Image);
			result = pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int getListCount(Connection con) {
		int listCount = 0;
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
	public ArrayList<Review> reviewList(Connection con, int currentPage, int limit) {
		ArrayList<Review> rvlist = new ArrayList<Review>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("riviewlist");

		try {
			pstmt = con.prepareStatement(sql);
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				Review rv = new Review();
				rv.setRvno(rset.getInt("RV_NO"));
				rv.setCtno(rset.getInt("CT_NO"));
				rv.setRvtitle(rset.getString("RV_TITLE"));
				rv.setRvimage(rset.getString("RV_IMAGE"));
				rv.setRvdate(rset.getDate("RV_DATE"));
				rv.setRvScore(rset.getInt("RV_SCORE"));
				rv.setRvtype(rset.getString("RV_TYPE"));
				rv.setRvcontent(rset.getString("RV_CONTENT"));
				rv.setRvwriter(rset.getString("USERNAME"));
				rv.setRvstatus(rset.getString("RV_STATUS"));

				rvlist.add(rv);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return rvlist;
	}
	public Review selectOne(Connection con, int rvno) {
		Review rv = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOne");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rvno);

			rset = pstmt.executeQuery();
			if (rset.next()) {
				rv = new Review();
				rv.setRvno(rset.getInt("RV_NO"));
				rv.setCtno(rset.getInt("CT_NO"));
				rv.setRvtitle(rset.getString("RV_TITLE"));
				rv.setRvimage(rset.getString("RV_IMAGE"));
				rv.setRvdate(rset.getDate("RV_DATE"));
				rv.setRvScore(rset.getInt("RV_SCORE"));
				rv.setRvtype(rset.getString("RV_TYPE"));
				rv.setRvcontent(rset.getString("RV_CONTENT"));
				rv.setRvwriter(rset.getString("USERNAME"));
				rv.setRvstatus(rset.getString("RV_STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return rv;
	}
	public int boardDelete(Connection con, int rvno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteBoard");
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, rvno);
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int updateReview(Connection con, Review rv) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = null;
		String Image = "resources/images/"+rv.getRvimage();
		if(rv.getRvimage() !=null) {
			sql = prop.getProperty("updateReviewChangeFile");
		}else {
			sql = prop.getProperty("updateReview");
		}
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rv.getRvtitle());
			pstmt.setString(2, rv.getRvcontent());
			if(rv.getRvimage() != null) {
				pstmt.setString(3, Image);
				pstmt.setInt(4, rv.getRvno());
			}else {
				pstmt.setInt(3, rv.getRvno());
			}
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	public ArrayList<Review> reviewList(Connection con, int currentPage, int limit, int ctno, String type) {
		ArrayList<Review> rvlist = new ArrayList<Review>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("riviewlist2");

		try {
			pstmt = con.prepareStatement(sql);
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setInt(1,ctno);
			pstmt.setString(2, type);
			pstmt.setInt(3, endRow);
			pstmt.setInt(4, startRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				Review rv = new Review();
				rv.setRvno(rset.getInt("RV_NO"));
				rv.setCtno(rset.getInt("CT_NO"));
				rv.setRvtitle(rset.getString("RV_TITLE"));
				rv.setRvimage(rset.getString("RV_IMAGE"));
				rv.setRvdate(rset.getDate("RV_DATE"));
				rv.setRvScore(rset.getInt("RV_SCORE"));
				rv.setRvtype(rset.getString("RV_TYPE"));
				rv.setRvcontent(rset.getString("RV_CONTENT"));
				rv.setRvwriter(rset.getString("USERNAME"));
				rv.setRvstatus(rset.getString("RV_STATUS"));

				rvlist.add(rv);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return rvlist;
	}

}
