package com.kh.semiProject.Hotel.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semiProject.Hotel.model.service.HotelService;
import com.kh.semiProject.Hotel.model.vo.Hotel;

/**
 * Servlet implementation class HotelSearchServlet
 */
@WebServlet("/hotelsearch.ys")
public class HotelSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HotelSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String in = request.getParameter("checkin");
		String out = request.getParameter("checkout");
		String area = request.getParameter("area");
		
		HotelService hs = new HotelService();
		
		ArrayList<Hotel> hlist = new ArrayList<>();
		
		hlist = hs.searchHotels(in,out,area);
		
		String page = "";
		if(!hlist.isEmpty()) {
			page = "views/main/hotelmain.jsp";
			request.setAttribute("hlist", hlist);
			request.setAttribute("Cin", in);
			request.setAttribute("Cout", out);
			request.setAttribute("area", area);
		}else {
			page = "views/main/main.jsp";
			System.out.println("되겠냐?");
			
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
