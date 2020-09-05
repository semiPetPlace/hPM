package com.kh.semiProject.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semiProject.review.model.service.ReviewService;
import com.kh.semiProject.review.model.vo.Review;

/**
 * Servlet implementation class UpdateViewReviewServlet
 */
@WebServlet("/rvUpView.th")
public class UpdateViewReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateViewReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rvno = Integer.parseInt(request.getParameter("rvno"));
		Review rv = new ReviewService().updateView(rvno);
		
		String page = "";
		if(rv != null) {
			page = "views/review/review_update.jsp";
			request.setAttribute("review", rv);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 수정 페이지 조회 실패!");
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
