package com.kh.semiProject.Manager.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semiProject.Manager.model.service.ManagerService;
import com.kh.semiProject.cafe.model.vo.Cafe;
import com.kh.semiProject.restaurant.model.vo.Restaurant;

/**
 * Servlet implementation class RestSelectOneServlet
 */
@WebServlet("/rSelectOne.hj")
public class RestSelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestSelectOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rno = Integer.parseInt(request.getParameter("rno"));

		ManagerService ms = new ManagerService();
		
		Restaurant r = ms.selectOnerest(rno);
		
		String page ="";
		
		if(r != null) {
			page = "views/Manager/Manager_rest_detail.jsp";
			request.setAttribute("r", r);
		
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
