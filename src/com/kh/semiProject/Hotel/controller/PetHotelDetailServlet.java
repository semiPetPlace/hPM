package com.kh.semiProject.Hotel.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semiProject.Hotel.model.service.HotelService;
import com.kh.semiProject.Hotel.model.vo.PetHotel;
import com.kh.semiProject.review.model.vo.Review;

/**
 * Servlet implementation class PetHotelDetailServlet
 */
@WebServlet("/pethoteldetail.ys")
public class PetHotelDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetHotelDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ph_no = Integer.parseInt(request.getParameter("ph_no"));
		ArrayList<Review> phreview = new ArrayList<>();
		
		HotelService hs = new HotelService();
		
	
		
		PetHotel ph = hs.pethotelDetail(ph_no);
		
		phreview = hs.phreview(ph_no);
		String page ="";
		if(ph != null) {
			page = "views/pethotel/pet_hotel_detail.jsp";
			request.setAttribute("ph", ph);
			request.setAttribute("phreview", phreview);
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
