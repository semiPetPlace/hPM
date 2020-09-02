package com.kh.semiProject.member.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.semiProject.member.exception.MemberException;
import com.kh.semiProject.member.model.dao.MemberDao;
import com.kh.semiProject.member.model.vo.Member;

public class MemberService { 
	private Connection con;
	private MemberDao mDao = new MemberDao();
	
	public Member selectMember(Member m) throws MemberException {
		
		con = getConnection();
		System.out.println("service 확인");
		Member result = mDao.selectMember(con, m);
		System.out.println(result);
		close(con);

		if(result == null) 
			throw new MemberException("회원 아이디나 비밀번호가 올바르지 않습니다.");  
		
		return result;
	}

	public int insertMember(Member m) throws MemberException {
		con= getConnection();
		
		int result = mDao.insertMember(con,m);
		
		System.out.println(result);
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int updateMember(Member m) throws MemberException {
		con= getConnection();
		
		int result = mDao.updateMember(con,m);
		
		System.out.println(result);
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public int deleteMember(String muserId) throws MemberException {
		con= getConnection();
		
		int result = mDao.deleteMember(con,muserId);
		
		System.out.println(result);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
		
	}

	public int idDupCheck(String mid) {
		Connection con = getConnection();
		int result = mDao.idDupCheck(con,mid);
		
		close(con);
		return result;
	}
}