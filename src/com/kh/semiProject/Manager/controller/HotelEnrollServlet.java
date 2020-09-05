package com.kh.semiProject.Manager.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.semiProject.Hotel.model.vo.Hotel;
import com.kh.semiProject.Hotel.model.vo.HotelConvenience;
import com.kh.semiProject.Hotel.model.vo.HotelRoom;
import com.kh.semiProject.Manager.model.service.ManagerService;
import com.kh.semiProject.mCompany.exception.CompanyException;
import com.kh.semiProject.mCompany.model.vo.Company;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class HotelEnrollServlet
 */
@WebServlet("/hEnroll.hj")
public class HotelEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HotelEnrollServlet() {
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
		int hNo = Integer.parseInt(mrequest.getParameter("hNo"));
		String hName = mrequest.getParameter("hName");
		String hTel = mrequest.getParameter("num1")+"-"
				 + mrequest.getParameter("num2")+"-"
				 + mrequest.getParameter("num3");
		int hPrice = Integer.parseInt(mrequest.getParameter("hPrice"));
		int hGrade = Integer.parseInt(mrequest.getParameter("hGrade"));
		int hScore = Integer.parseInt(mrequest.getParameter("hScore"));
		String hAddress = mrequest.getParameter("address1")+", "
				 + request.getParameter("address2")+", "
				 + request.getParameter("zipCode");
		String hImg = mrequest.getFilesystemName("hImg");
		String hPromotion = mrequest.getParameter("hPromotion");
		String hRequests = mrequest.getParameter("hRequests");
		String date = mrequest.getParameter("date");
		Date hRegisterData = null;
		if(date != "" && date != null) {
			String[] dateArr = date.split("-");
			int[] intArr = new int[dateArr.length];
			
			for(int i=0; i<dateArr.length; i++) {
				intArr[i] = Integer.parseInt(dateArr[i]);
			}
			hRegisterData = new Date(new GregorianCalendar(intArr[0], intArr[1]-1, intArr[2]).getTimeInMillis());
		} else {
			hRegisterData = new Date(new GregorianCalendar().getTimeInMillis());
		}
		String hRegistration = mrequest.getParameter("hRegistration");
		String hLat = mrequest.getParameter("hLat");
		String hLng = mrequest.getParameter("hLng");
		String filter = mrequest.getParameter("filter");
		
		String tansport = mrequest.getParameter("tansport");
		String airport = mrequest.getParameter("airport");
		String location = mrequest.getParameter("location");
		String wifi = mrequest.getParameter("wifi");
		String tub = mrequest.getParameter("tub");
		
		String rname = mrequest.getParameter("rname");
		int rprice = Integer.parseInt(mrequest.getParameter("rprice"));
		String rimg = mrequest.getFilesystemName("rimg");
		String rtub = mrequest.getParameter("rtub");
		String rbreakfast = mrequest.getParameter("rbreakfast");
		String rbadtype = mrequest.getParameter("rbadtype");
		String rsize = mrequest.getParameter("rsize");
		String rview = mrequest.getParameter("rview");
		String rstatus = mrequest.getParameter("rstatus");
		//총 29개

		// 6. 전송된 파일 VO에 담아 서비스로 전달
		Hotel h = new Hotel();
		h.sethName(hName);
		h.sethTel(hTel);
		h.sethPrice(hPrice);
		h.sethGrade(hGrade);
		h.sethScore(hScore);
		h.sethAddress(hAddress);
		h.sethImg(hImg);
		h.sethPromotion(hPromotion);
		h.sethRequests(hRequests);
		h.sethRegisterData(hRegisterData);
		h.sethRegistration(hRegistration);
		h.sethLat(hLat);
		h.sethLng(hLng);
		h.setFilter(filter);
		
		HotelConvenience hc = new HotelConvenience();
		hc.setTansport(tansport);
		hc.setAirport(airport);
		hc.setLocation(location);
		hc.setWifi(wifi);
		hc.setTub(tub);
		
		HotelRoom hr = new HotelRoom();
		hr.setRname(rname);
		hr.setRprice(rprice);
		hr.setRimg(rimg);
		hr.setRtub(rtub);
		hr.setRbreakfast(rbreakfast);
		hr.setRbadtype(rbadtype);
		hr.setRsize(rsize);
		hr.setRview(rview);
		
		System.out.println("업체등록확인 : " + h + hc + hr);
		
		// 7. 서비스 결과 처리
		int result = new ManagerService().enrollHotel(h,hc,hr);
	
		if(result > 0) {
			response.sendRedirect("hList.hj");
			System.out.println("업체 등록 완료");
		}else {
			request.setAttribute("msg", "업체 등록 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}

	}
//		try {
//			hs.enrollHotel(h);
//			System.out.println("업체 등록 완료");
//			
//			response.sendRedirect("hList.hj");
//		} catch(CompanyException e){
//			request.setAttribute("msg", "업체 등록 중 에러 발생");
//			request.setAttribute("exception", e);
//			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
