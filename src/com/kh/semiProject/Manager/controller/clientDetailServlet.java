package com.kh.semiProject.Manager.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semiProject.Manager.model.service.ManagerService;
import com.kh.semiProject.Manager.model.vo.Manager;
import com.kh.semiProject.mClient.model.service.ClientService;
import com.kh.semiProject.mClient.model.vo.Client;

/**
 * Servlet implementation class clientDetailServlet
 */
@WebServlet("/cDetail.cl")
public class clientDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public clientDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Client> cList = new ClientService().clientDetail();
		
		
		String page = "";

		if(cList != null) {
			request.setAttribute("cList", cList);
			page = "views/Manager/Manager_sells_C_detail.jsp";
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
