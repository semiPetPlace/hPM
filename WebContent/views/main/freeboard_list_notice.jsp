<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.semiProject.notice.model.vo.*"%>
<%@ page import="com.kh.common.PageInfo" %>
<%
	
	ArrayList<Notice> nlist = (ArrayList<Notice>) request.getAttribute("nlist");
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
<title>공지사항</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/mainpage.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/freeboard_list.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/script.js"></script>

</head>
<body>
	<%@ include file="../common/header.jsp"%>

	<div class="post">
		<img
			src="<%=request.getContextPath()%>/resources/images/freeboard_list/dog_lab.png"
			alt="게시판" id="board-img">
			<% if(m != null && m.getMuserId().equals("admin")){ %>
			 <input type="button" value="글쓰기"
			onclick="location.href='<%=request.getContextPath()%>/views/freeboard/freeboardwrite_notice.jsp'"
			style="float: right; background-color: #ffb600;  color: black;  font-size: 15px; width: 100px; height: 30px; border-radius: 8px; border: 0px solid;"
			>
			<%} %>
		<table>
			<%
				for (Notice n : nlist) {
			%>
			<input type="hidden" value="<%=n.getnNo()%>" />
			<tr>
				<td>
					<div class="post_border">
						<a
							href="<%=request.getContextPath()%>/nselectOne.th?nno=<%=n.getnNo()%>"
							class="postName"><%=n.getnTitle()%></a> <label class="write-date"><%=n.getnDate()%></label>
				</td>
			</tr>
			<tr>
				<td>
					<div class="postImg_border">
						<img src="<%=n.getnImg()%>" class="postImg">
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="postContent">
						<%=n.getnContent()%><a
							href="<%=request.getContextPath()%>/nselectOne.th?nno=<%=n.getnNo()%>">더보기</a>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="postInfo">
						<img src="<%=request.getContextPath()%>/resources/images/review_detail/img1.jpg" class="postInfo_Img"> <label
							class="label_position"><%=n.getnWriter()%></label>
					</div>
				</td>
			</tr>
			<%
				}
			%>
		</table>


		<div id="post_num" style="width: 400px">
			<button id="stp"
				onclick="location.href='<%=request.getContextPath()%>/blist.th?currentPage=1'">◀◀</button>
			<%
				if (currentPage <= 1) {
			%>
			<button disabled>◀</button>
			<%
				} else {
			%>
			<button id="bkp"
				onclick="location.href='<%=request.getContextPath()%>/blist.th?currentPage=<%=currentPage - 1%>'">◀</button>
			<%
				}
			%>
			<%
				int p = 0;
			%>
			<%
				for (p = startPage; p <= endPage; p++) {
					if (p == currentPage) {
			%>
			<button disabled
				style="border: 1px solid #ffb600; color: #ffb600; width: 25px; height: 30px; text-align: center;">
				<%=p%></button>
			<%
				} else {
			%>
			<button id="chp"
				onclick="location.href='<%=request.getContextPath()%>/blist.th?currentPage=<%=p%>'"><%=p%></button>
			<%
				}
			%>
			<%
				}
			%>

			<%
				if (currentPage >= maxPage) {
			%>
			<button disabled>▶</button>
			<%
				} else {
			%>
			<button id="nxp"
				onclick="location.href='<%=request.getContextPath()%>/blist.th?currentPage=<%=currentPage + 1%>'">▶</button>
			<%
				}
			%>
			<button id="mxp"
				onclick="location.href='<%=request.getContextPath()%>/blist.th?currentPage=<%=maxPage%>'">>▶▶</button>

		</div>
	</div>

		<!-- TOP -->
		<div style="height: 20px; margin-right: 2%; margin-top: 200px;">
			<a href="#header" id="top">▲ TOP</a>
		</div>

		<%@include file="../common/footer.jsp"%>
</body>
</html>