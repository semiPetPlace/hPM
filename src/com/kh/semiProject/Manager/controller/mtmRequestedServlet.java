package com.kh.semiProject.Manager.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semiProject.mQnA.model.service.MtMListService;
import com.kh.semiProject.mQnA.model.vo.QnA;

/**
 * Servlet implementation class mtmListView
 */
@WebServlet("/requestedView.mt")
public class mtmRequestedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mtmRequestedServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String type = "Y";
		ArrayList<QnA> qList = new MtMListService().viewList(type);
		
		String page = "";

		if(qList != null) {
			System.out.println(qList);
			request.setAttribute("qList", qList);
			page = "views/Manager/Manager_mtmRequested.jsp";
		}else {
			request.setAttribute("msg", "관리자 1:1 문의 처리 접근 실패");
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
