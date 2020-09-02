package com.kh.semiProject.mQnA.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semiProject.mQnA.model.dao.MtMListDao;
import com.kh.semiProject.mQnA.model.vo.QnA;

public class MtMListService {

	MtMListDao mDao = new MtMListDao();

	public ArrayList<QnA> viewList() {
		Connection con = getConnection();
		System.out.println("service check: ");
		ArrayList<QnA> qList  = mDao.viewList(con);
		
		if(qList != null) commit(con);
		else rollback(con);
		return qList;
	}
	

	
}
