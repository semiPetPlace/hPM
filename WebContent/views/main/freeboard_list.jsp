<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.semiProject.board.model.vo.*"%>
<%
	ArrayList<Board> blist = (ArrayList<Board>) request.getAttribute("blist");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판</title>
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
			<input type="button" value="글쓰기" onclick="location.href='<%=request.getContextPath()%>/views/freeboard/freeboardwrite.jsp'" >
		<table id="listArea">
			<%
				for (Board b : blist) {
			%>
			<input type="hidden" value="<%= b.getbNo() %>"/>
			<tr>
				<td>
					<div class="post_border">
						<a href="<%=request.getContextPath()%>/selectOne.th?bno=<%=b.getbNo() %>" class="postName"><%=b.getbTitle()%></a> <label
							class="write-date"><%=b.getbDate()%></label>
				</td>
			</tr>
			<tr>
				<td>
					<div class="postImg_border">
						<img src="<%=b.getbImg()%>" class="postImg">
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="postContent">
						<%=b.getbContent()%>
						<a href="<%=request.getContextPath()%>/selectOne.th?bno=<%=b.getbNo() %>">더보기</a>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="postInfo">
						<img src="<%=b.getbUserImg()%>" class="postInfo_Img"> <label
							class="label_position"><%=b.getbWriter()%></label>
					</div>
				</td>
				</div>
			</tr>
			<%
				}
			%>


		</table>

	<%@ include file ="../common/pagination.jsp" %>
	</div>
	
	<script>
	<% int p = startPage; %>
	$('#stp').click(function(){
		location.href='<%= request.getContextPath() %>/blist.th?currentPage=1';
	});
	$('#bkp').click(function(){
		location.href='<%= request.getContextPath() %>/blist.th?currentPage=<%= currentPage - 1 %>';
	});
	$('#chp').click(function(){
		location.href='<%= request.getContextPath() %>/blist.th?currentPage=<%= p %>';
	});
	$('#nxp').click(function(){
		location.href='<%= request.getContextPath() %>/blist.th?currentPage=<%= currentPage + 1 %>';
	});
	$('#mxp').click(function(){
		location.href='<%= request.getContextPath() %>/blist.th?currentPage=<%= maxPage %>';
	});	
		$(function() {
		  $('#listArea td')			
		});
	</script>

	<!-- TOP -->
	<div style="height: 20px; margin-right: 2%; margin-top: 200px;">
		<a href="#header" id="top">▲ TOP</a>
	</div>


	<%@ include file="../common/footer.jsp"%>
</body>
</html>