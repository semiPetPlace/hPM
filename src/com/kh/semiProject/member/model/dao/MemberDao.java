package com.kh.semiProject.member.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import javax.xml.crypto.Data;

import com.kh.semiProject.member.exception.MemberException;
import com.kh.semiProject.member.model.dao.MemberDao;
import com.kh.semiProject.member.model.vo.Member;

public class MemberDao {

	private Properties prop;

	public MemberDao() {
		prop= new Properties();

		String filePath = MemberDao.class.getResource("/config/Member-query.properties").getPath();

		try {
			prop.load(new FileReader(filePath));
		}catch(FileNotFoundException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	public Member selectMember(Connection con, Member m) throws MemberException {
		Member result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getMuserId());
			pstmt.setString(2, m.getMuserPwd());

			rset = pstmt.executeQuery();
			System.out.println("123");
			if(rset.next()) {
				result = new Member();
				result.setMno(rset.getString("M_NO"));
				result.setMimg(rset.getString("M_IMG"));
				result.setMuserId(m.getMuserId());
				result.setMuserName(rset.getString("M_USERNAME"));
				result.setMuserPwd(m.getMuserPwd());
				result.setMaddress(rset.getString("M_ADDRESS"));
				result.setMphone(rset.getString("M_PHONE"));
				result.setMemail(rset.getString("M_EMAIL"));
				result.setMgender(rset.getString("M_GENDER"));
				result.setMbirth(rset.getString("M_BIRTH"));
				result.setmRegisterdate(rset.getDate("M_REGISTERDATE"));
				result.setmStatus(rset.getString("M_STATUS"));
			}
		}catch(Exception e) {
			e.printStackTrace();
			throw new MemberException(e.getMessage());
		}finally {
			close(rset);
			close(pstmt);
		}
		System.out.println(result);
		return result;
	}

	public int insertMember(Connection con, Member m) throws MemberException {
		int result =0;
		PreparedStatement pstmt=null;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getMno());
			pstmt.setString(2, m.getMimg());
			pstmt.setString(3, m.getMuserId());
			pstmt.setString(4, m.getMuserPwd());
			pstmt.setString(5, m.getMuserName());
			pstmt.setString(6, m.getMgender());
			pstmt.setString(7, m.getMbirth());
			pstmt.setString(8, m.getMemail());
			pstmt.setString(9, m.getMphone());
			pstmt.setString(10, m.getMaddress());
			
			result = pstmt.executeUpdate();
			
			
		}catch (SQLException e) {
			throw new MemberException(e.getMessage());
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int updateMember(Connection con, Member m) throws MemberException {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, m.getMno());
			pstmt.setString(2, m.getMimg());
			pstmt.setString(3, m.getMuserPwd());
			pstmt.setString(4, m.getMbirth());
			pstmt.setString(5, m.getMemail());
			pstmt.setString(6, m.getMphone());
			pstmt.setString(7, m.getMaddress());
			pstmt.setString(8, m.getMuserId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new MemberException();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteMember(Connection con, java.lang.String muserId) throws MemberException {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(3, muserId);
			
			result=pstmt.executeUpdate();
		}catch (SQLException e) {
			throw new MemberException();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int idDupCheck(Connection con, java.lang.String mid) {
		int result = -1;
		// 에러 : -1
		// 0 : id 중복사용자 없음
		/// 1 : 이미 id 를 누가 사용하고 있음
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("idDupCheck");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(3, mid);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt(3);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

}