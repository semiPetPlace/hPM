package com.kh.semiProject.comment.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.semiProject.comment.model.vo.Comment;

public class CommentDao {
	private Properties prop = new Properties();
	public CommentDao() {
		String filePath = 
				CommentDao.class
				.getResource("/config/comment-query.properties")
				.getPath();
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertComment(Connection con, Comment bco) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertComment");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bco.getBnno());
			pstmt.setString(2, bco.getCmtype());
			pstmt.setString(3, bco.getCmcontent());
			pstmt.setString(4, bco.getCmwriter());
			if(bco.getCmno() > 0) {
				pstmt.setInt(5, bco.getCmno());
			}else { 
				pstmt.setNull(5, java.sql.Types.NULL);
			}
			pstmt.setInt(6, bco.getCm_level());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Comment> selectList(Connection con, int bno) {
		ArrayList<Comment> clist = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			pstmt.setString(2, "board");
			rset = pstmt.executeQuery();
			
			clist = new ArrayList<Comment>();
			
			while(rset.next()) {
				Comment bco = new Comment();
				bco.setCmno(rset.getInt("CM_NO"));
				bco.setCmtype(rset.getNString("CM_TYPE"));
				bco.setCmcontent(rset.getString("CM_CONTENT"));
				bco.setCmwriter(rset.getString("USERNAME"));
				bco.setCmdate(rset.getDate("CM_DATE"));
				bco.setRef_cno(rset.getInt("REF_CNO"));
				bco.setCm_level(rset.getInt("CM_LEVEL"));
				clist.add(bco);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return clist;
	}

	public int deleteComment(Connection con, int cmno) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteComment");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cmno);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int updateComment(Connection con, Comment c) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = null;
			sql = prop.getProperty("updateComment");
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, c.getCmcontent());
			pstmt.setString(2, c.getCmtype());
			pstmt.setInt(3, c.getBnno());
			pstmt.setInt(4, c.getCmno());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Comment> nselectList(Connection con, int nno) {
		ArrayList<Comment> clist = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, nno);
			pstmt.setString(2, "notice");
			rset = pstmt.executeQuery();
			
			clist = new ArrayList<Comment>();
			
			while(rset.next()) {
				Comment bco = new Comment();
				bco.setCmno(rset.getInt("CM_NO"));
				bco.setCmtype(rset.getNString("CM_TYPE"));
				bco.setCmcontent(rset.getString("CM_CONTENT"));
				bco.setCmwriter(rset.getString("USERNAME"));
				bco.setCmdate(rset.getDate("CM_DATE"));
				bco.setRef_cno(rset.getInt("REF_CNO"));
				bco.setCm_level(rset.getInt("CM_LEVEL"));
				clist.add(bco);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return clist;
	}

}
