package com.kh.semiProject.mCompany.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semiProject.mCompany.model.service.CompanyService;
import com.kh.semiProject.mCompany.model.vo.Company;

/**
 * Servlet implementation class CompanySearchServlet
 */
@WebServlet("/searchCompany.co")
public class CompanySearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanySearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				// 검색 카데고리
				String categorySearch = request.getParameter("con");
				// 검색 키워드
				String keyword = request.getParameter("keyword");
				
				String page = "";
				ArrayList<Company> list = new ArrayList<>();
				
				
				if(categorySearch.equals("total")) {
					list = new CompanyService().listCompany();
				} else {
					list = new CompanyService().searchCompany(categorySearch,keyword);
				}
				
				System.out.println(list);
				if(list != null) {	// 조회 성공 시
					page = "views/Manager/Manager_company_list.jsp";
					request.setAttribute("list", list);
				} else {
					page = "views/common/errorPage.jsp";
					request.setAttribute("msg", "공지사항 검색 실패!");
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
