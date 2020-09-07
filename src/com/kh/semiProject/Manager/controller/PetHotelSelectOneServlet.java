package com.kh.semiProject.Manager.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semiProject.Hotel.model.vo.PetHotel;
import com.kh.semiProject.Manager.model.service.ManagerService;

/**
 * Servlet implementation class PetHotelSelectOneServlet
 */
@WebServlet("/phSelectOne.hj")
public class PetHotelSelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetHotelSelectOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int phno = Integer.parseInt(request.getParameter("phno"));

		ManagerService ms = new ManagerService();
		
		PetHotel ph = ms.selectOnepetHotel(phno);
		
		String page ="";
		
		if(ph != null) {
			page = "views/Manager/Manager_pethotel_detail.jsp";
			request.setAttribute("ph", ph);
		
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
