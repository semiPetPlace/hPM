package com.kh.semiProject.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semiProject.board.model.service.BoardService;
import com.kh.semiProject.board.model.vo.Board;

/**
 * Servlet implementation class BoardUpdateView
 */
@WebServlet("/bUpView.th")
public class BoardUpdateView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		Board b = new BoardService().updateView(bno);
		
		String page = "";
		if(b != null) {
			page = "views/freeboard/freeboardupdate.jsp";
			request.setAttribute("board", b);
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
