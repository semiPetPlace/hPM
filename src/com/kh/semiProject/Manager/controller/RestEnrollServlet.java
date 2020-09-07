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
import com.kh.semiProject.restaurant.model.vo.Restaurant;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class RestEnrollServlet
 */
@WebServlet("/rEnroll.hj")
public class RestEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RestEnrollServlet() {
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
		
		String rname = mrequest.getParameter("rname");
		String rtel = mrequest.getParameter("num1")+"-"
				 + mrequest.getParameter("num2")+"-"
				 + mrequest.getParameter("num3");
		String raddress = mrequest.getParameter("address1")+", "
				 + mrequest.getParameter("address2")+", "
				 + mrequest.getParameter("zipCode");
	    String rrimage = mrequest.getFilesystemName("rrimage");
	    String rimage = mrequest.getFilesystemName("rimage");
	    String rimage1 = mrequest.getFilesystemName("rimage1");
		String rimage2 = mrequest.getFilesystemName("rimage2");
		String rimage3 = mrequest.getFilesystemName("rimage3");
		String rimage4 = mrequest.getFilesystemName("rimage4");
		String rimage5 = mrequest.getFilesystemName("rimage5");
		rimage += ","+rimage1+","+rimage2+","+rimage3+","+rimage4+","+rimage5;

		String rtime = mrequest.getParameter("rtime");
		String rdogCompInfo = mrequest.getParameter("rdogCompInfo");
		String rpromotion = mrequest.getParameter("rhpromotion");
		String rrequest = mrequest.getParameter("rhrequests");
		String date = mrequest.getParameter("date");
		Date rregisterDate = null;
		if(date != "" && date != null) {
			String[] dateArr = date.split("-");
			int[] intArr = new int[dateArr.length];
			
			for(int i=0; i<dateArr.length; i++) {
				intArr[i] = Integer.parseInt(dateArr[i]);
			}
			rregisterDate = new Date(new GregorianCalendar(intArr[0], intArr[1]-1, intArr[2]).getTimeInMillis());
		} else {
			rregisterDate = new Date(new GregorianCalendar().getTimeInMillis());
		}
		String rregistration = mrequest.getParameter("registration");
		String rpetSize = mrequest.getParameter("cpetSize");
		Float lat = Float.parseFloat(mrequest.getParameter("lat"));
		Float lng = Float.parseFloat(mrequest.getParameter("lng"));

		// 6. 전송된 파일 VO에 담아 서비스로 전달
		Restaurant r = new Restaurant();
		r.setRname(rname);
		r.setRtel(rtel);
		r.setRtime(rtime);
		r.setRaddress(raddress);
		r.setRrimage(rrimage);
		r.setRimage(rimage);
		r.setRdogCompInfo(rdogCompInfo);
		r.setRpromotion(rpromotion);
		r.setRrequest(rrequest);
		r.setRregisterDate(rregisterDate);
		r.setRregistration(rregistration);
		r.setRpetSize(rpetSize);
		r.setLat(lat);
		r.setLng(lng);
		
		System.out.println("업체등록확인 : " + r);
		
		// 7. 서비스 결과 처리
		int result = new ManagerService().enrollRest(r);
	
		if(result > 0) {
			response.sendRedirect("rList.hj");
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
