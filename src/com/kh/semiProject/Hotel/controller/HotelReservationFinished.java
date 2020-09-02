package com.kh.semiProject.Hotel.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semiProject.Hotel.model.service.HotelService;
import com.kh.semiProject.Hotel.model.vo.Hotel;
import com.kh.semiProject.Hotel.model.vo.HotelConvenience;
import com.kh.semiProject.Hotel.model.vo.HotelFacility;
import com.kh.semiProject.Hotel.model.vo.HotelRoom;

/**
 * Servlet implementation class HotelReservationFinished
 */
@WebServlet("/reservationfinished.ys")
public class HotelReservationFinished extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HotelReservationFinished() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("예약완료서블릿 시작");
		int hno = Integer.parseInt(request.getParameter("hno"));
		String rname = request.getParameter("hroom");
		String petnum = (request.getParameter("petnum"));
		String guestname = request.getParameter("guestname");
		String email = request.getParameter("email");
		String checkintime =request.getParameter("checkintime");
		String guestrequest = request.getParameter("guestrequest");
		String Cin = request.getParameter("checkin");
		String Cout = request.getParameter("checkout");
		String breakfast = request.getParameter("breakfast");
		
		HotelService hs = new HotelService();
		
		Hotel hd = hs.selectHotel(hno);
		
		HotelRoom hr = hs.payment(hno,rname);
		
		
		
		String page = "";
		if(hr != null) {
			page="views/hotel/hotel_finishedReservation.jsp";
			request.setAttribute("hd", hd);
			request.setAttribute("hr", hr);
			request.setAttribute("petnum", petnum);
			request.setAttribute("guestname", guestname);
			request.setAttribute("email", email);
			request.setAttribute("checkintime", checkintime);
			request.setAttribute("guestrequest", guestrequest);
			request.setAttribute("Cin", Cin);
			request.setAttribute("Cout", Cout);
			request.setAttribute("breakfast", breakfast);
			System.out.println("예약완료 서블릿 도착");
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
