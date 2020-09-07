<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.semiProject.Hotel.model.vo.*" %>
<%
	Hotel h = (Hotel)request.getAttribute("h");
	HotelConvenience hc = (HotelConvenience)request.getAttribute("hc");
	HotelRoom hr = (HotelRoom)request.getAttribute("hr");
	HotelRoom hr2 = (HotelRoom)request.getAttribute("hr2");
%>
<!DOCTYPE html>
<html>
<head>
 	<meta charset="UTF-8">
    <title>관리자 메인 화면</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Manager-DefaultCSS.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Manager-company-detail.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>
	<%@ include file = "./Manager_header.jsp" %>
	<main id="main">
    <div id="main-wrapper">
        <div class="main-content">
            <div class="sub-menu">
                <div class="sub-list">
                    <p>업체 관리</p>
                    <ul>
                        <li><a href="/semi/hList.hj">· 위탁 호텔 리스트</a></li>
                        <li><a href="/semi/phList.hj">· 동반 호텔 리스트</a></li>
                        <li><a href="/semi/cList.hj">· 동반 카페 리스트</a></li>
                        <li><a href="/semi/rList.hj">· 동반 식당 리스트</a></li>
                    </ul>
                </div>
            </div>
            <!-- 여기에 메인 컨텐츠 넣으면 됩니다. -->    
            <div class="content">
                <div class="reservationTable">
                    <p style="font-size: 30px; font-weight: 500px; margin-bottom: 10px;">위탁 호텔 상세</p>
                    <div class="searchPot"></div>
                    <div class="detailCom">
                        <table border="1">
                        	<tr>
	                                <th></th>
	                            </tr>
	                            <tr>
	                                <th>업체 번호</th>
	                                 <td>
                                    	<%= h.gethNo() %>
                               		</td>
                            	</tr>
	                            <tr>
	                                <th>호텔 명</th>
	                                <td>
	                                	<%= h.gethName() %>
	                                </td>
	                            </tr>
								<tr>
									<th>주소지</th>
									<td>
                                        <%= h.gethAddress() %>
                                    </td>
								</tr>
								<tr>
	                                <th>연락처</th>
	                                <td>
	                                    <%= h.gethTel() %> 
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>등급 (1~5)</th>
	                                <td>
	                                    <%= h.gethGrade() %>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th style="vertical-align:top;">홍보글</th>
	                                <td>
	                                	<%= h.gethPromotion() %>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th style="vertical-align:top;">요청사항</th>
	                                <td>
	                                    <%= h.gethRequests() %>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>호텔 최저가</th>
	                                <td>
	                                    <%= h.gethPrice() %>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>호텔 이미지</th>
	                                <td style="padding:10px 0;">
										<%= h.gethImg() %>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>위도</th>
	                                <td>
	                                    <%= h.getLat() %>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>경도</th>
	                                <td>
	                                    <%= h.getLng() %>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>부가시설</th>
	                                <td>
	                                	<%= h.getFilter() %>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>등록 일</th>
	                                <td>
	                                    <%= h.gethRegisterData() %>
	                                </td>
	                            </tr>
	                            <tr>
									<th>등록 여부</th>
									<td>
										<%= h.gethRegistration() %>
									</td>
								</tr>
								<tr>
									<th>편의성</th>
									<td><span style="margin-right:80px; font-weight:400;font-size:smaller;">대중교통으로 거리</span>
										<%= hc.getTansport() %>
									</td>
								</tr>
								<tr>
									<th></th>
									<td><span style="margin-right:20px; font-weight:400;font-size:smaller;">공항 이동 교통편 서비스 여부</span>
										<%= hc.getAirport() %>
									</td>
								</tr>
								<tr>
									<th></th>
									<td><span style="margin-right:157px; font-weight:400;font-size:smaller;">위치</span>
										<%= hc.getLocation() %>
									</td>
								</tr>
								<tr>
									<th></th>
									<td><span style="margin-right:97px; font-weight:400;font-size:smaller;">무료 Wi-fi 여부</span>
										<%= hc.getWifi() %>
									</td>
								</tr>
								<tr>
									<th></th>
									<td><span style="margin-right:100px; font-weight:400;font-size:smaller;">온수 욕조 여부</span>
										<%= hc.getTub() %>
									</td>
								</tr>
								<tr></tr>
								<tr></tr>
								<tr>
									<th style="border-top: 2px solid #7A9BAD; margin: 20px;"></th>
								</tr>
								<tr>
									<th>* 객실 - 1</th>
								</tr>
								<tr></tr>
								<tr>
									<th>객실 명</th>
									<td>
										<%= hr.getRname() %>
									</td>
								</tr>
								<tr>
									<th>객실 금액</th>
									<td>
										<%= hr.getRprice() %>
									</td>
								</tr>
								<tr>
									<th>객실 욕조 여부</th>
									<td>
										<%= hr.getRtub() %>
									</td>
								</tr>
								<tr>
									<th>침대 타입</th>
									<td>
										<%= hr.getRbadtype() %>
									</td>
								</tr>
								<tr>
									<th>전망</th>
									<td>
										<%= hr.getRview() %>
									</td>
								</tr>
								<tr>
									<th>객실 사이즈(m2)</th>
									<td>
										<%= hr.getRsize() %>
									</td>
								</tr>
								<tr>
									<th>객실 이미지</th>
									<td>
										<%= hr.getRimg() %>
									</td>
								</tr>
								<tr>
									<th>조식 여부</th>
									<td>
										<%= hr.getRbreakfast() %>
									</td>
								</tr>
								<tr></tr>
								<tr></tr>
								<tr>
									<th>* 객실 - 2</th>
								</tr>
								<tr></tr>
								<tr>
									<th>객실 명</th>
									<td>
										<%= hr2.getRname() %>
									</td>
								</tr>
								<tr>
									<th>객실 금액</th>
									<td>
										<%= hr2.getRprice() %>
									</td>
								</tr>
								<tr>
									<th>객실 욕조 여부</th>
									<td>
										<%= hr2.getRtub() %>
									</td>
								</tr>
								<tr>
									<th>침대 타입</th>
									<td>
										<%= hr2.getRbadtype() %>
									</td>
								</tr>
								<tr>
									<th>전망</th>
									<td>
										<%= hr2.getRview() %>
									</td>
								</tr>
								<tr>
									<th>객실 사이즈(m2)</th>
									<td>
										<%= hr2.getRsize() %>
									</td>
								</tr>
								<tr>
									<th>객실 이미지</th>
									<td>
										<%= hr2.getRimg() %>
									</td>
								</tr>
								<tr>
									<th>조식 여부</th>
									<td>
										<%= hr2.getRbreakfast() %>
									</td>
								</tr>
	                        </table>
		                    <div class="empty">
		                        <br><br><br>
		                    </div>
		                    <div class="btns">
                        <input type="button" value="목록으로" class="preBtn" onclick="location.href='hList.hj'">
                        <input type="submit" value="내용 수정" class="subBtn" onclick="location.href='hEditView.hj?hNo=<%=h.gethNo()%>'">
                    </div>
                    </div>
                </div>
            </div>
        	</div>
        </div>
	</main>
	<%@ include file = "./Manager_footer.jsp" %>
</body>
</html>