package com.kh.semiProject.mypage.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semiProject.mypage.model.dao.ReservationManaDao;
import com.kh.semiProject.mypage.model.vo.ReservationMana;




public class ReservationManaService {
	
	private ReservationManaDao rDao = new ReservationManaDao();
	
	public ArrayList<ReservationMana> scheduledreser(String userid) {
		Connection con = getConnection();
		
		ArrayList<ReservationMana> reserList = rDao.scheduledreser(con,userid);
		
		close(con);
		return reserList;
	}

	public ArrayList<ReservationMana> finishedReser(String userid) {
		
			Connection con = getConnection();
			
			ArrayList<ReservationMana> reserList = rDao.finishedReser(con,userid);
			
			close(con);
			return reserList;
	}

	public ArrayList<ReservationMana> canceledReser(String userid) {
		Connection con = getConnection();
		
		ArrayList<ReservationMana> reserList = rDao.conceledReser(con,userid);
		
		close(con);
		return reserList;
	}

	public ArrayList<ReservationMana> detailReser(String reserno) {
		Connection con = getConnection();
		
		ArrayList<ReservationMana> reserList = rDao.detailReser(con,reserno);
		
		close(con);
		return reserList;
	}

	public ArrayList<ReservationMana> recentReser() {
		Connection con = getConnection();
		
		ArrayList<ReservationMana> reserList = rDao.recentReser(con);
		
		close(con);
		return reserList;
	}

}
