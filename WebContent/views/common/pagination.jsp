<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.common.PageInfo" %>
<%
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pagination 페이징 처리</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/pagination.css">
</head>
<body>

	<div class="list_number">
		<button id="stp">◀◀</button>
		<% if (currentPage <= 1) { %>
		<button disabled>◀</button>
		<% } else { %>
		<button id="bkp">◀</button>
		<% }%>
		<%int p=0;%>
		<% for ( p = startPage; p <= endPage; p++) {
			if (p == currentPage) { %>
		<button disabled
			style="border: 1px solid #ffb600; color: #ffb600; width: 25px; height: 30px; text-align: center;">
			<%= p %></button>
		<% } else { %>
		<button id="chp"><%= p %></button>
		<% } %>
		<% } %>

		<% if (currentPage >= maxPage) { %>
		<button disabled>▶</button>
		<% } else { %>
		<button id="nxp">▶</button>
		<% } %>
		<button id="mxp">▶▶</button>
	</div>
</body>
</html>