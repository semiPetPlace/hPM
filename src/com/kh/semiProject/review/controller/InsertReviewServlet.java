package com.kh.semiProject.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.semiProject.board.model.service.BoardService;
import com.kh.semiProject.review.model.service.ReviewService;
import com.kh.semiProject.review.model.vo.Review;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class InsertReviewServlet
 */
@WebServlet("/rvInsert.th")
public class InsertReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int maxSize = 1024*1024*10; // 10MB
		

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

		// 5-1. 기본 전송값 처리하기
		String title= mrequest.getParameter("title");
		String content= mrequest.getParameter("content");
		String writer = mrequest.getParameter("userId");
		int score = Integer.parseInt(mrequest.getParameter("star-input"));
		int cno = Integer.parseInt(mrequest.getParameter("cno"));
		System.out.println("cno="+cno);
		String type = mrequest.getParameter("type");
		System.out.println("type=" + type);
		// 5-2. 전송된 파일 처리하기
		String fileName = mrequest.getFilesystemName("file");
		
		// 6. 전송된 파일 VO에 담아 서비스로 전달
		Review r = new Review();
		r.setRvtitle(title);
		r.setRvcontent(content);
		r.setRvwriter(writer);
		r.setRvimage(fileName);
		r.setRvtype(type);
		r.setRvScore(score);
		r.setCtno(cno);
		// 7. 서비스 결과 처리
		int result = new ReviewService().insertReview(r);
	
		if(result > 0) {
			response.sendRedirect("rvList.th");
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
