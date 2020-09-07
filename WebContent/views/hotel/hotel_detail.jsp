<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.semiProject.Hotel.model.vo.*,com.kh.semiProject.review.model.vo.*" %>
<% Hotel h = (Hotel)request.getAttribute("hd"); %>
<% ArrayList<HotelRoom> hrlist = (ArrayList<HotelRoom>)request.getAttribute("hrlist"); %>
<% HotelConvenience hc = (HotelConvenience)request.getAttribute("hc"); %>
<% String Cin = (String)request.getAttribute("Cin"); %>
<% String Cout = (String)request.getAttribute("Cout"); %>
<% ArrayList<Review> hre = (ArrayList<Review>)request.getAttribute("hreview"); %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>hotel_detail</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/mainpage.css">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/hotel_detail.css">
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src ="<%=request.getContextPath() %>/resources/js/script.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
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

        <!-- -------------------------- main --------------------------- -->
        
        <main>
            <div class="main-content">
                <!-- <div class="main-img"><img src="../resources/images/icons/pet_hotel-main.png" alt=""></div> -->
                <div class="main-img">
                    <div style="font-size: 30px; text-align: left;margin-top: 150px;"><%= h.gethPromotion() %></div>
                    <div style="width: 100%;height: 30px; background:orange;margin-top: 10px;"></div>
                </div>
                
                <div class="details">
                    <div class="maininfo">
                        <div class="box80">
							<% String[] himg = h.gethImg().split(","); %>
                            <div class="hotelimg">
                                <img src="<%=request.getContextPath()%>/resources/images/<%=himg[0] %>" alt="">                                
                            </div>
                            
                            <div class="pay-box">
                                <span id="h-name"><%= h.gethName() %></span>
                                <p id="price-before">&#8361;<%= h.gethPrice()*0.7+h.gethPrice() %></p>
                                <p id="price-after">&#8361;<%= h.gethPrice() %></p> <a href="#ex1">호텔 사진 보기</a> <br><br><br>
                                <p id="stars"><%= h.gethGrade() %>성급</p>
                                <p id="grade"><%= h.gethScore() %>점</p>
                                
                                <div id="facility">호텔 주요시설</div>
                                <div id="facility-preview">
                                    <div>애견 산책로</div>
                                    <div>공용 수영장</div>
                                    <div>레스토랑</div>
                                   <div>피트니스 센터</div>
                                    <div>장애인</div>
                                    <div>전기차 충전소</div>
                                    <div>세탁</div>
                                    <div>미니바</div>
                                    <div>루프탑</div>
                                    <div>공기청정기</div>
                                    <div>테라스</div>
                                    <div>발코니</div>
                                    <div>방음시설</div>
                                    <div>주차장</div>
                                    
                                </div>
                            </div>
                            <div class="facility-block">
                            	
                                <div class="facility-box">
                                    <div class="icon-box"><img src="<%=request.getContextPath() %>/resources/images/icons/subway-icon.png" alt=""></div>
                                    <p><%= hc.getTansport() %></p>
                                </div>
                                <% if(hc.getAirport().equals("Y")){ %>
                                <div class="facility-box">
                                    <div class="icon-box"><img src="<%=request.getContextPath() %>/resources/images/icons/airport-icon.png" alt=""></div>
                                    <p>공항 이동 교통편 서비스</p>
                                </div>
                                <% } %>
                                <div class="facility-box">
                                    <div class="icon-box"><img src="<%=request.getContextPath() %>/resources/images/icons/centerofcity-icon.png" alt=""></div>
                                    <p><%=hc.getLocation() %></p>
                                </div>
                                <% if(hc.getWifi().equals("Y")) { %>
                                <div class="facility-box">
                                    <div class="icon-box"><img src="<%=request.getContextPath() %>/resources/images/icons/wifi-icon.png" alt=""></div>
                                    <p>무료 Wi-Fi(모든객실)</p>
                                </div>
                                <% } %>
                                <% if(hc.getTub().equals("Y")) { %>
                                <div class="facility-box">
                                    <div class="icon-box"><img src="<%=request.getContextPath() %>/resources/images/icons/hotbath-icon.png" alt=""></div>
                                    <p>온수 욕조</p>
                                </div>
                                <% } %>
        
                            </div>
                        </div>
                        <div class="right-text">
                            <h1>이숙소의 리뷰</h1>
                            <hr>
                            <div class="reveiws">
                                <div class="reveiw">
                                <div id="reviewtext">“아이들을 믿고 맡길 수 있어요!”</div>
                                <div id="reviewwriter">h**woo12님</div>
                                </div>
                                <hr>
                                <div class="reveiw">
                                <div id="reviewtext">“일 때문에 어쩔 수 없이 믿고 맡길 곳이 없어서 수소문하여 찾은 곳인데 최고입...”</div>
                                <div id="reviewwriter">g**x848님</div>
                                </div>
                                <hr>
                                <div class="reveiw">
                                <div id="reviewtext">“일 때문에 어쩔 수 없이 믿고 맡길 곳이 없어서 수소문하여 찾은 곳인데 최고입...”</div>
                                <div id="reviewwriter">g**x848님</div>
                                </div>
                                <hr>
                                <div class="reveiw">
                                <div id="reviewtext">“개팔자가 상팔자네요.. 우리 꿀떡이가 여기 호텔 한번 맡겨지더니 너무 좋았는지...”</div>
                                <div id="reviewwriter">g**lttuck님</div>
                                </div>
                                <hr>
                                <% if(m !=null){ %>
                                <div><a href="<%= request.getContextPath() %>/views/review/review_write.jsp?type=hotel&cno=<%= h.gethNo() %>" style="float:right;">>리뷰 작성하기</a></div>
                                <%} %>
                                <div><a href="<%= request.getContextPath() %>/rvList2.th?type=hotel&ctno=<%=h.gethNo() %>" style="float:left;">>더보기</a></div>
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
                                   center: {lat: <%=h.getLat()%>, lng: <%=h.getLng()%>}, //위도 경도
                                   zoom: 16 //숫자클수록 지도가 자세히보임
                                   });
                                   
                                   image = new google.maps.MarkerImage( 'http://www.larva.re.kr/home/img/boximage3.png',
                                                               new google.maps.Size(60, 60),
                                                               '',
                                                               '',
                                                               new google.maps.Size(60, 60));
                                   
                                   marker = new google.maps.Marker({
                                               position: {lat:<%=h.getLat()%>, lng: <%=h.getLng()%>}, // 마커가 위치할 위도와 경도(변수)
                                               map: map,
                                               icon: image, // 마커로 사용할 이미지(변수)
                                               title: '<%=h.gethName()%>' // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
                                           });
                                   }
                               </script>
                           <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBvJ_OC7o2tQfl9tKh6H0nNQhU-GAoYp3c&callback=initMap" async defer></script>
   
                           </div>
                           <!-- 구글지도 -->
                        </div>
                        
                    </div>   

                    <div class="titleblock">

                    </div>
                    <table>
                    	<%for(HotelRoom hr : hrlist){ %>
        				<% String[] imglist = hr.getRimg().split(","); %>
                    		
                    		<tr>
			                    
			                    <div class="roomtype-block">
			                        <div class="roomtype">
			                            <div class="roomname">
			                                <p class="rname"><%= hr.getRname() %></p>
			                                <p class="red font-16">5시간 전에 예약됨</p>
			                            </div>
			                            <div class="category">
			                                <span class="categoryname" style="margin-right:150px;">객실/투숙 공간</span>
			                                <span class="categoryname" style="margin-right:320px;">상품 안내</span>
			                                <span class="categoryname" style="margin-right:35px;">최대 인원</span>
			                                <span class="categoryname" style="margin-right:75px;">요금 | 1박당</span>
			                                <span class="categoryname" style="margin-left: 30px"> 반려견 수</span>
			                            </div>
			                            <div class="basicoption">
			
			                                <div class="hotelimgS"> 
			                                    <img src="<%=request.getContextPath()%>/resources/images/<%=imglist[0]%>" alt="">
			                                </div>			                           
			                                <hr>
			                                <div class="roomfacility">
			                                    <li class="font-16 green"><img class="mini-icon" src="" alt="">무료 Wi-Fi</li>
			                                    <li class="font-16"><img class="mini-icon" src="" alt="">객실 크기<%=hr.getRsize() %></li>
			                                    <li class="font-16"><img class="mini-icon" src="" alt="">전망:<%=hr.getRview() %></li>
			                                  	<% if(hr.getRtub().equals("Y")){ %>
			                                    <li class="font-16"><img class="mini-icon" src="" alt="">샤워실 & 욕조</li>
			                                  	<%} %>
			                                  	<% if(hr.getRcheckin().equals("Y")){ %>
			                                    <li class="font-16"><img class="mini-icon" src="" alt="">간이주방</li>
			                                    <%} %>
			                                </div>
			                                <hr>
			                                <div class="point">
			                                    <p class="font-16">우수</p>
			                                </div>
			                            </div>
			                            <div class="roomoption">
			                                <div class="service" style="width:390px">
			                                    <span class="font-16B">[서비스/혜택]</span>
			                                    <% if(hc.getWifi().equals("Y")){ %><p class="font-16"><img src="" class="checkes-icon">무료 Wi-Fi</p><%} %>
			                                    <p class="font-16"><img src="" class="checkes-icon">예약 무료 취소</p>
			                                </div>
			                                <div class="headcount" style="width:118px; padding-left:10px;padding-right:10px;">
			                                    <p class="gray font-14">아동2명(12세 미만) 무료 투숙가능</p>
			                                </div>
			                                <div class="roomprice" style="width:175px; padding-right:10px;">
			                                    <div class="descount-text-box">*오늘 특가 할인*</div>
			                                    <p class="gray font-16" style="text-align: right;text-decoration: line-through;">&#8361;<%=hr.getRprice()*0.7+hr.getRprice() %></p>
			                                    <p class="red" style="font-size: 35px;text-align:right;font-weight: bold;">&#8361;<%= hr.getRprice() %></p>
			                                    <p class="gray" style="font-size: 13px;text-align: right;line-height: 25px;">1박당 요금 시작가</p>
			                                </div>
			                                <div class="numofroom" style="width:70px">
			                                <select name="numberofroom" id="numberselect">
			                                    <option value="1">1</option>
			                                    <option value="2">2</option>
			                                    <option value="3">3</option>
			                                </select>
			                                </div>
			                                <div class="reservation" style="width:175px;border: none;">
			                                	<%if(m != null) {%>
			                                    <input class="font-16B" type="button" value="예약하기" onclick="location.href='<%=request.getContextPath() %>/hotelpayment.ys?hno=<%=h.gethNo()%>&hroom=<%=hr.getRname()%>&checkin=<%=Cin%>&checkout=<%=Cout%>&breakfast=none'">
			                                    <%}else{ %>
			                                     <input class="font-16B" type="button" value="로그인후 가능합니다." >
			                                    <%} %>
			                                    <div >
			                                        <p class="font-14" style="line-height: 50px;">예약 취소 요금 없음</p>
			                                    </div>    
			                                </div>
			                            </div>
			                            <div class="roomoption">
			                                <div class="service" style="width:390px">
			                                    <span class="font-16B">[서비스/혜택]</span>
			                                    <p class="font-16"><img src="" class="checkes-icon">무료 Wi-Fi</p>
			                                    <p class="font-16"><img src="" class="checkes-icon">예약 무료 취소</p>
			                                    <p class="font-16"><img src="" class="checkes-icon">2인 조식 포함</p>
			                                </div>
			                                <div class="headcount" style="width:118px; padding-left:10px;padding-right:10px;">
			                                    <p class="gray font-14">아동2명(12세 미만) 무료 투숙가능</p>
			                                </div>
			                                <div class="roomprice" style="width:175px; padding-right:10px;">
			                                    <div class="descount-text-box">*오늘 특가 할인*</div>
			                                    <p class="gray font-16" style="text-align: right;text-decoration: line-through;">&#8361;<%=hr.getRprice()*0.7+hr.getRprice()+20000 %></p>
			                                    <p class="red" style="font-size: 35px;text-align:right;font-weight: bold;">&#8361;<%= hr.getRprice()+20000 %></p>
			                                    <p class="gray" style="font-size: 13px;text-align: right;line-height: 25px;">1박당 요금 시작가</p>
			                                </div>
			                                <div class="numofroom" style="width:70px">
			                                <select name="numberofroom" id="numberselect">
			                                    <option value="1">1</option>
			                                    <option value="2">2</option>
			                                    <option value="3">3</option>
			                                    <option value="4">4</option>
			                                    <option value="5">5</option>
			                                </select>
			                                </div>
			                                <div class="reservation" style="width:175px;border: none;">
			                                	<% if(m !=null) {%>
			                                    <input class="font-16B" type="button" value="예약하기" onclick="location.href='<%=request.getContextPath() %>/hotelpayment.ys?hno=<%=h.gethNo()%>&hroom=<%=hr.getRname()%>&checkin=<%=Cin%>&checkout=<%=Cout%>&breakfast=have'">
			                                    <%}else{ %>
			                                     <input class="font-16B" type="button" value="로그인후 가능합니다." >
			                                    <%} %>
			                                    <div >
			                                        <p class="font-14" style="line-height: 50px;">예약 취소 요금 없음</p>
			                                        
			                                    </div>    
			                                </div>
			                            </div>
			                            
			                        </div>
			                    </div>
		            		</tr>
		            	<% } %>
                    </table>
                        <div class="hotelrules">
                            <span>객실정책</span>
                            <hr>
                            <p>
                                · 호텔 이용 시간 24시 위탁이 가능한지 각 호텔 측에 확인 바랍니다. <br>
                                · 취소 및 선결제 숙소 유형에 따라 취소 및 선결제 정책이 달라집니다. <br>
                                    옵션을 선택할 때는 반드시 예약 조건을 확인해주시기 바랍니다. <br>
                                · 반려견 입실 정책 3차 접종 이하의 어린 강아지, 추가 접종이 되어 있지 않은 강아지, <br>
                                전염성이 있는 질병이 있는 반려견은 호텔 이용이 제한됩니다. <br>
                                · 주의사항 입실 시에 각 호텔 이용 준비물 참조 바랍니다.
                            </p>
                        </div>   
                </div>

                
                
            </div>
            
        </main>
        <!-- -------------------------- main --------------------------- -->

        <%@ include file = "../common/footer.jsp" %>
        
        <div id="ex1" class="modal" style=" max-width:1000px; ">
            
				<div class="container">
				  <div class="mySlides">
				    <div class="numbertext">1 / 6</div>
				    <img src="<%=request.getContextPath()%>/resources/images/<%=himg[0] %>" style="width:100%">
				  </div>
				
				  <div class="mySlides">
				    <div class="numbertext">2 / 6</div>
				    <img src="<%=request.getContextPath()%>/resources/images/<%=himg[1] %>" style="width:100%">
				  </div>
				
				  <div class="mySlides">
				    <div class="numbertext">3 / 6</div>
				    <img src="<%=request.getContextPath()%>/resources/images/<%=himg[2] %>" style="width:100%">
				  </div>
				    
				  <div class="mySlides">
				    <div class="numbertext">4 / 6</div>
				    <img src="<%=request.getContextPath()%>/resources/images/<%=himg[3] %>" style="width:100%">
				  </div>
				
				  <div class="mySlides">
				    <div class="numbertext">5 / 6</div>
				    <img src="<%=request.getContextPath()%>/resources/images/<%=himg[4] %>" style="width:100%">
				  </div>
				    
				  <div class="mySlides">
				    <div class="numbertext">6 / 6</div>
				    <img src="<%=request.getContextPath()%>/resources/images/<%=himg[5] %>" style="width:100%">
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