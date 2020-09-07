package com.kh.semiProject.member.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

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

	public int deleteMember(String muserId){
		con= getConnection();
		
		int result = mDao.deleteMember(con,muserId);
		
		System.out.println(result);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		System.out.println("service"+result);
		return result;
		
	}

	public int idDupCheck(String mid) {
		Connection con = getConnection();
		int result = mDao.idDupCheck(con,mid);
		
		close(con);
		return result;
	}


	public int createAcount(Member m) {
		Connection con =getConnection();
		int result = mDao.createAcount(con,m);
		
		if(result > 0 )commit(con);
		else rollback(con);
		return result;
	}

	public ArrayList<String> checkId() {
		Connection con = getConnection();
		
		ArrayList<String> idlist = mDao.checkId(con);
		
		if(idlist != null)commit(con);
		else rollback(con);
		return idlist;
	}

	public String findIdMember(String name, String email) {
		con = getConnection();
		String id = mDao.findIdMember(con,name,email);
		close(con);	
		return id;
	}

	public String findPwdMember(String userId, String name, String email) {
		con = getConnection();
		String pwd = mDao.findPwdMember(con,userId,name,email);
		close(con);	
		return pwd;
	}

	public int getListCount() {
		Connection con = getConnection();
		int listCount = mDao.getListCount(con);
		close(con);
		return listCount;
	}

	public ArrayList<Member> memberList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Member> mList  = mDao.memberList(con,currentPage,limit);
		
		if(mList != null) commit(con);
		else rollback(con);
		return mList;
	}


	
}