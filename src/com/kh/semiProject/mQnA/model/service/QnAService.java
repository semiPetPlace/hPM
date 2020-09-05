package com.kh.semiProject.mQnA.model.service;

import com.kh.semiProject.Manager.model.vo.Manager;
import com.kh.semiProject.mQnA.model.dao.QnADao;
import com.kh.semiProject.mQnA.model.vo.QnA;

import static com.kh.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

public class QnAService {

	private QnADao qDao = new QnADao();

	public QnA qnaRequest(int qno) {
		Connection con = getConnection();

		QnA q = qDao.qnaRequest(con,qno);

		if(q != null) commit(con);
		else rollback(con);

		close(con);
		
		return q;
	}

	public int reClear(int qno, String requester, String reText) {
		
		Connection con = getConnection();

		int result = qDao.reClear(con,qno,requester,reText);

		if(result > 0) commit(con);
		else rollback(con);

		close(con);
		
		return result;

	}

	public int sendMessage(int qno) {

		Connection con = getConnection();

		int result = qDao.sendMessage(con,qno);

		if(result > 0) commit(con);
		else rollback(con);

		close(con);
		
		return result;
	}

	public int getListCount(String type) {
		Connection con = getConnection();
		int listCount = qDao.getListCount(con,type);
		close(con);
		return listCount;
	}

	
	
}
