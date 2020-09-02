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
 * Servlet implementation class CompanyEditViewServlet
 */
@WebServlet("/cEditView.co")
public class CompanyEditViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyEditViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int comNum = Integer.parseInt(request.getParameter("comNum"));
		
		Company c = new CompanyService().editView(comNum);
		
		String page="";
		if(c != null) {
			page = "views/Manager/Manager_company_editForm.jsp";
			request.setAttribute("company", c);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "업체 수정 페이지 연결 실패");
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
