package com.kh.semiProject.mQnA.model.service;

import static com.kh.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semiProject.mQnA.model.dao.MtMListDao;
import com.kh.semiProject.mQnA.model.vo.QnA;
import com.kh.semiProject.member.model.vo.Member;

public class MtMListService {

	MtMListDao mDao = new MtMListDao();

	public ArrayList<QnA> viewList(String type, int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<QnA> qList  = mDao.viewList(con,type,currentPage,limit);
		
		if(qList != null) commit(con);
		else rollback(con);
		return qList;
	}


	

	
}
