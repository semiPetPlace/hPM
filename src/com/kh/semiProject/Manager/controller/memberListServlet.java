package com.kh.semiProject.Manager.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.PageInfo;
import com.kh.semiProject.mQnA.model.service.MtMListService;
import com.kh.semiProject.member.model.service.MemberService;
import com.kh.semiProject.member.model.vo.Member;

/**
 * Servlet implementation class memberListServlet
 */
@WebServlet("/mlist.me")
public class memberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService ms = new MemberService();
		ArrayList<Member> mList ;
		
		int startPage;
		int endPage;
		int maxPage;
		int currentPage;
		int limit;
		
		currentPage = 1;
		limit = 10;
		
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = ms.getListCount();
		System.out.println("총 페이지 수 "+listCount);
		
		maxPage = (int)((double)listCount/limit+0.9);
		
		startPage = ((int)((double)currentPage/limit+0.99)-1)*limit+1;
		
		
		endPage = startPage+limit-1;
		if(endPage > maxPage) {
			endPage = maxPage; 
		}
		
		
		
		mList = new MemberService().memberList(currentPage,limit);
		System.out.println("mList: " + mList);
		String page = "";
		
		if(mList != null) {
			page = "views/Manager/Manager_client_list.jsp";
			request.setAttribute("mList", mList);
			PageInfo pi = new PageInfo(currentPage,listCount,limit,maxPage,startPage,endPage);
			request.setAttribute("pi", pi);
		
			
		}else {
			request.setAttribute("msg", "회원관리 리스트 접근 실패");
			page = "views/common/errorPage.jsp";	
		}
		System.out.println(request);
		System.out.println(response);
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
