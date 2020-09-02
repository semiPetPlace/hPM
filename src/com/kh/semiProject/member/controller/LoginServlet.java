package com.kh.semiProject.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.semiProject.member.exception.MemberException;
import com.kh.semiProject.member.model.service.MemberService;
import com.kh.semiProject.member.model.vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String muserId = request.getParameter("id");
		String muserPwd= request.getParameter("pwd");
		System.out.println(muserId + ";" + muserPwd);
		Member m = new Member();
		m.setMuserId(muserId);
		m.setMuserPwd(muserPwd);

		MemberService ms = new MemberService();
		
		
		try { // 로그인 성공했을 때 
			m = ms.selectMember(m);
			
			System.out.println("회원 로그인 성공!" + m);
			HttpSession session = request.getSession();
			session.setAttribute("member",m);
			
			response.sendRedirect("index.jsp");
			
		} catch (MemberException e) { // 에러
			request.setAttribute("msg", "회원 로그인 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp") .forward(request,response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
