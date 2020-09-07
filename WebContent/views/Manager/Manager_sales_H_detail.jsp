<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.*" import= "com.kh.common.*,java.text.*,com.kh.semiProject.mSales.model.vo.*, java.util.*"%>
<%	
	ArrayList<Hsales> hList = (ArrayList<Hsales>)request.getAttribute("hList");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관리자 메인 화면</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Manager_sales_H_detail.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Manager-DefaultCSS.css">
</head>
<body>
    <%@ include file = "./Manager_header.jsp" %>

<main id="main">
    <div id="main-wrapper">
        <div class="main-content">
            <div class="sub-menu">
                <div class="sub-list">
                    <p>예약.결제관리</p>
                    <ul>
                        <li><a href="#" >· 호텔별 매출 상세</a></li>
                        <li><a href="#" onclick="goCDetail()">· 고객별 매출 상세</a></li>
                    </ul>
                </div>
            </div>
            <div class="content">
                <div class="reservationTable">
                    <p style="font-size: 30px; font-weight: 500px; margin-bottom: 10px;">호텔별 매출 상세</p>
                    <div class="searchPot"> </div>
                    <div class="filter-block">
                        <select name="filter" id="filter">
                            <option value="hotel">호텔 명</option>
                            <option value="hotelnum">호텔 번호</option>
                            <option value="hoteltype">호텔 타입</option>
                            <option value="location">지역</option>
                        </select>
                    </div>

                    <div class="reservationList">
                        <table class="detailedTable">
                            <th class="listTitle" id="hNum">호텔 번호</th>
                            <th class="listTitle" id="hName">호텔 명</th>
                            <th class="listTitle" id="hLocation">지역</th>
                            <th class="listTitle" id="dailySales">당일매출</th>
                            <th class="listTitle" id="dailyAvg">일 평균매출</th>
                            <th class="listTitle" id="montlySales">월 매출</th>
                            <th class="listTitle" id="yearthSales">연 매출</th>
                            <th class="listTitle" id="enrollDate">등록일</th>

                           <%for(Hsales h : hList){ %>
                            <tr class="listCal" id="trh">
                                <td><%= h.gethNum() %></td>
                                <td><%= h.gethName() %></td>
                                <td><%= h.gethLocation() %></td>
                                <td><%= h.getDailySales() %></td>
                                <td><%= h.getDailyAvg() %></td>
                                <td><%= h.getMontlySales() %></td>
                                <td><%= h.getYearlySales() %></td>
                                <td><%= h.getEnrolldate() %></td>
                            </tr> 
                         <%} %>
                       
                        </table>
       	<div class="pagingArea" align="center">
			<button onclick="location.href='<%= request.getContextPath() %>/viewChart.hs?currentPage=1'"><<</button>
			<%  if(currentPage <= 1){  %>
			<button disabled><</button>
			<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/viewChart.hs?currentPage=<%=currentPage - 1 %>'"><</button>
			<%  } %>
			
			<% for(int p = startPage; p <= endPage; p++){
					if(p == currentPage){	
			%>
				<button disabled><%= p %></button>
			<%      }else{ %>
				<button onclick="location.href='<%= request.getContextPath() %>/viewChart.hs?currentPage=<%= p %>'"><%= p %></button>
			<%      } %>
			<% } %>
				
			<%  if(currentPage >= maxPage){  %>
			<button disabled>></button>
			<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/viewChart.hs?currentPage=<%=currentPage + 1 %>'">></button>
			<%  } %>
			<button onclick="location.href='<%= request.getContextPath() %>/viewChart.hs?currentPage=<%=maxPage %>'">>></button>
			
		</div>
                        
                    </div>
                    
                </div>

                <div class="empty">
                    <br><br><br>
                </div>
            </div>
        </div>
    </div>
</main>
<footer id="footer">
    <div id="foot">
        <p style="color: rgb(131, 131, 131);">Copyright © 1998-2020 KH Information Educational Institute All Right Reserved</p>
    </div>
</footer>
<script>
	function goCDetail(){
		location.href="/semi/cDetail.cl";
	}
</script>
</body>
</html>