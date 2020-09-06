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

		
		// 1. 게시판 페이징 처리하기
		// 페이징 처리 : 
		// 대용량의 데이터를 한 번에 처리하지 않고 
		// 특정 개수만큼 끊어서 처리하는 것
		ArrayList<QnA> qList = null;
		QnAService qs = new QnAService();
		String type = "N";
//		ArrayList<QnA> qList = new MtMListService().viewList(type);
		// 페이징 처리에 필요한 변수들
		// 한 번에 표시할 페이지들 중 가장 앞의 페이지
		int startPage;

		// 한번에 표시할 페이지들 중 가장 뒤의 페이지
		int endPage;
		
		// 전체 페이지의 가장 마지막 페이지
		int maxPage;
		
		// 사용자가 위치한 현재 페이지
		int currentPage;
		
		// 총 페이지 수(한 페이지당 보여줄 게시글 수)
		int limit;
		
		// 처음 접속시 페이지는 1 페이지부터 시작한다.
		
		currentPage = 1;
		
		// 글 개수 및 페이지의 수 10개로 제한
		limit = 10;
		
		// 만약 사용자가 현재 페이지의 정보를 들고 왔다면
		// 현재 페이지의 정보를 1 에서 특정 페이지로 수정해 주어야 한다.
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		// 페이징 처리
		int listCount = qs.getListCount(type);
		System.out.println("총 페이지 수 "+listCount);
		
		// 총 253개
		// 만약 전체 게시글 수가 13개 
		// 페이지는 1,2
		
		maxPage = (int)((double)listCount/limit+0.9);
//		maxPage = (int)Math.ceil((double)listCount/limit);
		
		// 시작 페이지와 마지막 페이지를 계산
		// 1~10
		
		startPage = ((int)((double)currentPage/limit+0.9)-1)*limit+1;
		
		
		endPage = startPage+limit-1;
		if(endPage > maxPage) {
			endPage = maxPage; 
		}
		
		
		
		qList = new MtMListService().viewList(type);
		System.out.println("qlist: " + qList);
		String page = "";

		if(qList != null) {
			page = "views/Manager/Manager_mtmList.jsp";
			PageInfo pi = new PageInfo(currentPage,listCount,limit,maxPage,startPage,endPage);
			request.setAttribute("qList", qList);
			request.setAttribute("pi", pi);
			System.out.println("pi : " + pi);
			
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
