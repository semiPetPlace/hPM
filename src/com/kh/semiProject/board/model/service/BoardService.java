package com.kh.semiProject.board.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semiProject.board.model.dao.BoardDao;
import com.kh.semiProject.board.model.vo.Board;

public class BoardService {
	private BoardDao bDao= new BoardDao();

	public int getListCount() {
		Connection con = getConnection();
		System.out.println("넘어옴");
		int listCount = bDao.getListCount(con);
		System.out.println(listCount);
		close(con);
		
		return listCount;
	}

	public ArrayList<Board> boardList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Board> blist = new ArrayList<Board>();
		blist=bDao.boardList(con,currentPage,limit);
		
		close(con);
		return blist;
	}

	public Board selectOne(int bno) {
		Connection con = getConnection();
		
		Board b = bDao.selectOne(con,bno);
		close(con);
		return b;
	}

	public int boardDelete(int bno) {
		Connection con =getConnection();
		int result =bDao.boardDelete(con,bno);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int insertBoard(Board b) {
		Connection con = getConnection();
		int result =bDao.insertBoard(con,b);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public Board updateView(int bno) {
		Connection con = getConnection();
		
		Board b = bDao.selectOne(con, bno);
		
		close(con);
		return b;
	}

	public int updateBoard(Board b) {
		Connection con = getConnection();
		int result = bDao.updateBoard(con,b);
		if(result > 0) commit(con);
		else rollback(con);
		return result;
	}


}
