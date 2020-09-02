<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.semiProject.Hotel.model.vo.*" %>
<% PetHotel ph = (PetHotel)request.getAttribute("ph"); %>
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
    }
    #modalinfo>li{
    font-size: 20px;
    font-weight:500;
    margin-top:5px
    }
	
    </style>
    <body>
        	<%@ include file = "../common/header.jsp" %>
        	
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
                                <img src="/semi/resources/images/hotelmian1.jpg" alt="">
                            </div>
                            <div class="pay-box">
                                <span id="h-name"><%=ph.getPhname() %></span>
                                <p id="price-before">&#8361;<%=ph.getPhprice()*0.7+ph.getPhprice() %></p>
                                <p id="price-after">&#8361;<%=ph.getPhprice() %></p><br><br><br>
                                <p id="grade"><%=ph.getPhscore()+5 %>점</p>
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
        <script>
            $('a[href="#ex1"]').click(function(event) {
              event.preventDefault();
         
              $(this).modal({
                fadeDuration: 250
              });
            });
        </script>
    </body>
</html>