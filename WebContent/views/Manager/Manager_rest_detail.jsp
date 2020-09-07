<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.semiProject.restaurant.model.vo.*" %>
<%
Restaurant r = (Restaurant)request.getAttribute("r");
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
    <style>
    .detailCom table, .detailCom th, .detailCom tr{
    font-size: initial;
    padding: 0px;
	}
	#main{
	height:1700px;
	}
    </style>
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
                        <li><a href="/semi/hList.hj">· 동반 호텔 리스트</a></li>
                        <li><a href="/semi/phList.hj">· 위탁 호텔 리스트</a></li>
                        <li><a href="/semi/cList.hj">· 동반 카페 리스트</a></li>
                        <li><a href="/semi/rList.hj">· 동반 식당 리스트</a></li>
                    </ul>
                </div>
            </div>
            <!-- 여기에 메인 컨텐츠 넣으면 됩니다. -->    
            <div class="content">
                <div class="reservationTable">
                    <p style="font-size: 30px; font-weight: 500px; margin-bottom: 10px;">동반 식당 상세</p>
                    <div class="searchPot"></div>
                    <div class="detailCom" style="border: none; margin-left:100px; width:1000px;">
                        <table border="1">
                        	<tr>
                            <th></th>
                            </tr>
                            <tr>
                                <th>업체 번호</th>
                                 <td>
                                   	<%= r.getRno() %>
                              	</td>
                           	</tr>
                            <tr>
                                <th>식당 명</th>
                                <td>
                                	<%= r.getRname() %>
                                </td>
                            </tr>
							<tr>
								<th>주소지</th>
								<td>
                                       <%= r.getRaddress() %>
                                </td>
							</tr>
							<tr>
                                <th>연락처</th>
                                <td>
                                    <%= r.getRtel() %> 
                                </td>
                            </tr>
                            <tr>
                                <th style="vertical-align:top;">홍보글</th>
                                <td>
                                	<%= r.getRpromotion() %>
                                </td>
                            </tr>
                            <tr>
                                <th style="vertical-align:top;">요청사항</th>
                                <td>
                                    <%= r.getRrequest() %>
                                </td>
                            </tr>
                            <tr>
                                <th style="vertical-align:top;">영업시간</th>
                                <td>
                                    <%= r.getRtime() %>
                                </td>
                            </tr>
                            <tr>
                                <th style="vertical-align:top;  width:150px;">반려견 동반 정보</th>
                                <td>
                                    <%= r.getRdogCompInfo() %>
                                </td>
                            </tr>
                            <tr>
								<th>반려견 사이즈</th>
								<td>
									<%= r.getRpetSize() %>
								</td>
							</tr>
                            <tr>
                            	<th>식당 대표 이미지</th>
								<td>
									<%= r.getRrimage() %>
								</td>
                            </tr>
                            <tr>
                                <th>상세 이미지</th>
                                 <td style="padding:10px 0;" >
									<%= r.getRimage() %>
                                </td>
                            </tr>
                            <tr>
                                <th>위도</th>
                                <td>
                                    <%= r.getLat() %>
                                </td>
                            </tr>
                            <tr>
                                <th>경도</th>
                                <td>
                                    <%= r.getLng() %>
                                </td>
                            </tr>
                            <tr>
                                <th>등록 일</th>
                                <td>
                                    <%= r.getRregisterDate() %>
                                </td>
                            </tr>
                            <tr>
								<th>등록 여부</th>
								<td>
									<%= r.getRregistration() %>
								</td>
							</tr>
							<tr></tr>
							<tr></tr>
							<tr></tr>
                        </table>
		                    <div class="empty">
		                        <br><br><br>
		                    </div>
		                    <div class="btns">
                        <input type="button" value="목록으로" class="preBtn" onclick="location.href='rList.hj'">
                        <input type="submit" value="내용 수정" class="subBtn" onclick="location.href='rEditView.hj?rno=<%=r.getRno()%>'">
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