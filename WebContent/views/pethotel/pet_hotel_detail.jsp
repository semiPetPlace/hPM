<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.semiProject.Hotel.model.vo.*, com.kh.semiProject.review.model.vo.*" %>
<% PetHotel ph = (PetHotel)request.getAttribute("ph"); %>
<% ArrayList<Review> phre = (ArrayList<Review>)request.getAttribute("phreview"); %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>pet_hotel_detail</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="/semi/resources/css/mainpage.css">
        <link rel="stylesheet" href="/semi/resources/css/pet_hotel_detail.css">
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
        <script src ="/semi/resources/js/script.js"></script>
    </head>
<style>
	.modal a.close-modal{
	top: 1.5px;
	right: 1.5px;
	width: 30px;
	height: 30px;
	color:white;
   	display: none;
	}
	#modalinfo>li{
	font-size: 20px;
	height: 100%;
	margin-top:5px
	}
	body {
	  font-family: Arial;
	  margin: 0;
	}
	
	* {
	  box-sizing: border-box;
	}
	
	img {
	  vertical-align: middle;
	}
	
	/* Position the image container (needed to position the left and right arrows) */
	.container {
	  position: relative;
	}
	
	/* Hide the images by default */
	.mySlides {
	  display: none;
	}
	
	/* Add a pointer when hovering over the thumbnail images */
	.cursor {
	  cursor: pointer;
	}
	
	/* Next & previous buttons */
	.prev,
	.next {
	  cursor: pointer;
	  position: absolute;
	  top: 40%;
	  width: auto;
	  padding: 16px;
	  margin-top: -50px;
	  color: white;
	  font-weight: bold;
	  font-size: 20px;
	  border-radius: 0 3px 3px 0;
	  user-select: none;
	  -webkit-user-select: none;
	}
	
	/* Position the "next button" to the right */
	.next {
	  right: 0;
	  border-radius: 3px 0 0 3px;
	}
	
	/* On hover, add a black background color with a little bit see-through */
	.prev:hover,
	.next:hover {
	  background-color: rgba(0, 0, 0, 0.8);
	}
	
	/* Number text (1/3 etc) */
	.numbertext {
	  color: #f2f2f2;
	  font-size: 12px;
	  padding: 8px 12px;
	  position: absolute;
	  top: 0;
	}
	
	/* Container for image text */
	.caption-container {
	  text-align: center;
	  background-color: #222;
	  padding: 2px 16px;
	  color: white;
	}
	
	.row:after {
	  content: "";
	  display: table;
	  clear: both;
	}
	
	/* Six columns side by side */
	.column {
	  float: left;
	  width: 16.66%;
	}
	
	/* Add a transparency effect for thumnbail images */
	.demo {
	  opacity: 0.6;
	}
	
	.active,
	.demo:hover {
	  opacity: 1;
	}

