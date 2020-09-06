<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"
	import="java.text.*,com.kh.semiProject.member.model.vo.*, java.util.*"%>
<%	Member m = (Member)request.getAttribute("m"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 메인 화면</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Manager-DefaultCSS.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Manager_userData.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	.content {
    width: 80%;
    margin-top: 100px;
    margin-left: 200px;
}
.content:after{
    content:"";
    display:block;
    clear:both;
}
.main-content{
    display: flex;
    /* overflow: auto; */
}
#local, #Company, #filter1{
    height: 22px;
}
#bankName, #pNum1, #pNum2, #pNum3, #conNum1, #conNum2, #conNum3{
    width: 80px;
}
.searchPot{
    width: 1200px;
    height: 15px;
    background: #7A9BAD;
    margin-bottom: 50px;
}
.enrollCom{
    width: 80%;
    margin-left: 15%;
    font-weight: 500;
    font-size: medium;
    margin-top: 80px;
}
#address{
    width: 600px;
}
.enrollCom table,.enrollCom th,.enrollCom tr{
    font-size: medium;
    border-left: 5px inset rgb(136, 151, 163);
}
.preBtn{
    margin-left: 50px;
    margin-right: 10px;
}
#sample6_address{
    margin: 5px 0;
}
.searchCompany{
    width: 100%;
    margin-left: 300px;
    /* border: 1px solid black; */
    font-weight: 500;
    margin-top: 80px;
}
.searchCompany>table{
    width: 50%;
    text-align: left;
    padding-left: 20px;
}
table{
    width: 100%;
    /* border-spacing: 10px; */
}
.searchCompany table,.searchCompany th,.searchCompany tr{
    /* text-align: center; */
    font-size: medium;
    border-left: 5px inset rgb(136, 151, 163);
}
td{
    height: 20px;
    padding-top: 5px;
    padding-left: 10px;
}
tr{
    height: 25px;
}
th{
    text-align: left;
    /* height: 20px; */
    padding-top: 10px;
    padding-left: 60px;
    padding-bottom: 10px;
}
#num{
    width: 50px;
}
#category{
    width: 80px;
}
#name{
   width: 180px;
}
#enrollDate{
    width: 130px;
}
#endDate{
    width: 100px;
}
#tel{
    width: 130px;
}
#now{
    width: 100px;
}
#cont{
    width: 250px;
}
#startDate{
    margin-right: 10px;
}
#num1, #num3{
    width: 50px;
}
#num2{
    width: 30px;
}
.btns{
    width: 50%;
    float: right;
    margin-right: 20%;
    margin-top: 30px;
    margin-bottom: 20px;
}
.enrollBtn{
    margin-right: 10px;
}
.deleteBtn{
    margin-left: 10px;
}
#comNum{
    width: 100px;
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
						<p>회원 관리</p>
						<ul>
							<li><a href="./Manager_company.html">· 전체 업체 목록</a></li>
							<li><a href="./Manager_company_enrollForm.html">· 업체 등록</a></li>
						</ul>
					</div>
				</div>
				<!-- 여기에 메인 컨텐츠 넣으면 됩니다. -->
				<div class="content">
					<div class="reservationTable">
						<p
							style="font-size: 30px; font-weight: 500px; margin-bottom: 10px;">회원
							정보 조회</p>
						<div class="searchPot"></div>
						<div class="enrollCom">
							<table border="1">
								<tr>
									<th>회원 번호</th>
									<td>
										<div class="filter-block"><%=m.getMno() %></div>
									</td>
								</tr>

								<tr>
									<th>회원 명</th>
									<td><%=m.getMuserName() %></td>
								</tr>

								<tr>
									<th>생년월일</th>
									<td><%=m.getMbirth() %></td>
								</tr>
								<tr>
									<th>회원가입 일</th>
									<td><%=m.getmRegisterdate() %></td>
								</tr>
								<tr>
									<th>지역</th>
									<td>인천시</td>
								</tr>
								<tr>
									<th>상세 주소</th>
									<td><%=m.getMaddress() %></td>
								</tr>

								<tr>
									<th>전화번호</th>
									<td><%=m.getTel() %></td>
								</tr>

								<tr>
									<th>휴대전화</th>
									<td><%=m.getMphone() %></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td><%=m.getMemail() %></td>
								</tr>

							</table>
						</div>
						<div class="empty">
							<br>
							<br>
							<br>
						</div>
						<div class="btns">
							<input type="submit" value="회원 삭제" class="deleteBtn"
								onclick="alert('회원 삭제가 완료되었습니다. ')">
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>


	</main>
	<footer id="footer">
		<div id="foot">
			<p style="color: black;">Copyright © 1998-2020 KH Information
				Educational Institute All Right Reserved</p>
		</div>
	</footer>
</body>
</html>