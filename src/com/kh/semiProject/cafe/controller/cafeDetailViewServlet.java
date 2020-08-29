package com.kh.semiProject.cafe.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semiProject.cafe.model.service.CafeService;
import com.kh.semiProject.cafe.model.vo.Cafe;

/**
 * Servlet implementation class cafeDetailView
 */
@WebServlet("/cView.ch")
public class cafeDetailViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cafeDetailViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		Cafe c = new CafeService().selectOne(cno);
		
		String page = "";
		
		if(c != null) {
			page = "views/cafe/cafe_detailpage.jsp";
			request.setAttribute("cafe", c);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 상세 보기 실패!");
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
