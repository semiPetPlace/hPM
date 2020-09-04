<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%
	String msg = (String)request.getAttribute("msg");
	Exception e = (Exception)request.getAttribute("exception");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Service ERROR</title>
<style>
.outer{
		padding: 20px;
		width: 600px;
		height: 500px;
		margin-left: auto;
		margin-right: auto;
		margin-top: 50px;
		font-size: 30pt;
	}
span {
	font-size: 25pt;
	background: white;
	color: navy;
}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/mainpage.css">
</head>
<body>
<%@ include file="../common/header.jsp" %>
	<div class="outer">
		<h1>서비스 에러 발생!!!</h1>
		<h3 style="color:hotpink;">ERROR : <%= request.getAttribute("msg") %></h3>
		<h4><span>서</span>비스 수행 중 에러가 발생했습니다.<br>
		 전송 값을 확인해 보시고, 이상이 없을 시 부서 담당자에게 연락하시기 바랍니다.</h4>
	</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>