package com.kh.semiProject.Manager.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.semiProject.Hotel.model.vo.PetHotel;
import com.kh.semiProject.Manager.model.service.ManagerService;
import com.kh.semiProject.cafe.model.vo.Cafe;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class CafeEnrollServlet
 */
@WebServlet("/cEnroll.hj")
public class CafeEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CafeEnrollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int maxSize = 1024*1024*10; // 10MB
		
		if(!ServletFileUpload.isMultipartContent(request)) {

			request.setAttribute("msg", "multipart를 통한 전송이 아닙니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		String root = request.getServletContext().getRealPath("/");
		System.out.println("최상위 경로 : " + root);
	
		String savePath  = root + "resources/images";

		MultipartRequest mrequest = new MultipartRequest(
											request, 
											savePath,
											maxSize,
											"UTF-8",
											new DefaultFileRenamePolicy()
											);
		
		String cname = mrequest.getParameter("cname");
		String ctel = mrequest.getParameter("num1")+"-"
				 + mrequest.getParameter("num2")+"-"
				 + mrequest.getParameter("num3");
		String caddress = mrequest.getParameter("address1")+", "
				 + mrequest.getParameter("address2")+", "
				 + mrequest.getParameter("zipCode");
	    String crimage = mrequest.getFilesystemName("crimage");
	    String cimage = mrequest.getFilesystemName("cimage");
	    String cimage1 = mrequest.getFilesystemName("cimage1");
		String cimage2 = mrequest.getFilesystemName("cimage2");
		String cimage3 = mrequest.getFilesystemName("cimage3");
		String cimage4 = mrequest.getFilesystemName("cimage4");
		String cimage5 = mrequest.getFilesystemName("cimage5");
		cimage += ","+cimage1+","+cimage2+","+cimage3+","+cimage4+","+cimage5;

		String ctime = mrequest.getParameter("ctime");
		String cdogCompInfo = mrequest.getParameter("cdogCompInfo");
		String cpromotion = mrequest.getParameter("cpromotion");
		String crequest = mrequest.getParameter("crequest");
		String date = mrequest.getParameter("date");
		Date cregisterDate = null;
		if(date != "" && date != null) {
			String[] dateArr = date.split("-");
			int[] intArr = new int[dateArr.length];
			
			for(int i=0; i<dateArr.length; i++) {
				intArr[i] = Integer.parseInt(dateArr[i]);
			}
			cregisterDate = new Date(new GregorianCalendar(intArr[0], intArr[1]-1, intArr[2]).getTimeInMillis());
		} else {
			cregisterDate = new Date(new GregorianCalendar().getTimeInMillis());
		}
		String cregistration = mrequest.getParameter("cregistration");
		String cpetSize = mrequest.getParameter("cpetSize");
		Float lat = Float.parseFloat(mrequest.getParameter("lat"));
		Float lng = Float.parseFloat(mrequest.getParameter("lng"));

		// 6. 전송된 파일 VO에 담아 서비스로 전달
		Cafe c = new Cafe();
		c.setCname(cname);
		c.setCtel(ctel);
		c.setCtime(ctime);
		c.setCaddress(caddress);
		c.setCrimage(crimage);
		c.setCimage(cimage);
		c.setCdogCompInfo(cdogCompInfo);
		c.setCpromotion(cpromotion);
		c.setCrequest(crequest);
		c.setCregisterDate(cregisterDate);
		c.setCregistration(cregistration);
		c.setCpetSize(cpetSize);
		c.setLat(lat);
		c.setLng(lng);
		
		System.out.println("업체등록확인 : " + c);
		
		// 7. 서비스 결과 처리
		int result = new ManagerService().enrollCafe(c);
	
		if(result > 0) {
			response.sendRedirect("cList.hj");
			System.out.println("업체 등록 완료");
		}else {
			request.setAttribute("msg", "업체 등록 실패");
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
