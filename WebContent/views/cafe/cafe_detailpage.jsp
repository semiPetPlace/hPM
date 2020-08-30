<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semiProject.cafe.model.vo.*, java.util.*"%>
<%
	Cafe c = (Cafe)request.getAttribute("cafe");
 %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개편한 세상</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/mainpage.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/cafe-detail.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/imgSlide.css">
    <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src ="<%= request.getContextPath() %>/resources/js/script.js"></script>
</head>
<body>
    <%@ include file = "../common/header.jsp" %>
    <!--상단 이미지부분-->
    <main id="H_main">
        <div id="main-image">
            <div id="main-text">
                <h1><%= c.getCname() %></h1>
                <p><%= c.getCaddress() %></p>
                <p>★ 평점 <%= c.getCscore() %></p>
            </div>
            <div class="review_btn"><a href="../review/review_write.jsp">리뷰 작성</a></div>
            <div class="like_btn"><button onclick="like();" id="like_btn">찜하기</button></div>
        </div>
        <div class="wrapper cafe-cont clearfix">
            <div class="left">
                <!--카페이미지-->
                <div class="cafe-image">                
                    <div class="small-box">
                        <ul class="slides">
                            <input type="radio" name="radio-btn" id="img-1" checked />
                            <li class="slide-container">
                                <div class="nav">
                                    <label for="img-6" class="prev">&#x2039;</label>
                                    <label for="img-2" class="next">&#x203a;</label>
                                </div>
                                <div class="slide">
                                    <img src=<%= c.getCimage() %> />
                                </div>
                            </li>
                            
                            <input type="radio" name="radio-btn" id="img-2" />
                            <li class="slide-container">
                                <div class="slide">
                                    <img src=<%= c.getCimage() %> />
                                </div>
                                <div class="nav">
                                    <label for="img-1" class="prev">&#x2039;</label>
                                    <label for="img-3" class="next">&#x203a;</label>
                                </div>
                            </li>
                        
                            <input type="radio" name="radio-btn" id="img-3" />
                            <li class="slide-container">
                                <div class="slide">
                                    <img src=<%= c.getCimage() %> />
                                </div>
                                <div class="nav">
                                    <label for="img-2" class="prev">&#x2039;</label>
                                    <label for="img-4" class="next">&#x203a;</label>
                                </div>
                            </li>
                        
                            <input type="radio" name="radio-btn" id="img-4" />
                            <li class="slide-container">
                                <div class="slide">
                                    <img src=<%= c.getCimage() %> />
                                </div>
                                <div class="nav">
                                    <label for="img-3" class="prev">&#x2039;</label>
                                    <label for="img-5" class="next">&#x203a;</label>
                                </div>
                            </li>
                        
                            <input type="radio" name="radio-btn" id="img-5" />
                            <li class="slide-container">
                                <div class="slide">
                                    <img src=<%= c.getCimage() %> />
                                </div>
                                <div class="nav">
                                    <label for="img-4" class="prev">&#x2039;</label>
                                    <label for="img-6" class="next">&#x203a;</label>
                                </div>
                            </li>
                        
                            <input type="radio" name="radio-btn" id="img-6" />
                            <li class="slide-container">
                                <div class="slide">
                                    <img src=<%= c.getCimage() %> />
                                </div>
                                <div class="nav">
                                    <label for="img-5" class="prev">&#x2039;</label>
                                    <label for="img-1" class="next">&#x203a;</label>
                                </div>
                            </li>
                        
                            <li class="nav-dots">
                              <label for="img-1" class="nav-dot" id="img-dot-1"></label>
                              <label for="img-2" class="nav-dot" id="img-dot-2"></label>
                              <label for="img-3" class="nav-dot" id="img-dot-3"></label>
                              <label for="img-4" class="nav-dot" id="img-dot-4"></label>
                              <label for="img-5" class="nav-dot" id="img-dot-5"></label>
                              <label for="img-6" class="nav-dot" id="img-dot-6"></label>
                            </li>
                        </ul>
                    </div>
                </div>
                <!--카페인포-->
                <div class="cafe-info">
                    <div class="with_info">
                        <div class="title">
                            <img src="<%= request.getContextPath() %>/resources/images/icons/document.png" alt="">
                            <h3>반려견 동반 정보</h3>
                        </div>
                        <div class="content">
                            <p> <%= c.getCpromotion() %> </p>    
                        </div>
                    </div>
                    <div class="location_info">
                        <div class="title">
                            <img src="<%= request.getContextPath() %>/resources/images/icons/document.png" alt="">
                            <h3>카페 정보</h3>
                        </div>
                        <div class="content">
                            <p><%= c.getCpromotion() %></p>    
                        </div>
                    </div>
                </div>
                <!--리뷰창-->
                <div class="review">
                    <div class="title">
                        <img src="<%= request.getContextPath() %>/resources/images/icons/document.png" alt="">
                        <h3>리뷰</h3>
                        <div class="write_btn"><a href="../review/review_write.jsp">리뷰 작성</a></div>
                        <div class="list_btn" onclick="list();"><a href="../review/review_list.jsp">더보기</a></div>
                    </div>
                    <div class="content">
                        <ul class="list">
                            <li>“ <%= c.getCreview() %> ”</li>
                            <li>“ <%= c.getCreview() %> ”</li>
                            <li>“ <%= c.getCreview() %> ”</li>
                            <li>“ <%= c.getCreview() %> ”</li>
                        </ul>
                    </div>
                </div>
                <!--요청사항-->
                <div class="attention">
                    <div class="title">
                        <img src="<%= request.getContextPath() %>/resources/images/icons/document.png" alt="">
                        <h3>요청 사항</h3>
                    </div>
                    <div class="content">
                        <p><%= c.getCrequest() %></p>   
                    </div>
                </div>
            </div>
            <div class="right">
                <!--위치-->
                <div class="location">
                    <div class="lo_title">
                        <img src="<%= request.getContextPath() %>/resources/images/icons/place.png" alt="">
                        <h3>카페 위치</h3>
                    </div>
                    <!-- 구글지도 -->
                    <div id="map"></div>
                    <script>
                        var map;
                        var image;
                        var marker;
                        
                        function initMap() {
                        map = new google.maps.Map(document.getElementById('map'), {
                        center: {lat: 37.538537, lng:  127.074660}, //위도 경도
                        zoom: 16 //숫자 클수록 지도가 자세히보임
                        });
                        
                        image = new google.maps.MarkerImage( 'http://www.larva.re.kr/home/img/boximage3.png',
                                                    new google.maps.Size(60, 60),
                                                    '',
                                                    '',
                                                    new google.maps.Size(60, 60));
                        
                        marker = new google.maps.Marker({
                                    position: {lat: 37.538537, lng:  127.074660}, // 마커가 위치할 위도와 경도(변수)
                                    map: map,
                                    icon: image, // 마커로 사용할 이미지(변수)
                                    title: '동문회관' // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
                                });
                        }
                    </script>
                    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBvJ_OC7o2tQfl9tKh6H0nNQhU-GAoYp3c&callback=initMap" async defer></script>
                    <div class="lo_cont">
                        <p><%= c.getCaddress() %></p>
                    </div>
                    <div class="call_cont">
                        <div class="call">
                            <img src="<%= request.getContextPath() %>/resources/images/icons/phone.png" alt="">
                            <h3>연락처</h3>
                            <div class="no">
                                <p><%= c.getCtel() %></p>
                            </div>
                        </div>
                    </div>
                </div>
                <!--영업시간-->
                <div class="time">
                    <div class="t_title">
                        <img src="<%= request.getContextPath() %>/resources/images/icons/clock.png" alt="">
                        <h3>영업시간</h3>
                        <p>Now Open!</p>
                    </div>
                    <div class="t_cont">
                        <ul>
                            <li><%= c.getCtime() %></li>
                            <li><%= c.getCtime() %></li>
                            <li><%= c.getCtime() %></li>
                            <li><%= c.getCtime() %></li>
                            <li><%= c.getCtime() %></li>
                            <li><%= c.getCtime() %></li>
                            <li><%= c.getCtime() %></li>
                        </ul>
                        <p>* 휴무의 경우 명시된 날짜와 상이할 수 있으니 전화 문의 후 확인하시어 방문 부탁드립니다. (공휴일 포함)</p>
                    </div>
                </div>
            </div>
        </div>
        </main>
	<script>
		// 리뷰 작성하기 페이지 이동 시작
			$('.write_btn').click(function(){
				location.href='<%= request.getContextPath() %>/리뷰서블릿.dd?';
			});
		// 리뷰 작성하기 페이지 이동 끝
		
		// 찜하기 버튼 시작
			function like() {
				alert('찜한 플레이스에 저장되었습니다.');
			}
		// 찜하기 버튼 끝
	</script>
	</div>
    <!-- TOP버튼 -->
    <div style="height: 20px; margin-right: 2%;"><a href="#header" id="top">▲ TOP</a></div>
    	<%@ include file = "../common/footer.jsp" %>
    </body>
</html>