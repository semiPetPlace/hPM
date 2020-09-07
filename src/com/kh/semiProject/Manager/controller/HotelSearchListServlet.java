package com.kh.semiProject.Manager.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semiProject.Hotel.model.vo.Hotel;
import com.kh.semiProject.Manager.model.service.ManagerService;

/**
 * Servlet implementation class HotelSearchListServlet
 */
@WebServlet("/hSearch.hj")
public class HotelSearchListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HotelSearchListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 검색 카데고리
		String categorySearch = request.getParameter("con");
		// 검색 키워드
		String keyword = request.getParameter("keyword");
		
		String page = "";
		ArrayList<Hotel> list = new ArrayList<>();
		ManagerService ms = new ManagerService();
		
		int startPage;
		int endPage;
		int maxPage;
		int currentPage;
		int limit;
		
		currentPage = 1;
		limit = 10;

		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = ms.getListCount1();
		System.out.println("총 페이지 수 : " + listCount);

		maxPage = (int)((double)listCount / limit + 0.9);
		// 시작 페이지와 마지막 페이지 계산
		// 1~10 : 7
		
		startPage = ((int)((double)currentPage / limit + 0.9) - 1) * limit + 1;
		
		endPage = startPage + limit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		if(categorySearch.equals("total")) {
			list = ms.listHotel(currentPage, limit);
		} else {
			list = ms.searchHotel(categorySearch,keyword);
		}
		
		System.out.println(list);
		if(list != null) {	// 조회 성공 시
			page = "views/Manager/Manager_hotel_list.jsp";
			request.setAttribute("list", list);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 검색 실패!");
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
