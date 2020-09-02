<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.semiProject.Hotel.model.vo.*" %>
<% Hotel h = (Hotel)request.getAttribute("hd"); %>
<% ArrayList<HotelRoom> hrlist = (ArrayList<HotelRoom>)request.getAttribute("hrlist"); %>
<% HotelConvenience hc = (HotelConvenience)request.getAttribute("hc"); %>
<% HotelFacility hf = (HotelFacility)request.getAttribute("hf"); %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>hotel_detail</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="/semi/resources/css/mainpage.css">
        <link rel="stylesheet" href="/semi/resources/css/hotel_detail.css">
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src ="/semi/resources/js/script.js"></script>
    </head>
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

                            <div class="hotelimg">
                                <img src="<%=h.gethImg() %>" alt="">
                            </div>
                            <div class="pay-box">
                                <span id="h-name"><%= h.gethName() %></span>
                                <p id="price-before">&#8361;<%= h.gethPrice()*0.7+h.gethPrice() %></p>
                                <p id="price-after">&#8361;<%= h.gethPrice() %></p><br><br><br>
                                <p id="stars"><%= h.gethGrade() %>성급</p>
                                <p id="grade"><%= h.gethScore() %>점</p>
                                
                                <div id="facility">호텔 주요시설</div>
                                <div id="facility-preview">
                                    <div>애견 산책로</div>
                                    <%if(hf.getPool().equals("Y")){ %><div>공용 수영장</div> <%} %>
                                    <%if(hf.getRestaurant().equals("Y")){ %><div>레스토랑</div><%} %>
                                    <%if(hf.getfitness().equals("Y")){ %><div>피트니스 센터</div><%} %>
                                    <%if(hf.getDisabled().equals("Y")){ %><div>장애인</div><%} %>
                                    <%if(hf.getEvsc().equals("Y")){ %><div>전기차 충전소</div><%} %>
                                    <%if(hf.getWasher().equals("Y")){ %><div>세탁</div><%} %>
                                    <%if(hf.getBar().equals("Y")){ %><div>미니바</div><%} %>
                                    <%if(hf.getRooftop().equals("Y")){ %><div>루프탑</div><%} %>
                                    <%if(hf.getAirconditioner().equals("Y")){ %><div>공기청정기</div><%} %>
                                    <%if(hf.getTerrace().equals("Y")){ %><div>테라스</div><%} %>
                                    <%if(hf.getBalcony().equals("Y")){ %><div>발코니</div><%} %>
                                    <%if(hf.getSoundproof().equals("Y")){ %><div>방음시설</div><%} %>
                                    <%if(hf.getPaking().equals("Y")){ %><div>주차장</div><%} %>
                                    
                                </div>
                            </div>
                            <div class="facility-block">
                            	
                                <div class="facility-box">
                                    <div class="icon-box"><img src="/semi/resources/images/icons/subway-icon.png" alt=""></div>
                                    <p><%= hc.getTansport() %></p>
                                </div>
                                <% if(hc.getAirport().equals("Y")){ %>
                                <div class="facility-box">
                                    <div class="icon-box"><img src="/semi/resources/images/icons/airport-icon.png" alt=""></div>
                                    <p>공항 이동 교통편 서비스</p>
                                </div>
                                <% } %>
                                <div class="facility-box">
                                    <div class="icon-box"><img src="/semi/resources/images/icons/centerofcity-icon.png" alt=""></div>
                                    <p><%=hc.getLocation() %></p>
                                </div>
                                <% if(hc.getWifi().equals("Y")) { %>
                                <div class="facility-box">
                                    <div class="icon-box"><img src="/semi/resources/images/icons/wifi-icon.png" alt=""></div>
                                    <p>무료 Wi-Fi(모든객실)</p>
                                </div>
                                <% } %>
                                <% if(hc.getTub().equals("Y")) { %>
                                <div class="facility-box">
                                    <div class="icon-box"><img src="/semi/resources/images/icons/hotbath-icon.png" alt=""></div>
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
                                <div><a href="../review/review_list.jsp" style="float:right;">더보기</a></div>
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
                                   center: {lat: 37.538537, lng:  127.074660}, //위도 경도
                                   zoom: 16 //숫자클수록 지도가 자세히보임
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
   
                           </div>
                           <!-- 구글지도 -->
                        </div>
                        
                    </div>   

                    <div class="titleblock">
                        예약 가능한 객실 종류 2개
                    </div>
                    <table>
                    	<% for(HotelRoom hr : hrlist){ %>
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
			                                    <img src="<%= hr.getRimg() %>" alt="">
			                                    <a class="font-16" href="">객실 사진 및 상세 구성 보기</a>
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
			                                    <input class="font-16B" type="button" value="예약하기" onclick="location.href='/semi/hotelpayment.ys?hno=<%=h.gethNo()%>&hroom=<%=hr.getRname()%>'">
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
			                                    <input class="font-16B" type="button" value="예약하기" onclick="location.href='/semi/hotelpayment.ys?hno=<%=h.gethNo()%>&hroom=<%=hr.getRname()%>'">
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
    
    </body>
</html>