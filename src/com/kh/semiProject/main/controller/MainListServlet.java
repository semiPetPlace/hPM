package com.kh.semiProject.main.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semiProject.Hotel.model.vo.Hotel;
import com.kh.semiProject.cafe.model.vo.Cafe;
import com.kh.semiProject.main.model.service.MainService;
import com.kh.semiProject.restaurant.model.vo.Restaurant;
//import com.kh.semiProject.restaurant.model.vo.Restaurant;

/**
 * Servlet implementation class MainList
 */
@WebServlet("/mlist.th")
public class MainListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Cafe> clist = null;
		ArrayList<Hotel> hlist = null;
		ArrayList<Restaurant> rlist = null;
		ArrayList<Hotel> plist = null;
		
		MainService ms = new MainService();
		
		clist = ms.selectCafeList();
		hlist = ms.selectHotelList();
		rlist = ms.selectRtList();
		plist = ms.selectPetHotelList();

		
		String page = "";
		if(!hlist.isEmpty() && !clist.isEmpty() && !rlist.isEmpty()) {
			page="views/main/main.jsp";
			request.setAttribute("hlist", hlist);
			request.setAttribute("clist", clist);
			request.setAttribute("rlist", rlist);
			request.setAttribute("plist", plist);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "리스트 불러오기 실패!");
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
