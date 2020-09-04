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
 * Servlet implementation class requestClearServlet
 */
@WebServlet("/Clear.re")
public class requestClearServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public requestClearServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qno =Integer.parseInt(request.getParameter("qno"));
		
		String requester = request.getParameter("requester");
		String reText = request.getParameter("retext");
		int result = new QnAService().reClear(qno,requester,reText);
		

		if(result > 0) {
			response.sendRedirect("mSend.mi?qno="+qno);
		}else {
			request.setAttribute("msg", "답변 저장 실패");
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
