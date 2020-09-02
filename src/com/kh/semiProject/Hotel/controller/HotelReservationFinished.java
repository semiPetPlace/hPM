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
		int hno = Integer.parseInt(request.getParameter("hno"));
		String rname = request.getParameter("hroom");
		
		HotelService hs = new HotelService();
		
		Hotel hd = hs.selectHotel(hno);
		
		HotelRoom hr = hs.payment(hno,rname);
		
		String page = "";
		if(hr != null) {
			page="views/hotel/hotel_finishedReservation.jsp";
			request.setAttribute("hd", hd);
			request.setAttribute("hr", hr);
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
