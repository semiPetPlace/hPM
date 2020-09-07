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
 * Servlet implementation class UpdateMemberServlet
 */
@WebServlet("/upMember.th")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pwd = request.getParameter("password");
		String phone=request.getParameter("phone1")+"-"
				   + request.getParameter("phone2")+"-"
				   + request.getParameter("phone3");
		String address=request.getParameter("zip")+", "
			     + request.getParameter("address1")+", "
			     + request.getParameter("address2");
		String email = request.getParameter("email1")+"@"+request.getParameter("email2");
		
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("member");
		
		m.setMuserPwd(pwd);
		m.setMphone(phone);
		m.setMaddress(address);
		m.setMemail(email);
		
		System.out.println("변경한 회원 정보 확인 : " + m);
		
		MemberService ms = new MemberService();
		try {
			ms.updateMember(m);
			System.out.println("회원 정보 수정 완료!");
			session.setAttribute("member", m);
			session.invalidate();
			response.sendRedirect("index.jsp");
			
		}catch(MemberException e) {
			e.printStackTrace();
			request.setAttribute("msg", "회원 정보 수정 중 에러 발생!");
			request.setAttribute("exception", e);
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
