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
		String page = "";
		ArrayList<Hotel> hlist = new ArrayList<>();
		
		if(request.getParameterValues("filter") != null) {
			String in = request.getParameter("hdcin");
			String out = request.getParameter("hdcout");
			String area = request.getParameter("hdarea");
			
			String[] checkArr = request.getParameterValues("filter");
			System.out.println(checkArr.length);
			HotelService hs = new HotelService();
			
			
			

			hlist = hs.filteredHotel(in,out,area,checkArr);
			

			
			if(!hlist.isEmpty()) {
				page = "views/main/hotelmain.jsp";
				request.setAttribute("hlist", hlist);
				request.setAttribute("Cin", in);
				request.setAttribute("Cout", out);
				request.setAttribute("area", area);
			}else {
				page = "views/main/hotelmain.jsp";
				
				
			}
			request.getRequestDispatcher(page).forward(request, response);
		}else if(request.getParameterValues("filter") == null){
			String in = request.getParameter("checkin");
			String out = request.getParameter("checkout");
			String area = request.getParameter("area");

			HotelService hs = new HotelService();

			
			hlist = hs.searchHotels(in,out,area);
			
			System.out.println(hlist);
			if(!hlist.isEmpty()) {
				page = "views/main/hotelmain.jsp";
				request.setAttribute("hlist", hlist);
				request.setAttribute("Cin", in);
				request.setAttribute("Cout", out);
				request.setAttribute("area", area);
			}else {
				page = "views/main/hotelmain.jsp";
				
				
			}
			request.getRequestDispatcher(page).forward(request, response);
		}else {
			page = "views/main/hotelmain.jsp";
			request.getRequestDispatcher(page).forward(request, response);
		}
		 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
