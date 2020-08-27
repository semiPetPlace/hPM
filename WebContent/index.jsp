<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>

<!DOCTYPE jsp>
<jsp lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>index</title>
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/mainpage.css">

<link href="https://fonts.googleapis.com/css?family=Anton"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Neucha"
	rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="resources/js/script.js"></script>
<script type="text/javascript"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">


</head>
<body>
	<%@include file="views/common/header.jsp"%>

	<!-- 여기에 메인 컨텐츠 넣으면 됩니다. -->

	<main id="H_main">
	<div id="main-wrapper">
		<div id="main-image">
			<img src="resources/images/main.png" alt="main-background"
				width="100%;" style="max-height: initial; min-width: 1900px;">
		</div>

		<div class="wrapper2">
			<!-- 검색창 부분 -->
			<form action="search.ho" id="search" method="post">
				<div id="search-box">
					<select name="place" id="place"
						style="font-size: 1.4rem; width: 200px; text-align: center; margin-right: 90px; margin-left: 70px; border: none;">
						<option value="selectPlace" class="nonselect">플레이스 선택</option>
						<option value="hotel_companion">반려견 동반 호텔</option>
						<option value="hotel_consignment">반려견 위탁 호텔</option>
						<option value="cafe">반려견 카페</option>
						<option value="restaurant">반려견 레스토랑</option>
					</select> <input type="date" class="check" name="checkin" id="checkin"
						style="font-size: 1.4rem; width: 180px; border: none;"> <input
						type="date" class="check" name="checkout" id="checkout"
						style="font-size: 1.4rem; width: 180px; margin-right: 95px; border: none;">
					<select name="area" id="area"
						style="font-size: 1.4rem; width: 180px; text-align: center; margin-right: 150px; border: none;">
						<option value="x" class="nonselect">지역</option>
						<option value="seoul">서울</option>
						<option value="gyeonggi">경기</option>
						<option value="incheon">인천</option>
						<option value="daegu">대구</option>
						<option value="busan">부산</option>
						<option value="jeju">제주</option>
					</select>

					<!-- 검색 버튼 -->
					<div class="button-5" onclick="searching()">
						<div class="eff-5"></div>
							<a href="#">검색</a>
						
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
							<img src="resources/images/test/test1.png" class="d-block w-100"
								alt="...">
							<div class="carousel-caption d-none d-md-block">
								<h5></h5>
								<p></p>
							</div>
						</div>
						<div class="carousel-item">
							<img src="resources/images/test/test2.png" class="d-block w-100"
								alt="...">
							<div class="carousel-caption d-none d-md-block">
								<h5></h5>
								<p></p>
							</div>
						</div>
						<div class="carousel-item">
							<img src="resources/images/test/test3.png" class="d-block w-100"
								alt="...">
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
					<a href="views/hotelmain.jsp"><img
						src="resources/images/icons/consignment_hotel.png" alt="반려견 위탁 호텔"></a>
				</h2>
			</div>
			<table>
				<tr>
					<td>
						<div id="con_hotelList" style="float: none;">
							<a href="views/pethotel/pet_hotel_detail.jsp">
								<div class="con_hotelList-list">
									<img src="resources/images/hotel1.jpg" alt="con_hotel1">
									<h4 style="margin-bottom: 0;">hotel name</h4>
									<p class="infoText">information of hotel</p>
									<p class="price">₩180,000/1박</p>
								</div>
							</a>
						</div>
					</td>
				</tr>
			</table>
			<!-- 위탁 호텔 리스트 끝 -->

			<!-- 동반 호텔 리스트 -->
			<div id="placelist">
				<h2 class="listname">
					<a href="views/hotelmain.jsp"><img
						src="resources/images/icons/hotel.png" alt="반려견 동반 호텔"></a>
				</h2>
			</div>
			<table>
				<tr>
					<td>
						<div id="hotelList" style="float: none;">
							<a href="views/hotel/hotel_detail.jsp">
								<div class="hotelList-list">
									<img src="resources/images/hotel1.jpg" alt="hotel1">
									<h4 style="margin-bottom: 0;">hotel name</h4>
									<p class="infoText">information of hotel</p>
									<p class="price">₩180,000/1박</p>
								</div>
							</a>
						</div>
					</td>
				</tr>
			</table>
			<!-- 동반 호텔 리스트 끝 -->

			<!-- 레스토랑 리스트 -->
			<div id="placelist">
				<h2 class="listname">
					<a href="views/restaurant/restaurant_main.jsp"><img
						src="resources/images/icons/restaurant1.png" alt="반려견 동반 카페 레스토랑"></a>
				</h2>
			</div>
			<table>
				<tr>
					<td>
						<div id="restaurantList">
							<a href="views/restaurant/restaurant_detailpage.jsp">
								<div class="restaurantList-list">
									<img src="resources/images/cafe1.jpg" alt="Restaurant">
									<h4 style="margin-bottom: 0;">Restaurant name</h4>
									<p class="infoText">information of Restaurant</p>
									<p class="price">별점★★★★★</p>
								</div>
							</a>
						</div>
					</td>
				</tr>
			</table>
			<!-- 레스토랑 리스트 끝 -->


			<!-- 카페 리스트 -->
			<div id="placelist">
				<h2 class="listname">
					<a href="views/cafe/cafe-main.jsp"><img
						src="resources/images/icons/cafe1.png" alt="반려견 동반 카페 레스토랑"></a>
				</h2>
			</div>
			<table>
				<tr>
					<td>
						<div id="cafeList">
							<a href="views/cafe/cafe-detailpage.jsp">
								<div class="cafeList-list">
									<img src="resources/images/cafe1.jpg" alt="cafe">
									<h4 style="margin-bottom: 0;">cafe name</h4>
									<p class="infoText">information of cafe</p>
									<p class="price">별점★</p>
								</div>
							</a>
						</div>
					</td>
				</tr>
			</table>
			<!-- 카페 리스트 끝 -->

			<!-- TOP -->
			<div style="height: 20px;">
				<a href="#header" id="top">▲ TOP</a>
			</div>
		</div>

		<div class="wrapper3"></div>
	</div>
	</main>
	
    <script>
    		function searching(){
			location.href="<%=request.getContextPath()%>/searchMain.th?place="+$('#place').val()+"&checkin="+$('#checkin').val()+"&checkout="+$('#checkout').val()+"&area="+$('#area').val();
		}
    </script>
	<!-- 메인 끝 -->

	<%@include file="views/common/footer.jsp"%>

</body>
</jsp>