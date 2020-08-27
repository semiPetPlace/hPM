package com.kh.semiProject.cafe.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semiProject.cafe.model.service.CafeService;
import com.kh.semiProject.cafe.model.vo.Cafe;
import com.kh.semiProject.cafe.model.vo.PageInfo;

/**
 * Servlet implementation class cafeListServlet
 */
@WebServlet("/cList.ch")
public class cafeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cafeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Cafe> list = null;
		CafeService cs = new CafeService();

		int startPage;
		int endPage;
		int maxPage;
		int currentPage;
		int limit;
		
		currentPage= 1;
		limit = 10;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = cs.getListCount();
		System.out.println("총 페이지 수 : " + listCount);

		maxPage = (int)((double)listCount / limit + 0.9);
		// 시작 페이지와 마지막 페이지 계산
		// 1~10 : 7
		
		startPage = ((int)((double)currentPage / limit + 0.9) - 1) * limit + 1;
		
		endPage = startPage + limit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		list = cs.selectList(currentPage, limit);
		
		String page = "";
		
		if(list != null) {
			page = "views/cafe/cafe-main.jsp";
			request.setAttribute("list", list);
			
			PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
			request.setAttribute("pi", pi);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 목록 조회 실패!");
		}
		
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
