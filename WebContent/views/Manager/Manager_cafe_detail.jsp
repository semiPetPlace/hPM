<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.semiProject.cafe.model.vo.*" %>
<%
	Cafe c = (Cafe)request.getAttribute("c");
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
                    <p style="font-size: 30px; font-weight: 500px; margin-bottom: 10px;">동반 카페 상세</p>
                    <div class="searchPot"></div>
                    <div class="detailCom" style="border: none;">
                        <table border="1">
                        	<tr>
	                            <th></th>
	                            </tr>
	                            <tr>
	                                <th>업체 번호</th>
	                                 <td>
                                    	<%= c.getCno() %>
                               		</td>
                            	</tr>
	                            <tr>
	                                <th>호텔 명</th>
	                                <td>
	                                	<%= c.getCname() %>
	                                </td>
	                            </tr>
								<tr>
									<th>주소지</th>
									<td>
                                        <%= c.getCaddress() %>
                                    </td>
								</tr>
								<tr>
	                                <th>연락처</th>
	                                <td>
	                                    <%= c.getCtel() %> 
	                                </td>
	                            </tr>
	                            <tr>
	                                <th style="vertical-align:top;">홍보글</th>
	                                <td>
	                                	<%= c.getCpromotion() %>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th style="vertical-align:top;">요청사항</th>
	                                <td>
	                                    <%= c.getCrequest() %>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th style="vertical-align:top;">영업시간</th>
	                                <td>
	                                    <%= c.getCtime() %>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th style="vertical-align:top;">반려견 동반 정보</th>
	                                <td>
	                                    <%= c.getCdogCompInfo() %>
	                                </td>
	                            </tr>
	                            <tr>
									<th>반려견 사이즈</th>
									<td>
										<%= c.getCpetSize() %>
									</td>
								</tr>
	                            <tr>
	                                <th>카페 대표 이미지</th>
	                                 <td style="padding:10px 0;">
										<%= c.getCrimage() %>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>상세 이미지</th>
	                                 <td style="padding:10px 0;">
										<%= c.getCimage() %>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>위도</th>
	                                <td>
	                                    <%= c.getLat() %>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>경도</th>
	                                <td>
	                                    <%= c.getLng() %>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>등록 일</th>
	                                <td>
	                                    <%= c.getCregisterDate() %>
	                                </td>
	                            </tr>
	                            <tr>
									<th>등록 여부</th>
									<td>
										<%= c.getCregistration() %>
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
                        <input type="button" value="목록으로" class="preBtn" onclick="location.href='cList.hj'">
                        <input type="submit" value="내용 수정" class="subBtn" onclick="location.href='cEditView.hj?cno=<%=c.getCno()%>'">
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