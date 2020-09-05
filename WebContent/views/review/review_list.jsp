<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="com.kh.semiProject.review.model.vo.*"%>
<%@ page import="com.kh.common.PageInfo"%>
<%
	ArrayList<Review> rvlist = (ArrayList<Review>) request.getAttribute("rvlist");
PageInfo pi = (PageInfo) request.getAttribute("pi");
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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내가쓴 게시글</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/mainpage.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/review_list.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/pagination.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/script.js"></script>
</head>
<body>
	<%@ include file="../common/header.jsp"%>


	<div id="main">
		<div id="reviewlist_top">
			<img src="<%=request.getContextPath()%>/resources/images/review_list/review-board.png"
				alt="플레이스 리뷰">
		</div>
		<div id="review_list_content">
			<table id="review_list">
			<%
				int rvnum = 1;
				for(Review rv : rvlist){
			%>
			<input type="hidden" value="<%=rv.getRvno()%>"/>
			<% if(rvnum%4==1){ %>
				<tr class="review_row">
				<%} %>
				
					<td>
						<div class="review1" onclick="location.href='<%=request.getContextPath()%>/rvSelectOne.th?rvno=<%=rv.getRvno()%>'">
						<img src="<%=rv.getRvimage()%>"
								class="reviewImg" style="width: 250px;">
							<div class="review_content">
								<label><%=rv.getRvtitle()%></label>
								<div style="word-break:break-all;
								 overflow: hidden;background: white;"><%=rv.getRvcontent()%></div> 
							</div>
						</div>
					</td>
				<% if(rvnum%4==0){ %>
				</tr>
				<%
				rvnum=0;
					}
				rvnum++; } %>
			</table>
		</div>
	</div>
<div class="list_number" align="center">
			<button onclick="location.href='<%= request.getContextPath() %>/rvList.th?currentPage=1'">◀◀</button>
			<%  if(currentPage <= 1) {  %>
			<button disabled>◀</button>
			<%  }else { %>
			<button onclick="location.href='<%= request.getContextPath() %>/rvList.th?currentPage=<%= currentPage - 1 %>'">◀</button>
			<%  } %>
			
			<% for(int p = startPage; p <= endPage; p++) {
					if(p == currentPage) {	
			%>
				<button disabled style="border: 1px solid #ffb600; color: #ffb600;"><%= p %></button>
			<%      }else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/rvList.th?currentPage=<%= p %>'"><%= p %></button>
			<%      } %>
			<% } %>
				
			<%  if(currentPage >= maxPage) {  %>
			<button disabled>▶</button>
			<%  }else { %>
			<button onclick="location.href='<%= request.getContextPath() %>/rvList.th?currentPage=<%= currentPage + 1 %>'">▶</button>
			<%  } %>
			<button onclick="location.href='<%= request.getContextPath() %>/rvList.th?currentPage=<%= maxPage %>'">▶▶</button>
			</div>
	<!-- TOP -->
	<div style="height: 20px; margin-right: 2%;">
		<a href="#header" id="top">▲ TOP</a>
	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>