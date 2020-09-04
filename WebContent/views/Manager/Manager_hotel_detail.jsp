<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semiProject.Hotel.model.vo.*"%>
<%
	Hotel h = (Hotel)request.getAttribute("hotel");
	HotelConvenience hc = (HotelConvenience)request.getAttribute("hotelConvenience");
	HotelFacility hf = (HotelFacility)request.getAttribute("hotelFacility");
	HotelRoom hr = (HotelRoom)request.getAttribute("hotelRoom");
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
                        		<th></th>
                        	</tr>
                            <tr>
                                <th>업체 번호</th>
                                <td>
                                    <%= c.getComNum() %>
                               	</td>
                            </tr>
                            <tr>
                                <th>업체 분류</th>
                                <td>
                                    <%= c.getCategory() %>
                                </td>
                            </tr>
                            <tr>
                                <th>사업자번호</th>
                                <td>
                                    <%= c.getcNum() %>
                                </td>
                            </tr>
                            <tr>
                                <th>기업 형태</th>
                                <td>
                                    <%= c.getCorp() %>
                                </td>
                            </tr>
                            <tr>
                                <th>업체 명</th>
                                <td>
                                    <%= c.getcName() %>
                                </td>
                            </tr>
                            <tr>
                                <th>업체 등록 일</th>
                                <td>
                                    <%= c.getEnrollDate() %>
                                </td>
                            </tr>
                            <tr>
								<th>업체 주소</th>
								<td>
                                    <%= c.getAddress() %>
                               </td>
							</tr>
                            <tr>
								<th>업체 연락처</th>
								<td>
                                    <%= c.getTel() %>
                               </td>
							</tr>
                            <tr>
                                <th>대표자</th>
                                <td>
                                    <%= c.getrName1() %>
                                </td>
                            </tr>
                            <tr>
                                <th>담당자</th>
                                <td>
                                	<%= c.getrName1() %>
                                </td>
                            </tr>
                            <tr>
                                <th>담당자 연락처</th>
                                <td>
                                    <%= c.getPhone() %>
                                </td>
                            </tr>
                            <tr>
                                <th>담당자 이메일</th>
                                <td>
                                    <%= c.getEmail() %>
                                </td>
                            </tr>
                            <tr>
                                <th>은행명</th>
                                <td>
                                    <%= c.getBankName() %>
                                </td>
                            </tr>
                            <tr>
                                <th>예금주</th>
                                <td>
                                    <%= c.getHolder() %>
                                </td>
                            </tr>
                            <tr>
                                <th>계좌번호</th>
                                <td>
                                    <%= c.getAccount() %>
                                </td>
                            </tr>
                            <tr>
								<th>등록 상태</th>
								<td>
									<%= c.getState() %>
								</td>
							</tr>
							<tr>
                        		<th></th>
                        	</tr>
                        	<tr>
                        		<th></th>
                        	</tr>
                        </table>
                    </div>
                    <div class="empty">
                        <br>
                    </div>
                    <div class="btns">
                        <input type="button" value="목록으로" class="preBtn" onclick="location.href='hList.hj'">
                        <input type="submit" value="내용 수정" class="subBtn" onclick="location.href='hEditView.hj?hNo=<%=c.getHno()%>'">
                    </div>
                    </div>
                </div>
            </div>
        </div>
	</main>
	<%@ include file = "./Manager_footer.jsp" %>
</body>
</html>