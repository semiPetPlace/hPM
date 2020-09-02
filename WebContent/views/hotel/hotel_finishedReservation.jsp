<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.semiProject.Hotel.model.vo.*" %>
<% Hotel h = (Hotel)request.getAttribute("hd"); %>
<% HotelRoom hr = (HotelRoom)request.getAttribute("hr");%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title></title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../resources/css/mainpage.css">
        <link rel="stylesheet" href="../../resources/css/finishedReservation.css">
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src ="../../resources/js/script.js"></script>
    </head>
    <body>
        <%@ include file = "../common/header.jsp" %>
        <main id="H_main">
            <div class="titleblock">
                <p style="font-size: 35px;padding-top: 100px;">예약 완료 </p>
            </div>
            <div style="width:1200px;height:15px;background:orange; margin: auto; margin-bottom: 20px;"></div>
            <div class="maincontent">
                <div class="reservationcheck">
                    <div class="hotelimg">
                        <img src="../../resources/images/hotel1.jpg" alt="">
                    </div>
                    <div class="details">
                        <div class="details-category">
                            <span>체크 인</span>
                            <span>체크 아웃</span>
                            <span>객실 명</span>
                            <span>예약자 명</span>
                            <span>반려견 수</span>
                            <span>예약 요금</span>

                        </div>
                        <div class="details-data">
                            <p id="check-in">2020년 05월 07일 (목)</p>
                            <p id="check-out">2020년 12월 8일 (금)</p>
                            <p id="room-type"><%=hr.getRname() %></p>
                            <p id="client-name">윤수 한</p>
                            <p id="headcount">2</p>
                            <p id="price">&#8361;<%=hr.getRprice()*0.1+hr.getRprice() %></p>


                        </div>
                        <div class="btn-block">
                            <div onclick="location. href='../mypage/mypage-reservation.payment.jsp'">내 예약 확인하기</div>
                        </div>
                    </div>
                </div>
                <div class="moredetails">

                </div>
            </div>
        </main>
         <!-- TOP -->
         <div style="height: 20px; margin: 2px;"><a href="#header" id="top">▲ TOP</a></div>

         <%@ include file = "../common/footer.jsp" %>
    </body>
</html>