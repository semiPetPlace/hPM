package com.kh.semiProject.Manager.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.PageInfo;
import com.kh.semiProject.mQnA.model.service.MtMListService;
import com.kh.semiProject.mQnA.model.service.QnAService;
import com.kh.semiProject.mQnA.model.vo.QnA;

/**
 * Servlet implementation class mtmListView
 */
@WebServlet("/listView.mt")
public class mtmListViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mtmListViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		ArrayList<QnA> qList = null;
		String type = "N";
		QnAService qs = new QnAService();

		int startPage;
		int endPage;
		int maxPage;
		int currentPage;
		int limit;
		
		currentPage = 1;
		limit = 10;
		
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = qs.getListCount(type);
		System.out.println("총 페이지 수 "+listCount);
		
		maxPage = (int)((double)listCount/limit+0.9);
		
		startPage = ((int)((double)currentPage/limit+0.99)-1)*limit+1;
		
		
		endPage = startPage+limit-1;
		if(endPage > maxPage) {
			endPage = maxPage; 
		}
		
		
		
		qList = new MtMListService().viewList(type,currentPage,limit);
		System.out.println("qlist: " + qList);
		String page = "";

		if(qList != null) {
			page = "views/Manager/Manager_mtmList.jsp";
			request.setAttribute("qList", qList);
			PageInfo pi = new PageInfo(currentPage,listCount,limit,maxPage,startPage,endPage);
			request.setAttribute("pi", pi);
		
			
		}else {
			request.setAttribute("msg", "관리자 1:1 문의 완료 리스트 접근 실패");
			page = "views/common/errorPage.jsp";	
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
