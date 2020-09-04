package com.kh.semiProject.restaurant.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.PageInfo;
import com.kh.semiProject.restaurant.model.service.RestaurantService;
import com.kh.semiProject.restaurant.model.vo.Restaurant;

/**
 * Servlet implementation class searchRestaurantServlet
 */
@WebServlet("/rSearch.ch")
public class searchRestaurantServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchRestaurantServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 검색 카테고리
		String local = request.getParameter("local");
		String size = request.getParameter("size");
		// 검색 키워드
		String keyword = request.getParameter("keyword");
		
		// 페이징 처리
		int startPage;
		int endPage;
		int maxPage;
		int currentPage;
		int limit;
		
		currentPage = 1;
		limit = 9;
		
		ArrayList<Restaurant> list = new ArrayList<>();
		list = new RestaurantService().searchRestaurant(local, size, keyword, currentPage, limit);
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = new RestaurantService().getSearchListCount(local, size, keyword);
		System.out.println("총 페이지 수 : " + listCount);

		maxPage = (int)((double)listCount / limit + 0.9);
		// 시작 페이지와 마지막 페이지 계산
		// 1~10 : 7
		
		startPage = ((int)((double)currentPage / limit + 0.9) - 1) * limit + 1;
		
		endPage = startPage + limit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		
		String page = "";
		
		if(list != null) {
			page = "views/restaurant/restaurant_main.jsp";
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
