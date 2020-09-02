package com.kh.semiProject.mQnA.model.service;

import com.kh.semiProject.Manager.model.vo.Manager;
import com.kh.semiProject.mQnA.model.dao.QnADao;
import com.kh.semiProject.mQnA.model.vo.QnA;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

public class QnAService {

	private QnADao qDao = new QnADao();

	public QnA qnaRequest() {
		Connection con = getConnection();

		QnA q = qDao.qnaRequest(con);

		if(q != null) commit(con);
		else rollback(con);

		close(con);
		
		return q;
	}

	
	
}
