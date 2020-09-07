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
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class PetHotelEnrollServlet
 */
@WebServlet("/phEnroll.hj")
public class PetHotelEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PetHotelEnrollServlet() {
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
		
		String phname = mrequest.getParameter("phname");
		String phtel = mrequest.getParameter("num1")+"-"
				 + mrequest.getParameter("num2")+"-"
				 + mrequest.getParameter("num3");
		int phprice = Integer.parseInt(mrequest.getParameter("phprice"));
		String phaddress = mrequest.getParameter("address1")+", "
				 + mrequest.getParameter("address2")+", "
				 + mrequest.getParameter("zipCode");
	    String img = mrequest.getFilesystemName("img");
	    String dimg = mrequest.getFilesystemName("dimg");
	    String dimg1 = mrequest.getFilesystemName("dimg1");
		String dimg2 = mrequest.getFilesystemName("dimg2");
		String dimg3 = mrequest.getFilesystemName("dimg3");
		String dimg4 = mrequest.getFilesystemName("dimg4");
		String dimg5 = mrequest.getFilesystemName("dimg5");
		dimg += ","+dimg1+","+dimg2+","+dimg3+","+dimg4+","+dimg5;

		String phpromotion = mrequest.getParameter("phpromotion");
		String phrequests = mrequest.getParameter("phrequests");
		String date = mrequest.getParameter("date");
		Date phregisterdate = null;
		if(date != "" && date != null) {
			String[] dateArr = date.split("-");
			int[] intArr = new int[dateArr.length];
			
			for(int i=0; i<dateArr.length; i++) {
				intArr[i] = Integer.parseInt(dateArr[i]);
			}
			phregisterdate = new Date(new GregorianCalendar(intArr[0], intArr[1]-1, intArr[2]).getTimeInMillis());
		} else {
			phregisterdate = new Date(new GregorianCalendar().getTimeInMillis());
		}
		String registration = mrequest.getParameter("registration");
		String lat = mrequest.getParameter("lat");
		String lng = mrequest.getParameter("lng");

		// 6. 전송된 파일 VO에 담아 서비스로 전달
		PetHotel ph = new PetHotel();
		ph.setPhname(phname);
		ph.setPhtel(phtel);
		ph.setPhprice(phprice);
		ph.setPhaddress(phaddress);
		ph.setImg(img);
		ph.setDimg(dimg);
		ph.setPhpromotion(phpromotion);
		ph.setPhrequests(phrequests);
		ph.setPhregisterdate(phregisterdate);
		ph.setRegistration(registration);
		ph.setLat(lat);
		ph.setLng(lng);
		
		System.out.println("업체등록확인 : " + ph);
		
		// 7. 서비스 결과 처리
		int result = new ManagerService().enrollpetHotel(ph);
	
		if(result > 0) {
			response.sendRedirect("phList.hj");
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
