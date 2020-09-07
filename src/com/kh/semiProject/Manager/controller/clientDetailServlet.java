package com.kh.semiProject.Manager.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.PageInfo;
import com.kh.semiProject.Manager.model.service.ManagerService;
import com.kh.semiProject.Manager.model.vo.Manager;
import com.kh.semiProject.mClient.model.service.ClientService;
import com.kh.semiProject.mClient.model.vo.Client;
import com.kh.semiProject.mSales.model.service.SalesService;

/**
 * Servlet implementation class clientDetailServlet
 */
@WebServlet("/cDetail.cl")
public class clientDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public clientDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Client> cList ;
		ClientService cs = new ClientService();

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
		
		int listCount = cs.getListCount();
		System.out.println("총 게시물 수 "+listCount);
		
		maxPage = (int)((double)listCount/limit+0.9);
		startPage = ((int)((double)currentPage/limit+0.99)-1)*limit+1;
		
		
		endPage = startPage+limit-1;
		if(endPage > maxPage) {
			endPage = maxPage; 
		}
		
		
		cList = new ClientService().clientDetail(currentPage,limit);
		System.out.println("currentPage : "+currentPage);
		System.out.println("limit : " + limit);
		
		String page = "";
		

		if(cList != null) {
			request.setAttribute("cList", cList);
			page = "views/Manager/Manager_sells_C_detail.jsp";
			PageInfo pi = new PageInfo(currentPage,listCount,limit,maxPage,startPage,endPage);
			request.setAttribute("pi", pi);
		}else {
			request.setAttribute("msg", "관리자 메인 페이지 접근 실패");
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
