<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.semiProject.member.model.vo.*"%>
    
<%
	Member m = (Member) session.getAttribute("member");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>main</title>
</head>
<body>
	<header id="header">        
            <div class="H_menu_top">
                <div class="wrapper">
       				<%
					if (m == null) {
				%>
				<a href="<%=request.getContextPath() %>/views/login/login.jsp">로그인</a> <a
					href="<%=request.getContextPath() %>/views/login/sing-up1.jsp">회원가입</a>

				<%
					} else if (m.getMuserId().equals("admin")) {
				%>


				
				<a> <%=m.getMuserName()%></a>
				<a href="#" onclick="goManager()">관리자페이지</a>

				<a href="#" onclick='logout()'>로그아웃</a>
				<%
					} else {
				%>
				<a> <%=m.getMuserName()%>
				</a> <a href="<%=request.getContextPath() %>/basic.ys?">마이페이지</a> <a href="#"
					onclick='logout()'>로그아웃</a>
				<%
					}
				%>
                    
                </div>
            </div>
            <div class="wrapper">
                <div id="H_menu" class="clearfix">
                    <div class="logo_box">
                        <a href="<%= request.getContextPath() %>/mlist.th" class="H_logo"><img src="<%= request.getContextPath() %>/resources/images/logo.png" alt="Logo"></a>
                    </div>
                    <div id="H_nav">
                        <li class="navi_set">
                            <a href="<%= request.getContextPath() %>/mlist.th" class="topnav"><img src="<%= request.getContextPath() %>/resources/images/icons/main.png" alt="main"></a>
                        </li>
                        <li class="navi_set">
                            <a href="<%= request.getContextPath() %>/hotel.ys" class="topnav"><img src="<%= request.getContextPath() %>/resources/images/icons/pethotel.png" alt="pethotel"></a>
                            <ul class="subnav">
                                <li><a href="<%= request.getContextPath() %>/pethotel.ys"><img src="<%= request.getContextPath() %>/resources/images/icons/sub_consignmenthotel.png" alt="반려견 위탁 호텔"></a></li>
                                <li><a href="<%= request.getContextPath() %>/hotel.ys"><img src="<%= request.getContextPath() %>/resources/images/icons/sub_hotel.png" alt="반려견 동반 호텔"></a></li>
                            </ul>
                        </li>
                        <li class="navi_set">
                            <a href="<%= request.getContextPath() %>/rList.ch" class="topnav"><img src="<%= request.getContextPath() %>/resources/images/icons/petplace.png" alt="petplace"></a>
                            <ul class="subnav">
                                <li><a href="<%= request.getContextPath() %>/rList.ch"><img src="<%= request.getContextPath() %>/resources/images/icons/sub_restaurant.png" alt="반려견 동반 레스토랑"></a></li>
                                <li><a href="<%= request.getContextPath() %>/cList.ch"><img src="<%= request.getContextPath() %>/resources/images/icons/sub_cafe.png" alt="반려견 동반 카페"></a></li>
                            </ul>
                        </li>
                        <li class="navi_set">
                            <a href="<%= request.getContextPath() %>/blist.th" class="topnav"><img src="<%= request.getContextPath() %>/resources/images/icons/community.png" alt="community"></a>
                            <ul class="subnav">
                                <li><a href="<%= request.getContextPath() %>/blist.th"><img src="<%= request.getContextPath() %>/resources/images/icons/sub_lab.png" alt="반려견 연구소"></a></li>
                                <li><a href="<%= request.getContextPath() %>/rvList.th"><img src="<%= request.getContextPath() %>/resources/images/icons/sub_review.png" alt="플레이스 리뷰"></a></li>
         </ul>
                        </li>
                        <li class="navi_set">
                            <a href="<%= request.getContextPath() %>/nList.th" class="topnav"><img src="<%= request.getContextPath() %>/resources/images/icons/service.png" alt="service"></a>
                            <ul class="subnav">
                                <li><a href="<%= request.getContextPath() %>/nList.th"><img src="<%= request.getContextPath() %>/resources/images/icons/sub_notice.png" alt="공지사항"></a></li>
                                                                   <%--    <li><a href="<%= request.getContextPath() %>/views/service/Q&A.jsp"><img src="<%= request.getContextPath() %>/resources/images/icons/sub_QnA.png" alt="Q & A"></a></li> --%>
 href="<%= request.getContextPath() %>/views/service/Question.jsp"><img src="<%= request.getContextPath() %>/resources/images/icons/sub_contactmtm.png" alt="1:1 문의"></a></li>
                            </ul>
                        </li>
                    </div>
                </div>
            </div>   
        </header>
	<script>
		function logout() {
			location.href = "<%=request.getContextPath()%>/logout.th";
		}
		function goManager(){
			location.href = "<%=request.getContextPath()%>/chart.ma";
		}
	</script>

</body>
</html>