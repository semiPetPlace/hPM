package com.kh.semiProject.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semiProject.member.model.service.MemberService;
import com.kh.semiProject.member.model.vo.Member;

/**
 * Servlet implementation class JoinServlet
 */
@WebServlet("/join.me")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		Member m = new Member();
		String id = request.getParameter("id");
		String pwd = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		String postnum = request.getParameter("zip1");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		
		String address = addr1+" "+addr2+"  ("+postnum+")";
		
		String phone = request.getParameter("hp1")+"-"+request.getParameter("hp2")+"-"+request.getParameter("hp3");		

		String birth = request.getParameter("birth");
		
//		String gender= request.getParameter("gender");
//		System.out.println(gender);
//		if(Integer.parseInt(gender)==1 || Integer.parseInt(gender)==3) gender = "M";
//		else gender = "F";
		String gender = "M";


		
		
		
	
		m.setMuserId(id);
		m.setMuserPwd(pwd);
		m.setMuserName(name);
		m.setMemail(email);
		m.setMaddress(address);
		m.setMphone(phone);
		m.setMbirth(birth);
		m.setMgender(gender);
		
		
		System.out.println(m);
		System.out.println("result : " + result);
		result = new MemberService().createAcount(m);
		
		
		if(result >0) {
			response.sendRedirect("mlist.th");
		}else {
			request.setAttribute("msg", "회원 가입 실패");
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
