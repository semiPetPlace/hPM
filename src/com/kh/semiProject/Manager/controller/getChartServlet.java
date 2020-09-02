package com.kh.semiProject.Manager.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semiProject.Manager.model.service.ManagerService;
import com.kh.semiProject.Manager.model.vo.Manager;

/**
 * Servlet implementation class getChartServlet
 */
@WebServlet("/chart.ma")
public class getChartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getChartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Manager machart = new ManagerService().chartView();
		Manager ma = new ManagerService().mainView();
		
		ma.setDaily(machart.getDaily());
		ma.setMontly(machart.getMontly());
		String page = "";

		if(ma != null) {
			request.setAttribute("ma", ma);
			page = "views/Manager/Manager_main.jsp";
		}else {
			request.setAttribute("msg", "관리자 메인 페이지 접근 실패");
			page = "views/common/errorPage.jsp";	
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
