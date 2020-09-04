package com.kh.semiProject.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.semiProject.board.model.service.BoardService;
import com.kh.semiProject.member.exception.MemberException;
import com.kh.semiProject.member.model.service.MemberService;
import com.kh.semiProject.member.model.vo.Member;

/**
 * Servlet implementation class DeleteMemberServlet
 */
@WebServlet("/deleteMember.th")
public class DeleteMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String userId = ((Member)session.getAttribute("member")).getMuserId();
		
		int result = new MemberService().deleteMember(userId);
		
		String page = "";
		if(result != 0) {
			System.out.println("회원 탈퇴성공!");
			session.invalidate();
			response.sendRedirect("index.jsp");
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "회원탈퇴 실패!");
			request.getRequestDispatcher(page).forward(request, response);
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
