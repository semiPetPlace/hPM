package com.kh.semiProject.mClient.model.service;

import static com.kh.common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semiProject.mClient.model.dao.ClientDao;
import com.kh.semiProject.mClient.model.vo.Client;

public class ClientService {
	private ClientDao cDao = new ClientDao();
	
	public ArrayList<Client> clientDetail(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Client> cList = cDao.clientDetail(con,currentPage,limit);
		
		if(cList != null) commit(con);
		else rollback(con);
		return cList;
	}

	public int getListCount() {
		Connection con = getConnection();
		int listCount = cDao.getListCount(con);
		
		close(con);
		
		return listCount;
	}

}
