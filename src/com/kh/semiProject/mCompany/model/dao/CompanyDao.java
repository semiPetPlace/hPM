package com.kh.semiProject.mCompany.model.dao;

import static com.kh.semiProject.common.JDBCTemplate.close;

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

import com.kh.semiProject.mCompany.exception.CompanyException;
import com.kh.semiProject.mCompany.model.vo.Company;

public class CompanyDao {
	
	private Properties prop;
	
	public CompanyDao() {
		prop = new Properties();
		
		String filePath = CompanyDao.class
				.getResource("/config/company-query.properties").getPath();
		try {
			prop.load(new FileReader(filePath));
		} catch(FileNotFoundException e) {
			e.printStackTrace();
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

	public int enrollCompany(Connection con, Company c) throws CompanyException {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("enrollCompany");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, c.getCategory());
			pstmt.setString(2, c.getcName());
			pstmt.setString(3, c.getcNum());
			pstmt.setString(4, c.getCorp());
			pstmt.setDate(5, c.getEnrollDate());
			pstmt.setString(6, c.getAddress());
			pstmt.setString(7, c.getTel());
			pstmt.setString(8, c.getrName1());
			pstmt.setString(9, c.getrName2());
			pstmt.setString(10, c.getPhone());
			pstmt.setString(11, c.getEmail());
			pstmt.setString(12, c.getBankName());
			pstmt.setString(13, c.getHolder());
			pstmt.setString(14, c.getAccount());
			pstmt.setString(15, c.getState());
			
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			throw new CompanyException(e.getMessage());
//			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Company detailCompany(Connection con, int comNum) {
		Company c = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("detailCompany");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, comNum);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {	
				c = new Company();
				c.setComNum(comNum);
				c.setCategory(rset.getString("category"));
				c.setcName(rset.getString("cName"));
				c.setcNum(rset.getString("cNum"));
				c.setCorp(rset.getString("corp"));
				c.setEnrollDate(rset.getDate("enrollDate"));
				c.setAddress(rset.getString("address"));
				c.setTel(rset.getString("tel"));
				c.setrName1(rset.getString("rName1"));
				c.setrName2(rset.getString("rName2"));
				c.setPhone(rset.getString("phone"));
				c.setEmail(rset.getString("Email"));
				c.setBankName(rset.getString("BankName"));
				c.setHolder(rset.getString("Holder"));
				c.setAccount(rset.getString("Account"));
				c.setState(rset.getString("state"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return c;
	}

	public ArrayList<Company> listCompany(Connection con) {
		ArrayList<Company> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCompany");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			list = new ArrayList<Company>();
			while(rset.next()) {
				Company c = new Company();
				c.setComNum(rset.getInt(1));
				c.setCategory(rset.getString("category"));
				c.setcName(rset.getString("cName"));
				c.setcNum(rset.getString("cNum"));
				c.setCorp(rset.getString("corp"));
				c.setEnrollDate(rset.getDate("enrollDate"));
				c.setAddress(rset.getString("address"));
//						+ ".substring(temp.length()-2, temp.length())"));
				c.setPhone(rset.getString("phone"));
				c.setEmail(rset.getString("Email"));
				c.setBankName(rset.getString("BankName"));
				c.setState(rset.getString("state"));
				
				list.add(c);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

	public ArrayList<Company> searchCompany(Connection con, String categorySearch, String keyword) {
		ArrayList<Company> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = null;
		
		switch(categorySearch) {
		case "cName":
			sql = prop.getProperty("searchNameCompany");
			break;
		case "category":
			sql = prop.getProperty("searchCategoryCompany");
			break;
		case "comNum":
			sql = prop.getProperty("searchComNumCompany");
			break;
		case "address":
			sql = prop.getProperty("searchAddressCompany");
			break;
		case "state":
			sql = prop.getProperty("searchStateCompany");
			break;
		case "enrollDate":
			sql = prop.getProperty("searchEnrollDateCompany");
			break;
		case "phone":
			sql = prop.getProperty("searchPhoneCompany");
			break;
		case "email":
			sql = prop.getProperty("searchEmailCompany");
			break;
		}
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, keyword);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			
			while(rset.next()) {
				Company c = new Company();
				c.setComNum(rset.getInt("comNum"));
				c.setCategory(rset.getString("category"));
				c.setcName(rset.getString("cName"));
				c.setcNum(rset.getString("cNum"));
				c.setCorp(rset.getString("corp"));
				c.setEnrollDate(rset.getDate("enrollDate"));
				c.setAddress(rset.getString("address"));
				c.setPhone(rset.getString("phone"));
				c.setEmail(rset.getString("Email"));
				c.setBankName(rset.getString("BankName"));
				c.setState(rset.getString("state"));
				
				list.add(c);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Company> searchCompany(Connection con) {
		// TODO Auto-generated method stub
		return null;
	}

	public int editCompany(Connection con, Company c) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("editCompany");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, c.getCategory());
			pstmt.setString(2, c.getcName());
			pstmt.setString(3, c.getcNum());
			pstmt.setString(4, c.getCorp());
			pstmt.setDate(5, c.getEnrollDate());
			pstmt.setString(6, c.getAddress());
			pstmt.setString(7, c.getTel());
			pstmt.setString(8, c.getrName1());
			pstmt.setString(9, c.getrName2());
			pstmt.setString(10, c.getPhone());
			pstmt.setString(11, c.getEmail());
			pstmt.setString(12, c.getBankName());
			pstmt.setString(13, c.getHolder());
			pstmt.setString(14, c.getAccount());
			pstmt.setString(15, c.getState());
			pstmt.setInt(16, c.getComNum());
			
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteCompany(Connection con, Company c) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteCompany");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, c.getComNum());
			
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
