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

import com.kh.semiProject.Hotel.model.vo.Hotel;
import com.kh.semiProject.Hotel.model.vo.HotelConvenience;
import com.kh.semiProject.Hotel.model.vo.HotelRoom;
import com.kh.semiProject.Manager.model.service.ManagerService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class HotelEditServlet
 */
@WebServlet("/hEdit.hj")
public class HotelEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HotelEditServlet() {
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
		String hAddress = mrequest.getParameter("address1")+", "
				 + mrequest.getParameter("address2")+", "
				 + mrequest.getParameter("zipCode");
	    String hImg = mrequest.getFilesystemName("hImg");
	    String hImg1 = mrequest.getFilesystemName("hImg1");
		String hImg2 = mrequest.getFilesystemName("hImg2");
		String hImg3 = mrequest.getFilesystemName("hImg3");
		String hImg4 = mrequest.getFilesystemName("hImg4");
		String hImg5 = mrequest.getFilesystemName("hImg5");
		hImg += ","+hImg1+","+hImg2+","+hImg3+","+hImg4+","+hImg5;

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
		float lat = Float.parseFloat(mrequest.getParameter("lat"));
		float lng = Float.parseFloat(mrequest.getParameter("lng"));
		String filter = String.join(",",mrequest.getParameterValues("filter"));
		
		String tansport = mrequest.getParameter("tansport");
		String airport = mrequest.getParameter("airport");
		String location = mrequest.getParameter("location");
		String wifi = mrequest.getParameter("wifi");
		String tub = mrequest.getParameter("tub");
		
		String rname1 = mrequest.getParameter("rname1");
		int rprice1 = Integer.parseInt(mrequest.getParameter("rprice1"));
		String rimg1 = mrequest.getFilesystemName("rimg1");
		String rtub1 = mrequest.getParameter("rtub1");
		String rbreakfast1 = mrequest.getParameter("rbreakfast1");
		String rbadtype1 = mrequest.getParameter("rbadtype1");
		String rsize1 = mrequest.getParameter("rsize1");
		String rview1 = mrequest.getParameter("rview1");

		String rname2 = mrequest.getParameter("rname2");
		int rprice2 = Integer.parseInt(mrequest.getParameter("rprice2"));
		String rimg2 = mrequest.getFilesystemName("rimg2");
		String rtub2 = mrequest.getParameter("rtub2");
		String rbreakfast2 = mrequest.getParameter("rbreakfast2");
		String rbadtype2 = mrequest.getParameter("rbadtype2");
		String rsize2 = mrequest.getParameter("rsize2");
		String rview2 = mrequest.getParameter("rview2");
		//총 29개

		// 6. 전송된 파일 VO에 담아 서비스로 전달
		Hotel h = new Hotel();
		h.sethNo(hNo);
		h.sethName(hName);
		h.sethTel(hTel);
		h.sethPrice(hPrice);
		h.sethGrade(hGrade);
		h.sethAddress(hAddress);
		h.sethImg(hImg);
		h.sethPromotion(hPromotion);
		h.sethRequests(hRequests);
		h.sethRegisterData(hRegisterData);
		h.sethRegistration(hRegistration);
		h.setLat(lat);
		h.setLng(lng);
		h.setFilter(filter);
		
		HotelConvenience hc = new HotelConvenience();
		hc.setTansport(tansport);
		hc.setAirport(airport);
		hc.setLocation(location);
		hc.setWifi(wifi);
		hc.setTub(tub);
		
		HotelRoom hr = new HotelRoom();
		hr.setRname(rname1);
		hr.setRprice(rprice1);
		hr.setRimg(rimg1);
		hr.setRtub(rtub1);
		hr.setRbreakfast(rbreakfast1);
		hr.setRbadtype(rbadtype1);
		hr.setRsize(rsize1);
		hr.setRview(rview1);

		HotelRoom hr2 = new HotelRoom();
		hr2.setRname(rname2);
		hr2.setRprice(rprice2);
		hr2.setRimg(rimg2);
		hr2.setRtub(rtub2);
		hr2.setRbreakfast(rbreakfast2);
		hr2.setRbadtype(rbadtype2);
		hr2.setRsize(rsize2);
		hr2.setRview(rview2);
		
		System.out.println("업체수정확인 : " + h + hc + hr + hr2);
		
		// 7. 서비스 결과 처리
		int result = new ManagerService().editHotel(h,hc,hr,hr2);
	
		if(result > 0) {
			response.sendRedirect("hDetail.hj?hNo=" + hNo);
			System.out.println("업체 수정 완료");
		}else {
			request.setAttribute("msg", "업체 수정 실패");
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
