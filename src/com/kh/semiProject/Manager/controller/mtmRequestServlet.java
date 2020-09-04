package com.kh.semiProject.Manager.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semiProject.mQnA.model.service.QnAService;
import com.kh.semiProject.mQnA.model.vo.QnA;

/**
 * Servlet implementation class mtmRequestServlet
 */
@WebServlet("/requst.re")
public class mtmRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mtmRequestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qno = Integer.parseInt(request.getParameter("qno"));
		QnA q = new QnAService().qnaRequest(qno);
		
		String page = "";

		if(q != null) {
			request.setAttribute("q", q);
			page = "views/Manager/Manager_mtmrequest.jsp";
		}else {
			request.setAttribute("msg", "관리자 문의 처리 페이지 접근 실패 ");
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