</style>
    <body>
        	<%@ include file = "../common/header.jsp" %>
        	<% String[] imglist = ph.getDimg().split(","); %>
        <!-- -------------------------- main --------------------------- -->
        <main>
            <div class="main-content">
                <!-- <div class="main-img"><img src="/semi/resources/images/icons/pet_hotel-main.png" alt=""></div> -->
                <div class="main-img">
                    <div style="font-size: 30px; text-align: left;margin-top: 150px;">업체 상세정보</div>
                    <div style="width: 100%;height: 30px; background:orange;margin-top: 10px;"></div>
                </div>
                <div class="details" style ="height:1200px">
                    <div class="maininfo">
                        <div class="box80">

                            <div class="hotelimg">
                                <img src="<%=request.getContextPath() %>/resources/images/<%=ph.getImg() %>" alt="">
                            </div>
                            <div class="pay-box">
                                <span id="h-name"><%=ph.getPhname() %></span>
                                <p id="price-before">&#8361;<%=ph.getPhprice()*0.7+ph.getPhprice() %></p>
                                <p id="price-after">&#8361;<%=ph.getPhprice() %></p><br><br><br>
                                <p id="grade"><%=ph.getPhscore()+5 %>점</p>
                                <a href="#ex2" style="margin-left:30px;">사진보기</a>
                                <a href="#ex1">업체연락하기</a>
                                <div id="facility">위탁호텔 주요시설</div>
                                <div id="facility-preview">
                                    <div>애견 놀이터</div>
                                    <div>애견 산책로</div>
                                    <div>레스토랑</div>
                                </div>
                            </div>
                        </div>
                        <div class="right-text">
                            <h1>이업체의 리뷰</h1>
                            <hr>
                            <div class="reveiws">
                                <div class="reveiw">
                                <% int i=0;
                               	for(Review r : phre){
                                  if(i==5){
                                     break;
                                  }
                           		 %>
                            	
                                <div class="reveiw">
                                <div id="reviewtext">“<%=r.getRvcontent() %>”</div>
                                <div id="reviewwriter"><%=r.getRvwriter() %>님</div>
                                <div id="reviewscore">별점 <%=r.getRvScore()%></div>
                                </div>
                                <hr>
                                <% i++;
                                } %>
                                 <% if(m !=null){ %>
                                <div><a href="<%= request.getContextPath() %>/views/review/review_write.jsp?type=pethotel&cno=<%= ph.getPhno() %>" style="float:right;">>리뷰 작성하기</a></div>
                                <%} %>
                                <div><a href="<%= request.getContextPath() %>/rvList2.th?type=pethotel&ctno=<%= ph.getPhno() %>" style="float:left;">>더보기</a></div>
                            </div>    
                            <!-- 구글지도 -->
                            <div class="map-img">
                                <span>지도에서 보기</span>
                                <div id="map"></div>
                                <script>
                                   var map;
                                   var image;
                                   var marker;
                                   
                                   function initMap() {
                                   map = new google.maps.Map(document.getElementById('map'), {
                                   center: {lat: <%=ph.getLat()%>, lng:  <%=ph.getLng()%>}, //위도 경도
                                   zoom: 16 //숫자클수록 지도가 자세히보임
                                   });
                                   
                                   image = new google.maps.MarkerImage( 'http://www.larva.re.kr/home/img/boximage3.png',
                                                               new google.maps.Size(60, 60),
                                                               '',
                                                               '',
                                                               new google.maps.Size(60, 60));
                                   
                                   marker = new google.maps.Marker({
                                               position: {lat: <%=ph.getLat()%>, lng: <%=ph.getLng()%>}, // 마커가 위치할 위도와 경도(변수)
                                               map: map,
                                               icon: image, // 마커로 사용할 이미지(변수)
                                               title: '<%=ph.getPhname()%>' // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
                                           });
                                   }
                               </script>
                           <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBvJ_OC7o2tQfl9tKh6H0nNQhU-GAoYp3c&callback=initMap" async defer></script>
   
                           </div>
                           <!-- 구글지도 -->
                        </div>
                        
                    </div>   

                   
                    </div>
                        <div class="hotelrules">
                            <span>호텔정책</span>
                            <hr>
                            <p>

                                · 반려견 입실 정책 3차 접종 이하의 어린 강아지, 추가 접종이 되어 있지 않은 강아지, 
                                전염성이 있는 질병이 있는 반려견은 호텔 이용이 제한됩니다. <br>
                                · 주의사항 입실 시에 각 호텔 이용 준비물 참조 바랍니다.
                            </p>
                        </div>   
                </div>

                
                
            </div>
            
        </main>
        <!-- -------------------------- main --------------------------- -->

        <%@ include file = "../common/footer.jsp" %>
        <div id="ex1" class="modal" style="height: 200px; background:#ffae00; color:white;">
            <p>
                <div id="Notice-modal" >
                    <p style="font-size:30px; font-weight:500;">업체명 :<%=ph.getPhname() %></p>
                    <ul id="modalinfo">
                        <li>가격 :<%=ph.getPhprice() %> </li>
                        <li>주소 :<%=ph.getPhaddress() %></li>
                        <li>업체정보 :<%=ph.getPhpromotion() %></li>
                        <li>업체요청사항 :<%=ph.getPhrequests() %></li>
                        <li>업체 연락처 :<%=ph.getPhtel() %></li>
                        
                    </ul>      
                </div>

            </p>
        </div>
        <div id="ex2" class="modal" style=" max-width:1000px; ">
            
				<div class="container">
				  <div class="mySlides">
				    <div class="numbertext">1 / 6</div>
				    <img src="<%=request.getContextPath()%>/resources/images/<%=imglist[0] %>" style="width:100%">
				  </div>
				
				  <div class="mySlides">
				    <div class="numbertext">2 / 6</div>
				    <img src="<%=request.getContextPath()%>/resources/images/<%=imglist[1] %>" style="width:100%">
				  </div>
				
				  <div class="mySlides">
				    <div class="numbertext">3 / 6</div>
				    <img src="<%=request.getContextPath()%>/resources/images/<%=imglist[2] %>" style="width:100%">
				  </div>
				    
				  <div class="mySlides">
				    <div class="numbertext">4 / 6</div>
				    <img src="<%=request.getContextPath()%>/resources/images/<%=imglist[3] %>" style="width:100%">
				  </div>
				
				  <div class="mySlides">
				    <div class="numbertext">5 / 6</div>
				    <img src="<%=request.getContextPath()%>/resources/images/<%=imglist[4] %>" style="width:100%">
				  </div>
				    
				  <div class="mySlides">
				    <div class="numbertext">6 / 6</div>
				    <img src="<%=request.getContextPath()%>/resources/images/<%=imglist[5] %>" style="width:100%">
				  </div>
				    
				  <a class="prev" onclick="plusSlides(-1)" style="font-size:120px;">❮</a>
				  <a class="next" onclick="plusSlides(1)" style="font-size:120px;">❯</a>
				
				  
				</div>
        </div>
        <script>
            $('a[href="#ex1"]').click(function(event) {
              event.preventDefault();
         
              $(this).modal({
                fadeDuration: 250
              });
            });
            
            
            $('a[href="#ex2"]').click(function(event) {
                event.preventDefault();
           
                $(this).modal({
                  fadeDuration: 250
                });
              });
            
            var slideIndex = 1;
            showSlides(slideIndex);

            function plusSlides(n) {
              showSlides(slideIndex += n);
            }

            function currentSlide(n) {
              showSlides(slideIndex = n);
            }

            function showSlides(n) {
              var i;
              var slides = document.getElementsByClassName("mySlides");
              var dots = document.getElementsByClassName("demo");
              var captionText = document.getElementById("caption");
              if (n > slides.length) {slideIndex = 1}
              if (n < 1) {slideIndex = slides.length}
              for (i = 0; i < slides.length; i++) {
                  slides[i].style.display = "none";
              }
              for (i = 0; i < dots.length; i++) {
                  dots[i].className = dots[i].className.replace(" active", "");
              }
              slides[slideIndex-1].style.display = "block";
              dots[slideIndex-1].className += " active";
              captionText.innerHTML = dots[slideIndex-1].alt;
            }
        </script>
    </body>
</html>