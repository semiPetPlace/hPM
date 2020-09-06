package com.kh.semiProject.comment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semiProject.comment.model.service.CommentService;
import com.kh.semiProject.comment.model.vo.Comment;

/**
 * Servlet implementation class CommentInsertServlet
 */
@WebServlet("/cmInsert.th")
public class CommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String writer = request.getParameter("writer");
		int bnno = Integer.parseInt(request.getParameter("bnno"));
		String content=request.getParameter("cwrite");
		int refcno = Integer.parseInt(request.getParameter("refcno"));
		int clevel = Integer.parseInt(request.getParameter("clevel"));
		String type = request.getParameter("type");
		
		Comment bco = new Comment(bnno,type,content,writer,refcno,clevel);
		int result = new CommentService().insertComment(bco);
		
		if(result > 0) {
			System.out.println(type);
			if(type.equals("board")) {
			response.sendRedirect("selectOne.th?bno="+bnno);
			}else if(type.equals("notice")) {
			response.sendRedirect("nselectOne.th?nno="+bnno);
			}
			
		}else {
			request.setAttribute("msg", "댓글 작성 실패!");
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
