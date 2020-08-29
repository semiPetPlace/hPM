<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
                	<%-- <% if(m = null) { %> --%>
                		<a href="/semi/views/login/login.jsp">로그인</a>
                        <a href="/semi/views/mypage/mypage-basic.jsp">회원가입</a>
                	
                	 	<a href="/semi/views/login/login.jsp">*관리자*</a>
                    	<a href='#' onclick="goManager()">관리자페이지</a>
                	<%-- <%} else{%> --%>
                	<%-- 	<a href="/semi/views/login/login.jsp"><%m.userId %></a> --%>
                    	<a href="/semi/views/mypage/mypage-basic.jsp">마이페이지</a>
                  <%--   <%} %>  --%>
                    
                </div>
            </div>
            <div class="wrapper">
                <div id="H_menu" class="clearfix">
                    <div class="logo_box">
                        <a href="/semi/views/main/main.jsp" class="H_logo"><img src="/semi/resources/images/logo.png" alt="Logo"></a>
                    </div>
                    <div id="H_nav">
                        <li class="navi_set">
                            <a href="/semi/views/main/main.jsp" class="topnav"><img src="/semi/resources/images/icons/main.png" alt="main"></a>
                        </li>
                        <li class="navi_set">
                            <a href="/semi/hotel.ys" class="topnav" id="companionHotelMain"><img src="/semi/resources/images/icons/pethotel.png" alt="pethotel"></a>
                            <ul class="subnav">
                                <li><a href="/semi/views/main/pet_hotelmain.jsp" id="consingmentHotel"><img src="/semi/resources/images/icons/sub_consignmenthotel.png" alt="반려견 위탁 호텔"></a></li>
                                <li><a href="/semi/views/main/hotelmain.jsp" id="companionHotel"><img src="/semi/resources/images/icons/sub_hotel.png" alt="반려견 동반 호텔"></a></li>
                            </ul>
                        </li>
                        <li class="navi_set">
                            <a href="/semi/views/restaurant/restaurant_main.jsp" class="topnav"><img src="/semi/resources/images/icons/petplace.png" alt="petplace"></a>
                            <ul class="subnav">
                                <li><a href="/semi/views/restaurant/restaurant_main.jsp"><img src="/semi/resources/images/icons/sub_restaurant.png" alt="반려견 동반 레스토랑"></a></li>
                                <li><a href="/semi/views/cafe/cafe-main.jsp"><img src="/semi/resources/images/icons/sub_cafe.png" alt="반려견 동반 카페"></a></li>
                            </ul>
                        </li>
                        <li class="navi_set">
                            <a href="/semi/views/main/freeboard_list.jsp" class="topnav"><img src="/semi/resources/images/icons/community.png" alt="community"></a>
                            <ul class="subnav">
                                <li><a href="/semi/views/main/freeboard_list.jsp"><img src="/semi/resources/images/icons/sub_lab.png" alt="반려견 연구소"></a></li>
                                <li><a href="/semi/views/review/review_list.jsp"><img src="/semi/resources/images/icons/sub_review.png" alt="플레이스 리뷰"></a></li>
                            </ul>
                        </li>
                        <li class="navi_set">
                            <a href="/semi/views/main/freeboard_list_notice.jsp" class="topnav"><img src="/semi/resources/images/icons/service.png" alt="service"></a>
                            <ul class="subnav">
                                <li><a href="/semi/views/main/freeboard_list_notice.jsp"><img src="/semi/resources/images/icons/sub_notice.png" alt="공지사항"></a></li>
                                <li><a href="/semi/views/service/Q&A.jsp"><img src="/semi/resources/images/icons/sub_QnA.png" alt="Q & A"></a></li>
                                <li><a href="/semi/views/service/Question.jsp"><img src="/semi/resources/images/icons/sub_contactmtm.png" alt="1:1 문의"></a></li>
                            </ul>
                        </li>
                    </div>
                </div>
            </div>   
        </header>
        <script>
        	function goManager(){
				location.href="/semi/chart.ma";
			}
        
        </script>

</body>
</html>