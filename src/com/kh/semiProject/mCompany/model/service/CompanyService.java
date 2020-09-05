package com.kh.semiProject.mCompany.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semiProject.mCompany.exception.CompanyException;
import com.kh.semiProject.mCompany.model.dao.CompanyDao;
import com.kh.semiProject.mCompany.model.vo.Company;
import static com.kh.common.JDBCTemplate.*;

public class CompanyService {
	
	private Connection con;
	private CompanyDao cDao = new CompanyDao();

	public int enrollCompany(Company c) throws CompanyException {
		con = getConnection();
		
		int result = cDao.enrollCompany(con,c);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public Company detailCompany(int comNum) {
		Connection con = getConnection();
		
		Company c = cDao.detailCompany(con,comNum);
		
		close(con);
		return c;
	}

	public ArrayList<Company> listCompany() {
		Connection con = getConnection();
		
		ArrayList<Company> list = cDao.listCompany(con);
		
		close(con);
		return list;
	}
	
//	public ArrayList<Company> listCompany(int currentPage, int limit) {
//		Connection con = getConnection();
//		
//		ArrayList<Company> list = cDao.listCompany(con, currentPage, limit);
//		
//		close(con);
//		return list;
//	}
	
	public int getListCount() {
		Connection con = getConnection();
		int listCount = cDao.getListCount(con);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Company> searchCompany(String categorySearch, String keyword) {
		Connection con = getConnection();
		ArrayList<Company> list = null;
		
		if(categorySearch.length() > 0) list = cDao.searchCompany(con,categorySearch,keyword);
		else list = cDao.searchCompany(con);
		
		close(con);
		return list;
	}

	public Company editView(int comNum) {
		Connection con = getConnection();
		Company c = cDao.detailCompany(con, comNum);
		
		close(con);
		return c;
	}

	public int editCompany(Company c) {
		Connection con = getConnection();
		
		int result = cDao.editCompany(con,c);
		
		if(result>0) commit(con);
		else rollback(con);
		
		close(con);
		return result;
	}

	public int deleteCompany(Company c) {
		Connection con = getConnection();
		
		int result = cDao.deleteCompany(con,c);
		
		if(result>0) commit(con);
		else rollback(con);
		
		close(con);
		return result;
	}

}
