<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.semiProject.Hotel.model.vo.*" %>
<% Hotel h = (Hotel)request.getAttribute("hd"); %>
<% HotelRoom hr = (HotelRoom)request.getAttribute("hr");%>
<% String petnum = (String)request.getAttribute("petnum");%>
<% String guestname = (String)request.getAttribute("guestname"); %>
<% String email = (String)request.getAttribute("email"); %>
<% String checkintime = (String)request.getAttribute("checkintime"); %>
<% String guestrequest = (String)request.getAttribute("guestrequest"); %>
<% String Cin = (String)request.getAttribute("Cin"); %>
<% String Cout = (String)request.getAttribute("Cout"); %>
<% String breakfast = (String)request.getAttribute("breakfast"); %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title></title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/mainpage.css">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/finishedReservation.css">
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src ="<%=request.getContextPath() %>/resources/js/script.js"></script>
    </head>
    <body>
        <%@ include file = "../common/header.jsp" %>
        <% String[] himg = h.gethImg().split(","); %>
        <main id="H_main">
            <div class="titleblock">
                <p style="font-size: 35px;padding-top: 100px;">예약 완료 </p>
            </div>
            <div style="width:1200px;height:15px;background:orange; margin: auto; margin-bottom: 20px;"></div>
            <div class="maincontent">
                <div class="reservationcheck">
                    <div class="hotelimg">
                        <img src="<%=request.getContextPath()%>/resources/images/<%=himg[0] %>" alt="">
                    </div>
                    <div class="details">
                        <div class="details-category">
                            <span>체크 인</span>
                            <span>체크 아웃</span>
                            <span>객실 명</span>
                            <span>예약자 명</span>
                            <span>반려견 수</span>
                            <span>예약 요금</span>
                            <%if(breakfast == "have"){%>
                            <span>호텔 조식이 같이 예약되었습니다.</span>
                            <%}%>
							
                        </div>
                        <div class="details-data">
                            <p id="check-in"><%=Cin %></p>
                            <p id="check-out"><%=Cout %></p>
                            <p id="room-type"><%=hr.getRname() %></p>
                            <p id="client-name"><%=guestname %></p>
                            <p id="headcount"><%=petnum%></p>
                            <p id="price">&#8361;<%=hr.getRprice()*0.1+hr.getRprice() %></p>


                        </div>
                        <div class="btn-block">
                            <div onclick="location.href='<%=request.getContextPath() %>/scheduledReser.ys?userid=<%=m.getMuserId()%>'">내 예약 확인하기</div>
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