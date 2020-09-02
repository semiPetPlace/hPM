package com.kh.semiProject.mCompany.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semiProject.mCompany.model.service.CompanyService;
import com.kh.semiProject.mCompany.model.vo.Company;

/**
 * Servlet implementation class CompanyEditServlet
 */
@WebServlet("/cEdit.co")
public class CompanyEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyEditServlet() {
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
		int comNum = Integer.parseInt(request.getParameter("comNum"));

		Company c = new Company();
		
		c.setComNum(comNum);
		c.setCategory(category);
		c.setcName(cName);
		c.setcNum(cNum);
		c.setCorp(corp);
		c.setEnrollDate(enrollDate);
		c.setAddress(address);
		c.setTel(tel);
		c.setrName1(rName1);
		c.setrName2(rName2);
		c.setPhone(phone);
		c.setEmail(email);
		c.setBankName(bankName);
		c.setHolder(holder);
		c.setAccount(account);
		c.setState(state);
		
		int result = new CompanyService().editCompany(c);
		
		if(result > 0) {
			response.sendRedirect("cDetail.co?comNum=" + comNum);
		} else {
			request.setAttribute("mag", "공지사항 수정 실패!");
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
