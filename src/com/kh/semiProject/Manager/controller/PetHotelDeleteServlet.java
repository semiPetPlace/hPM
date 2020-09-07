package com.kh.semiProject.Manager.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semiProject.Hotel.model.vo.PetHotel;
import com.kh.semiProject.Manager.model.service.ManagerService;
import com.kh.semiProject.mCompany.model.service.CompanyService;
import com.kh.semiProject.mCompany.model.vo.Company;

/**
 * Servlet implementation class PetHotelDeleteServlet
 */
@WebServlet("/phDelete.hj")
public class PetHotelDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetHotelDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int phno = Integer.parseInt(request.getParameter("phno"));
			String registration = request.getParameter("registration");

			PetHotel ph = new PetHotel();
			
			ph.setPhno(phno);
			ph.setRegistration(registration);
			
			int result = new ManagerService().deletePetHotel(ph);
			
			if(result > 0) {
				response.sendRedirect("phDetail.hj?phno=" + phno);
			} else {
				request.setAttribute("mag", "업체 삭제 에러!");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
