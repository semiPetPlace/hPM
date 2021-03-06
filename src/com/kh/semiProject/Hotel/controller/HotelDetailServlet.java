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
import com.kh.semiProject.Hotel.model.vo.HotelConvenience;
import com.kh.semiProject.Hotel.model.vo.HotelRoom;
import com.kh.semiProject.review.model.vo.Review;

/**
 * Servlet implementation class HotelDetailServlet
 */
@WebServlet("/hotelDetail.ys")
public class HotelDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HotelDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int h_no = Integer.parseInt(request.getParameter("h_no"));
		String Cin = request.getParameter("checkin");
		String Cout = request.getParameter("checkout");
		ArrayList<HotelRoom> hrlist = new ArrayList<>();
		ArrayList<Review> hreview = new ArrayList<>();
		
		HotelService hs = new HotelService();
		
		Hotel hd = hs.selectHotel(h_no);
	
		hrlist = hs.roomlist(h_no);
		
		HotelConvenience hc = hs.Convenience(h_no);
		
		hreview = hs.hreview(h_no);

		System.out.println(hreview);
		String page ="";
		if(hd != null) {
			page = "views/hotel/hotel_detail.jsp";
			request.setAttribute("hd", hd);
			request.setAttribute("hrlist", hrlist);
			request.setAttribute("hc", hc);
			request.setAttribute("hreview", hreview);

			request.setAttribute("Cin", Cin);
			request.setAttribute("Cout", Cout);
			
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
