package com.kh.semiProject.Manager.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.semiProject.Manager.model.dao.ManagerDao;
import com.kh.semiProject.Manager.model.vo.Manager;
public class ManagerService {

	private ManagerDao mDao = new ManagerDao();

	public Manager mainView() {
		Connection con = getConnection();

		Manager ma = mDao.mainView(con);

		if(ma != null) commit(con);
		else rollback(con);

		close(con);
		return ma;
	}

	public Manager chartView() {
		Connection con = getConnection();

		Manager mac = mDao.chartView(con);

		if(mac != null) commit(con);
		else rollback(con);

		close(con);
		return mac;
	}

}
