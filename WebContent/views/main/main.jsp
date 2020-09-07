<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.semiProject.Hotel.model.vo.*"%>
<%@ page import="com.kh.semiProject.cafe.model.vo.*"%>
<%@ page import="com.kh.semiProject.restaurant.model.vo.*"%>
<%
	ArrayList<Hotel> hlist = (ArrayList<Hotel>) request.getAttribute("hlist");
	ArrayList<Hotel> plist = (ArrayList<Hotel>) request.getAttribute("plist");
	ArrayList<Cafe> clist = (ArrayList<Cafe>) request.getAttribute("clist");
	ArrayList<Restaurant> rlist = (ArrayList<Restaurant>) request.getAttribute("rlist");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>main</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/mainpage.css">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Neucha"
	rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/script.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">


</head>
<body>
	<%@ include file="../common/header.jsp"%>

	<!-- 여기에 메인 컨텐츠 넣으면 됩니다. -->

	<main id="H_main">
	<div id="main-wrapper">
		<div id="main-image">
			<img src="<%=request.getContextPath()%>/resources/images/main.png"
				alt="main-background" width="100%;"
				style="max-height: initial; min-width: 1900px;">
		</div>

		<div class="wrapper2">
			<!-- 검색창 부분 -->
			<form id="searchform" method="post">
			<div id="search-box">
				<label name="플레이스" id="" value="hotel"
					style="font-size: 1.4rem; width: 200px; text-align: center; margin-right: 90px; margin-left: 70px; border: none;">
					반려견 동반 호텔</label>
				<input type="date" class="check" name="checkin" id="checkin"
					style="font-size: 1.4rem; width: 180px; border: none;"> 
					<input type="date" class="check" name="checkout" id="checkout"
					style="font-size: 1.4rem; width: 180px; margin-right: 95px; border: none;">
				<select name="area" id="area"
					style="font-size: 1.4rem; width: 180px; text-align: center; margin-right: 150px; border: none;">
					<option value="x" class="nonselect">지역</option>
					<option value="서울">서울</option>
					<option value="경기">경기</option>
					<option value="인천">인천</option>
					<option value="대구">대구</option>
					<option value="부산">부산</option>
					<option value="제주">제주</option>
				</select>

				<!-- 검색 버튼 -->
				<div class="button-5" id="searchBtn">
					<div class="eff-5"></div>
					<a >검색</a>
				</div>
			</div>
			</form>
			<!-- 검색창 부분 끝 -->

			<!-- 이미지 슬라이드 -->
			<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
				integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
				crossorigin="anonymous"></script>
			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
				integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
				crossorigin="anonymous"></script>
			<script
				src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
				integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
				crossorigin="anonymous"></script>
			<div class="slide-block">
				<div id="carouselExampleCaptions" class="carousel slide"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleCaptions" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
						<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img
								src="<%=request.getContextPath()%>/resources/images/test/test1.png"
								class="d-block w-100" alt="...">
							<div class="carousel-caption d-none d-md-block">
								<h5></h5>
								<p></p>
							</div>
						</div>
						<div class="carousel-item">
							<img
								src="<%=request.getContextPath()%>/resources/images/test/test2.png"
								class="d-block w-100" alt="...">
							<div class="carousel-caption d-none d-md-block">
								<h5></h5>
								<p></p>
							</div>
						</div>
						<div class="carousel-item">
							<img
								src="<%=request.getContextPath()%>/resources/images/test/test3.png"
								class="d-block w-100" alt="...">
							<div class="carousel-caption d-none d-md-block">
								<h5></h5>
								<p></p>
							</div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleCaptions"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleCaptions"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>

			</div>

			<!-- 이미지 슬라이드 끝 -->

			<!-- 위탁 호텔 리스트 -->
			<div id="placelist">
				<h2 class="listname">
					<a onclick="return false;"><img
						src="resources/images/icons/consignment_hotel.png" alt="반려견 위탁 호텔"></a>
				</h2>
			</div>
			<table>
				<tr>
					<%
						int num = 0;
						for (Hotel h : hlist) {
							if (num == 4) {
								break;
							}
					%>
					<% String[] Image =  h.gethImg().split(",");  %>
					
					
					<td>
						<div id="con_hotelList" style="float: none;">
							<a href="<%=request.getContextPath() %>/hotelDetail.ys?h_no=<%= h.gethNo() %>">
								<div class="con_hotelList-list">
									<img src="<%= request.getContextPath() %>/resources/images/<%=Image[0]%>" alt="con_hotel1">
									<h4 style="margin-bottom: 0;"><%=h.gethName()%></h4>
									<p class="infoText"><%=h.gethPromotion()%></p>
									<p class="price">₩<%=h.gethPrice()%>/1박
									</p>
								</div>
							</a>
						</div>
					</td>
					<%
						num++;
						}
						num=0;
					%>
				</tr>
			</table>
			<!-- 위탁 호텔 리스트 끝 -->

			<!-- 동반 호텔 리스트 -->
			<div id="placelist">
				<h2 class="listname">
					<a onclick="return false;"><img
						src="resources/images/icons/hotel.png" alt="반려견 동반 호텔"></a>
				</h2>
			</div>
			<table>
				<tr>
				<% for(Hotel p :  plist){ %>
					<td>
						<div id="hotelList" style="float: none;">
							<a href="<%=request.getContextPath() %>/pethoteldetail.ys?ph_no=<%= p.gethNo() %>">
								<div class="hotelList-list">
									<img src="<%= request.getContextPath() %>/resources/images/<%=p.gethImg()%>" alt="hotel1">
									<h4 style="margin-bottom: 0;"><%=p.gethName()%></h4>
									<p class="infoText"><%=p.gethPromotion()%></p>
									<p class="price">₩<%=p.gethPrice()%>/1박</p>
								</div>
							</a>
						</div>
					</td>
					<%
						num++;
						}
					num=0;
					%>
				</tr>
			</table>
			<!-- 동반 호텔 리스트 끝 -->

			<!-- 레스토랑 리스트 -->
			<div id="placelist">
				<h2 class="listname">
					<a onclick="return false;"><img
						src="resources/images/icons/restaurant1.png" alt="반려견 동반 카페 레스토랑"></a>
				</h2>
			</div>
			<table>
				<tr>
					<%
						for (Restaurant r : rlist) {
							if (num == 4) {
								num = 0;
								break;
							}
					%>
					<td>
						<div id="restaurantList">
							<a href="<%= request.getContextPath() %>/rView.ch?rno=<%= r.getRno() %>">
								<div class="restaurantList-list">
									<img src="<%= request.getContextPath() %>/resources/images/restaurant/<%=r.getRrimage()%>" alt="Restaurant">
									<h4 style="margin-bottom: 0;"><%=r.getRname()%></h4>
									<p class="infoText"><%=r.getRpromotion()%></p>
									<p class="price">
										별점★ <%= r.getRscore() %></p>
								</div>
							</a>
						</div>
					</td>
					<%
						num++;
						}
					num=0;
					%>
				</tr>
			</table>
			<!-- 레스토랑 리스트 끝 -->


			<!-- 카페 리스트 -->
			<div id="placelist">
				<h2 class="listname">
					<a onclick="return false;"><img
						src="resources/images/icons/cafe1.png" alt="반려견 동반 카페 레스토랑"></a>
				</h2>
			</div>
			<table>
				<tr>
					<%

						for (Cafe c : clist) {
							if (num == 4) {
								num = 0;
								break;
							}
					%>
					<td>
						<div id="cafeList">
							<a href="<%= request.getContextPath() %>/cView.ch?cno=<%= c.getCno() %>">
								<div class="cafeList-list">
									<img src="<%= request.getContextPath() %>/resources/images/<%=c.getCrimage()%>" alt="cafe">
									<h4 style="margin-bottom: 0;"><%=c.getCname()%></h4>
									<p class="infoText"><%=c.getCpromotion()%></p>
									<p class="price">
										별점★
										<%=c.getCscore()%></p>
								</div>
							</a>
						</div>
					</td>
					<%
						num++;
						}
					num=0;
					%>
				</tr>
			</table>
			<!-- 카페 리스트 끝 -->

			<!-- TOP -->
			<div style="height: 20px;">
				<a href="#header" id="top">▲ TOP</a>
			</div>
		</div>
	</main>

	<!-- 메인 끝 -->
	<%@ include file="../common/footer.jsp"%>
	
	
	<script>
		$(function(){
			var entime = $('#checkin').val();
			var extime = $('#checkout').val();
			var location = $('#area').val(); 
		
			
			$('#searchBtn').click(function(){
				
			
				if($('#checkin').val()!="" && $('#checkout').val() !="" && $('#area').val() !="x"){
					
					$('#searchform').attr('action','<%=request.getContextPath() %>/hotelsearch.ys?checkin='+$('#checkin').val()+'&checkout='+$('#checkout').val()+'&area='+$('#area').val()).submit();
					
				}else{
					alert("체크인/체크아웃/지역 값을 모두선택해주세요");
				} 
				
				
			});
		});
	</script>

</body>
</html>