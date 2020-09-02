package com.kh.semiProject.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.semiProject.board.model.service.BoardService;
import com.kh.semiProject.board.model.vo.Board;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/bUpdate.th")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int maxSize = 1024*1024*10;
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "multipart를 통한 전송이 아닙니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		String root = request.getServletContext().getRealPath("/");
		System.out.println("최상위 경로 : " + root);
	
		String savePath  = root + "resources/images";
		MultipartRequest mrequest = new MultipartRequest(
				request, 
				savePath,
				maxSize,
				"UTF-8",
				new DefaultFileRenamePolicy()
				);
		String title= mrequest.getParameter("title");
		String content= mrequest.getParameter("content");
		String fileName = mrequest.getFilesystemName("file");
		int bno = Integer.parseInt(mrequest.getParameter("bno"));
		
		Board b = new Board();
		b.setbNo(bno);
		b.setbTitle(title);
		b.setbContent(content);
		b.setbImg(fileName);
		int result = new BoardService().updateBoard(b);
		
		if(result > 0) {
			response.sendRedirect("selectOne.th?bno="+bno);
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
