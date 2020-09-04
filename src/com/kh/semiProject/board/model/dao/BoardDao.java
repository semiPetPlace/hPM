package com.kh.semiProject.board.model.dao;

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
import com.kh.semiProject.search.model.dao.SearchDao;

public class BoardDao {
	private Properties prop;

	public BoardDao() {
		prop = new Properties();
		String filePath = SearchDao.class.getResource("/config/board-query.properties").getPath();

		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Board> boardList(Connection con, int currentPage, int limit) {
		ArrayList<Board> blist = new ArrayList<Board>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("boardlist");

		try {
			pstmt = con.prepareStatement(sql);
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				Board b = new Board();
				b.setbNo(rset.getInt("B_NO"));
				b.setbTitle(rset.getString("B_TITLE"));
				b.setbImg(rset.getString("B_IMG"));
				b.setbDate(rset.getDate("B_DATE"));
				b.setbContent(rset.getString("B_CONTENT"));
				b.setbWriter(rset.getString("USERNAME"));
				b.setStatus(rset.getString("STATUS"));

				blist.add(b);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return blist;
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

	public Board selectOne(Connection con, int bno) {
		Board b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOne");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);

			rset = pstmt.executeQuery();
			if (rset.next()) {
				b = new Board();
				b.setbNo(rset.getInt("B_NO"));
				b.setbTitle(rset.getString("B_TITLE"));
				b.setbContent(rset.getString("B_CONTENT"));
				b.setbWriter(rset.getString("USERNAME"));
				b.setbDate(rset.getDate("B_DATE"));
				b.setbImg(rset.getString("B_IMG"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return b;
	}

	public int boardDelete(Connection con, int bno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteBoard");
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int insertBoard(Connection con, Board b) {
		int result =0;
		PreparedStatement pstmt =null;
		String sql = prop.getProperty("insertBoard");
		String Image = "resources/images/"+b.getbImg();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, b.getbTitle());
			pstmt.setString(2, b.getbContent());
			pstmt.setString(3, b.getbWriter());
			pstmt.setString(4, Image);
			result = pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int updateBoard(Connection con, Board b) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = null;
		String Image = "resources/images/"+b.getbImg();
		if(b.getbImg() !=null) {
			sql = prop.getProperty("updateBoardChangeFile");
		}else {
			sql = prop.getProperty("updateBoard");
		}
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, b.getbTitle());
			pstmt.setString(2, b.getbContent());
			if(b.getbImg() != null) {
				pstmt.setString(3, Image);
				pstmt.setInt(4, b.getbNo());
			}else {
				pstmt.setInt(3, b.getbNo());
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
