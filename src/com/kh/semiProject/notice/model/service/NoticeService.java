package com.kh.semiProject.notice.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semiProject.notice.model.dao.NoticeDao;
import com.kh.semiProject.notice.model.vo.Notice;


public class NoticeService {
	private NoticeDao nDao= new NoticeDao();
	
	public int getListCount() {
		Connection con = getConnection();
		System.out.println("넘어옴");
		int listCount = nDao.getListCount(con);
		System.out.println(listCount);
		close(con);
		
		return listCount;
	}

	public ArrayList<Notice> noticeList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Notice> nlist = new ArrayList<Notice>();
		nlist=nDao.boardList(con,currentPage,limit);
		
		close(con);
		return nlist;
	}

	public Notice selectOne(int nno) {
		Connection con =getConnection();
		
		Notice n = nDao.selectOne(con,nno);
		close(con);
		return n;
	}

	public int insertNotice(Notice n) {
		Connection con = getConnection();
		int result =nDao.insertNotice(con,n);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int noticeDelete(int nno) {
		Connection con =getConnection();
		int result =nDao.noticeDelete(con,nno);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public Notice updateView(int nno) {
		Connection con =getConnection();
		
		Notice n = nDao.selectOne(con,nno);
		close(con);
		return n;
	}

	public int updateNotice(Notice n) {
		Connection con = getConnection();
		int result = nDao.updateNotice(con,n);
		if(result > 0) commit(con);
		else rollback(con);
		return result;
	}

}
