package com.kh.semiProject.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.PageInfo;
import com.kh.semiProject.review.model.service.ReviewService;
import com.kh.semiProject.review.model.vo.Review;

/**
 * Servlet implementation class ListReview2Servlet
 */
@WebServlet("/rvList2.th")
public class ListReview2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListReview2Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Review> rvlist = new ArrayList<Review>();
		ReviewService rs = new ReviewService();
		
		int startPage;
		int endPage;
		int maxPage;
		int currentPage;
		int limit;
		
		currentPage=1;
		limit=12;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = rs.getListCount();
		
		maxPage =   (int)((double)listCount/limit+0.9);
		startPage =  ((int)((double)currentPage/limit+0.99)-1)*limit+1;
		endPage = startPage + limit -1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		int ctno = Integer.parseInt(request.getParameter("ctno"));
		String type = request.getParameter("type");
		System.out.println("start"+startPage);
		rvlist=rs.reviewList(currentPage,limit,ctno,type);
		
		String page ="";
		if(rvlist != null) {
			page="views/review/review_list.jsp";
			request.setAttribute("rvlist", rvlist);
			System.out.println(startPage);
			System.out.println(endPage);
			System.out.println(maxPage);
			PageInfo pi = new PageInfo(currentPage,listCount,limit,maxPage,startPage,endPage);
			request.setAttribute("pi", pi);
			
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "리스트 조회실패!");
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
