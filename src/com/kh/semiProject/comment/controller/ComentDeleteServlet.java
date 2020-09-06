package com.kh.semiProject.comment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semiProject.comment.model.service.CommentService;

/**
 * Servlet implementation class ComentDeleteServlet
 */
@WebServlet("/commentDelete.th")
public class ComentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComentDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cmno = Integer.parseInt(request.getParameter("cmno"));
		int bno = Integer.parseInt(request.getParameter("bno"));
		int result = new CommentService().deleteComment(cmno);
		String type = request.getParameter("type");
		
		if(result > 0) {
			if(type.equals("board")) {
			response.sendRedirect("selectOne.th?bno="+bno);
			}else if(type.equals("notice")) {
			response.sendRedirect("nselectOne.th?nno="+bno);
			}
		}else {
			request.setAttribute("msg", "공지사항 삭제 에러!");
			request.getRequestDispatcher("views/common/errorPage.jsp")
			.forward(request, response);
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
