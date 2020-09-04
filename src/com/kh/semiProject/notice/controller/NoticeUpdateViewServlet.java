package com.kh.semiProject.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semiProject.notice.model.service.NoticeService;
import com.kh.semiProject.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeUpdateViewServlet
 */
@WebServlet("/nUpView.th")
public class NoticeUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int nno = Integer.parseInt(request.getParameter("nno"));
		Notice n = new NoticeService().updateView(nno);
		
		String page = "";
		if(n != null) {
			page = "views/freeboard/freeboardupdate_notice.jsp";
			request.setAttribute("notice", n);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 수정 페이지 조회 실패!");
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