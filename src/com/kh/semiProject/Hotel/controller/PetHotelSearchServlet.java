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

/**
 * Servlet implementation class PetHotelSearchServlet
 */
@WebServlet("/pethotelsearch.ys")
public class PetHotelSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetHotelSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String area = request.getParameter("area");
		
		HotelService hs = new HotelService();
		
		ArrayList<PetHotel> phlist = new ArrayList<>();
		
		phlist = hs.searchPethotels(area);
		System.out.println(phlist);
		String page = "";
		if(!phlist.isEmpty()) {
			page = "views/main/pet_hotelmain.jsp";
			request.setAttribute("phlist", phlist);
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
