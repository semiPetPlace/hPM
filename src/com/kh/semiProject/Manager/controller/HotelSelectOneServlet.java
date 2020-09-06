package com.kh.semiProject.Manager.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semiProject.Hotel.model.vo.*;
import com.kh.semiProject.Manager.model.service.ManagerService;



/**
 * Servlet implementation class HotelSelectOneServlet
 */
@WebServlet("/hSelectOne.hj")
public class HotelSelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HotelSelectOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int hNo = Integer.parseInt(request.getParameter("hNo"));

		ManagerService ms = new ManagerService();
		
		Hotel h = ms.selectOneHotel(hNo);
		
		HotelRoom hr = ms.selectOneRoom(hNo);
		
		HotelRoom hr2 = ms.selectOneRoom2(hNo);
		
		HotelConvenience hc = ms.selectOneConvenience(hNo);
		
		String page ="";
		
		if(h != null) {
			page = "views/hotel/hotel_detail.jsp";
			request.setAttribute("h", h);
			request.setAttribute("hc", hc);
			request.setAttribute("hr", hr);
			request.setAttribute("hr2", hr2);
		
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "업체 상세 보기 실패");
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
