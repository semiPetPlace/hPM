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
 * Servlet implementation class UpdateCommentServlet
 */
@WebServlet("/updateComment.th")
public class UpdateCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String content= request.getParameter("content");
		int cmno = Integer.parseInt(request.getParameter("cmno"));
		int bnno = Integer.parseInt(request.getParameter("bnno"));
		String type = request.getParameter("type");
		Comment c = new Comment();
		c.setCmno(cmno);
		c.setCmcontent(content);
		c.setCmtype(type);
		c.setBnno(bnno);
		int result = new CommentService().updateCommnet(c);
		System.out.println(type);
		if(result > 0) {
			if(type.equals("board")) {
				response.sendRedirect("selectOne.th?bno="+bnno);
				}else if(type.equals("notice")) {
				response.sendRedirect("nselectOne.th?nno="+bnno);
				}
		}else {
			request.setAttribute("msg", "게시글 작성 실패");
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
