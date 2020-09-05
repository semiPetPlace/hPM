package com.kh.semiProject.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.semiProject.review.model.service.ReviewService;
import com.kh.semiProject.review.model.vo.Review;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class UpdateReviewServlet
 */
@WebServlet("/rvUpdate.th")
public class UpdateReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateReviewServlet() {
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
		int rvno = Integer.parseInt(mrequest.getParameter("rvno"));
		
		Review rv = new Review();
		rv.setRvno(rvno);
		rv.setRvtitle(title);
		rv.setRvcontent(content);
		rv.setRvimage(fileName);
		int result = new ReviewService().updateReview(rv);
		System.out.println(result);
		if(result > 0) {
			response.sendRedirect("rvSelectOne.th?rvno="+rvno);
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
