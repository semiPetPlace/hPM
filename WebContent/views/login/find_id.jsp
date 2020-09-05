<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 · 비밀번호 찾기</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/mainpage.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/find id.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/script.js"></script>
</head>

<body>
	<%@ include file="../common/header.jsp"%>

	<% if (id != null) {%>
			<%if (id.equals("null")) {%>
	<script>
	$(document).ready(function() {
		alert("이름,이메일이 일치하는 아이디가 없습니다.");
	});
	</script>
	<%
			} else {
	%>
	<script>
			$(document).ready(function() {
				alert("아이디는 <%=id%>입니다.");
			});	
	</script>
	<%
			}
		}
	%>
	
	<% if (pwd != null) {%>
		<%if (pwd.equals("null")) {%>
	<script>
	$(document).ready(function() {
		alert("일치하는 회원이 없습니다.");
	});
	</script>
	<%
			} else {
	%>
	<script>
			$(document).ready(function() {
				alert("비밀번호는  <%=pwd%>입니다.");
			});	
	</script>
	<%
			}
		}
	%>
	<main id="H_main">
	<div id="main-wrapper">
		<!--아이디찾기시작-->
		<div class="idFind">
			<table class="idTb" id="tableID" style="margin-left: 40%">
				<tbody>
					<tr>

					</tr>
					<tr>
						<td height="30"></td>
					</tr>
					<tr>
						<td align="center" bgcolor="#fff">
							<form id="find_form1" name="find_form1" action="/semi/idFind.th">

								<table border="0" cellpadding="0" cellspacing="0" width="93%";>
									<tbody>
										<tr>
											<img src="../../resources/images/idfind.png" alt=""
												width="200">
											<td height="20" colspan="5"></td>
										</tr>
										<tr>
											<td width="100" height="30" align="left" valign="middle">
												<font color="#666666"
												style="font-size: 11px; FONT-FAMILY: tahoma; letter-spacing: 1px;">
													<b>이름 </b>
											</font>
											</td>
											<td align="left" valign="middle"><input type="text"
												name="name" required="" hname="이름" maxlength="20"
												style="width: 120px; height: 16px;" class="simpleform"
												tabindex="5"></td>
											<td width="20" align="left" valign="middle"></td>
											<td width="30" rowspan="2" align="left" valign="middle"></td>
										</tr>
										<tr>
											<td height="10" align="left" valign="middle"><font
												color="#666666"
												style="font-size: 11px; FONT-FAMILY: tahoma; letter-spacing: 1px;">
													<b>이메일 </b>
											</font></td>
											<td align="left" valign="middle"><input type="text"
												name="email" required="" hname="회원가입시 입력한 이메일 주소"
												maxlength="30" style="width: 170px; height: 16px;"
												class="simpleform" tabindex="2"></td>
											<td width="35" align="left" valign="middle"></td>
										</tr>
										<tr>
											<td height="30" colspan="5"></td>
										</tr>
									</tbody>
								</table>
								<input id="find" class="find"
									src="../../resources/images/button2.jpg" type="image"
									alt="find id">
							</form>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

		<!--아이디찾기끝-->

		<!-- <td width="30" align="right">&nbsp;</td>
            <td align="right" valign="top"> -->

		<!--비밀번호찾기시작-->
		<div class="pwdFind">
			<table class="pwdTb" style="margin-left: 40%">
				<tr>
					<td height="30"></td>
				</tr>
				<tr>
					<td align="center" bgcolor="#fff">
						<form id="find_form2" name="find_form2"
							action="/semi/findPwd.th" autocomplete="off">
							<input type="hidden" name="mode" value="find_passwd">
							<table border="0" cellpadding="0" cellspacing="0" width="90%"
								bgcolor="#fff">
								<tbody>
									<tr>
										&emsp;&emsp;
										<img src="../../resources/images/pwdfind.png" alt=""
											width="200">
										<td height="20" colspan="5"></td>
									</tr>
									<tr>
										<td width="100" height="30" align="left" valign="middle">
											<font color="#666666"
											style="font-size: 11px; FONT-FAMILY: tahoma; letter-spacing: 1px;">
												<b>아이디 </b>
										</font>
										</td>
										<td align="left" valign="middle"><input type="text"
											name="userid" required="" hname="아이디" option="userid"
											maxlength="20" tabindex="4"
											style="width: 120px; height: 16px;" class="simpleform"></td>
										<td width="20" align="left" valign="middle"></td>
										<td width="60" rowspan="3" align="left" valign="middle"></td>
									</tr>

									<tr>
										<td height="30" align="left" valign="middle"><font
											color="#666666"
											style="font-size: 11px; FONT-FAMILY: tahoma; letter-spacing: 1px;">
												<b>이름 </b>
										</font></td>
										<td align="left" valign="middle"><input type="text"
											name="name" required="" hname="이름" maxlength="20"
											tabindex="5" style="width: 120px; height: 16px;"
											class="simpleform"></td>
										<td width="20" rowspan="2" align="left" valign="middle"></td>
									</tr>
									<tr>
										<td height="0" align="left" valign="middle"><font
											color="#666666"
											style="font-size: 11px; FONT-FAMILY: tahoma; letter-spacing: 1px;">
												<b>이메일 </b>
										</font></td>
										<td align="left" valign="middle"><input type="text"
											name="email" required="" hname="회원가입시 입력한 이메일 주소"
											maxlength="30" tabindex="6"
											style="width: 170px; height: 16px;" class="simpleform"></td>
									</tr>
									<tr>
										<td height="30" colspan="5"></td>
									</tr>
								</tbody>
							</table>
							<input id="find" class="find"
								src="../../resources/images/button2.jpg" type="image"
								alt="find pwd">
						</form>
					</td>
				</tr>
				</tbody>
			</table>
		</div>
	</div>
	</main>





	<div style="height: 20px;">
		<a href="#header" id="top">▲ TOP</a>
	</div>

	<%@ include file="../common/footer.jsp"%>
</body>

</html>