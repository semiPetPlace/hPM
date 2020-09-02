package com.kh.semiProject.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.semiProject.notice.model.service.NoticeService;
import com.kh.semiProject.notice.model.vo.Notice;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class NoticeUpdateServlet
 */
@WebServlet("/nUpdate.th")
public class NoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateServlet() {
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
		int nno = Integer.parseInt(mrequest.getParameter("bno"));
		
		Notice n = new Notice();
		n.setnNo(nno);
		n.setnTitle(title);
		n.setnContent(content);
		n.setnImg(fileName);
		int result = new NoticeService().updateNotice(n);
		
		if(result > 0) {
			response.sendRedirect("nselectOne.th?nno="+nno);
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
