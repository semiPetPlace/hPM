package com.kh.semiProject.Manager.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semiProject.Hotel.model.vo.Hotel;
import com.kh.semiProject.Hotel.model.vo.HotelConvenience;
import com.kh.semiProject.Hotel.model.vo.HotelRoom;
import com.kh.semiProject.Manager.model.service.ManagerService;
import com.kh.semiProject.mCompany.model.service.CompanyService;
import com.kh.semiProject.mCompany.model.vo.Company;

/**
 * Servlet implementation class HotelEditViewServlet
 */
@WebServlet("/hEditView.hj")
public class HotelEditViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HotelEditViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int hNo = Integer.parseInt(request.getParameter("hNo"));
		ArrayList<HotelRoom> list = new ArrayList<>();

		ManagerService ms = new ManagerService();
		
		Hotel h = ms.editViewHotel(hNo);
		
		list = ms.editViewHotelRoom(hNo);
		
		HotelConvenience hc = ms.editViewConvenience(hNo);
		
		
		String page ="";
		
		if(h != null) {
			page = "views/Manager/Manager_hotel_editForm.jsp";
			request.setAttribute("h", h);
			request.setAttribute("hc", hc);
			request.setAttribute("list", list);
		
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
