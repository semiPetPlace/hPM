package com.kh.semiProject.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semiProject.mypage.model.service.ReservationManaService;
import com.kh.semiProject.mypage.model.vo.ReservationMana;

/**
 * Servlet implementation class basicServlet
 */
@WebServlet("/basic.ys")
public class basicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public basicServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<ReservationMana> reserList = new ArrayList<>();
		
		
		ReservationManaService srs = new ReservationManaService();
		
		reserList = srs.recentReser();
		
		System.out.println(reserList);
		String page = "";
		if(!reserList.isEmpty()) {
			page = "views/mypage/mypage-basic.jsp";
			request.setAttribute("reserList",reserList);
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("reserList",reserList);
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
