package com.kh.semiProject.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.PageInfo;
import com.kh.semiProject.notice.model.service.NoticeService;
import com.kh.semiProject.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeListServlet
 */
@WebServlet("/nList.th")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Notice> nlist = new ArrayList<Notice>();
		NoticeService ns = new NoticeService();
		
		int startPage;
		int endPage;
		int maxPage;
		int currentPage;
		int limit;
		
		currentPage=1;
		limit=5;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = ns.getListCount();
		
		maxPage =   (int)((double)listCount/limit+0.9);
		startPage =  ((int)((double)currentPage/limit+0.9)-1)*limit+1;
		endPage = startPage + limit -1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		nlist=ns.noticeList(currentPage,limit);
		
		String page ="";
		if(nlist != null) {
			page="views/main/freeboard_list_notice.jsp";
			request.setAttribute("nlist", nlist);
			PageInfo pi = new PageInfo(currentPage,listCount,limit,maxPage,startPage,endPage);
			request.setAttribute("pi", pi);
			
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "리스트 조회실패!");
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
