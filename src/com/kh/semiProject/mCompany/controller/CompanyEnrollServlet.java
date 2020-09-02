package com.kh.semiProject.mCompany.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semiProject.mCompany.exception.CompanyException;
import com.kh.semiProject.mCompany.model.service.CompanyService;
import com.kh.semiProject.mCompany.model.vo.Company;

/**
 * Servlet implementation class CompanyEnrollServlet
 */
@WebServlet("/cEnroll.co")
public class CompanyEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyEnrollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String category = request.getParameter("category");
		String cName = request.getParameter("cName");
		String cNum = request.getParameter("num1")+"-"
				 + request.getParameter("num2")+"-"
				 + request.getParameter("num3");
		String corp = request.getParameter("corp");
		String date = request.getParameter("date");
		Date enrollDate = null;
		if(date != "" && date != null) {
			String[] dateArr = date.split("-");
			int[] intArr = new int[dateArr.length];
			
			for(int i=0; i<dateArr.length; i++) {
				intArr[i] = Integer.parseInt(dateArr[i]);
			}
			enrollDate = new Date(new GregorianCalendar(intArr[0], intArr[1]-1, intArr[2]).getTimeInMillis());
		} else {
			enrollDate = new Date(new GregorianCalendar().getTimeInMillis());
		}
		String address = request.getParameter("address1")+", "
				 + request.getParameter("address2")+", "
				 + request.getParameter("zipCode");
		String tel = request.getParameter("pNum1")+"-"
				 + request.getParameter("pNum2")+"-"
				 + request.getParameter("pNum3");
		String rName1 = request.getParameter("rName1");
		String rName2 = request.getParameter("rName2");
		String phone = request.getParameter("conNum1")+"-"
				 + request.getParameter("conNum2")+"-"
				 + request.getParameter("conNum3");
		String email = request.getParameter("email");
		String bankName = request.getParameter("bankName");
		String holder = request.getParameter("holder");
		String account = request.getParameter("account");
		String state = request.getParameter("state");

		Company c = new Company(category, cName, cNum, corp, enrollDate, address, tel, rName1, rName2, phone, email, bankName, holder, account, state);
		
		System.out.println("업체 등록 확인 : " + c);
		
		// 등록 서비스
		CompanyService cs = new CompanyService();
		
		try {
			cs.enrollCompany(c);
			System.out.println("업체 등록 완료");
			
			response.sendRedirect("cList.co");
		} catch(CompanyException e){
			request.setAttribute("msg", "업체 등록 중 에러 발생");
			request.setAttribute("exception", e);
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
