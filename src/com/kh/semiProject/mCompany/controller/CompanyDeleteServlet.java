package com.kh.semiProject.mCompany.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semiProject.mCompany.model.service.CompanyService;
import com.kh.semiProject.mCompany.model.vo.Company;

/**
 * Servlet implementation class CompanyDeleteServlet
 */
@WebServlet("/cDelete.co")
public class CompanyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int comNum = Integer.parseInt(request.getParameter("comNum"));
		String state = request.getParameter("state");

		Company c = new Company();
		
		c.setComNum(comNum);
		c.setState(state);
		
		int result = new CompanyService().deleteCompany(c);
		
		if(result > 0) {
			response.sendRedirect("cDetail.co?comNum=" + comNum);
		} else {
			request.setAttribute("mag", "공지사항 삭제 에러!");
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
