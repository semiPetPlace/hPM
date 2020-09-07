<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.semiProject.mypage.model.vo.*" %>
<% ArrayList<ReservationMana> reserList = (ArrayList<ReservationMana>)request.getAttribute("reserList");%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>상세 예약 보기</title>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mainpage.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/cafe-main.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage_managment.css">


        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src ="<%=request.getContextPath()%>/resources/js/script.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
    </head>
    <body>
        
        	<%@ include file = "../common/header.jsp" %>
        	
        <main id="H_main">
            <div id="main_wrapper">
                <div id="imgFile">
                    <img src="" alt="">
                </div>
                <div id="mypage_nav">
                    <ul id="mypage_nav_main" class="page_nav">
                        <li><a href="<%=request.getContextPath() %>/basic.ys?">마이페이지</a></li>
                    </ul>
                    <ul id="mypage_nav_sub">
                        <li class="page_nav"><a href="<%=request.getContextPath() %>/scheduledReser.ys?userid=<%=m.getMuserId()%>">예약·결제 관리</a></li>
                        <li class="page_nav"><a href="<%=request.getContextPath() %>/myplace.ys">찜한 플레이스</a></li>
                        <li class="page_nav"><a href="<%=request.getContextPath() %>/review.ys">내가 쓴 게시글</a></li>
                        <br><br><br>
                        <li class="page_nav"><a href="<%=request.getContextPath() %>/membermodification.ys">회원 정보 수정</a></li>
                        
                        <li class="page_nav"><a href="<%=request.getContextPath() %>/withdrawal.ys">회원 탈퇴</a></li>
                    </ul>
                </div>
                
                <div id="revervation_info">
                    <table>
                        <th id="hotelImg">
                            <img src="<%=request.getContextPath()%>/resources/images/hotel1.jpg" alt="">                        
                        </th>
                        <% if(reserList !=null){ %>
               			<% for(ReservationMana rvm : reserList){ %>
              			<% String[] himg = rvm.getReserHotelimg().split(","); %>
                        <td class="Reservation_recode">
                            <div id="ReservationNum">예약번호 <label id="ReNum" class="userInfo" >H-<%=rvm.getReserDate()%>.<%=rvm.getReserNo() %></label></div>
                            <div id="checkIn">체크인 <label id="CIn" class="userInfo"><%=rvm.getReserCheckin() %></label></div>
                            <div id="checkOut">체크아웃 <label id="COut" class="userInfo" ><%=rvm.getReserCheckout() %></label></div>
                            <div id="checkintime">체크인시간 <label id="cintime" class="userInfo" ><%=rvm.getReserCheckintime() %></label></div>
                            <div id="hotelNum">이메일 정보 <label id="Tel" class="userInfo"  ><%=rvm.getReserGuestemail() %></label></div>
                            <div id="guestName">투숙객 이름 <label id="GName" class="userInfo" ><%=rvm.getReserGuestid() %></label></div>
                            <div id="reserhotelname">예약호텔 <label id="hname" class="userInfo" ><%=rvm.getReserhotelname() %></label></div>
                            <div id="reservationRoom">예약객실 <label id="RType" class="userInfo"><%=rvm.getReserRoom() %></label></div>
                             
                                <label id="Dimg"><img src="<%=request.getContextPath()%>/resources/images/mypage/dog.png" width="20px" height="20px" style="margin-left: 10px;">반려견</label>
                                <lable id="DNum" class="userInfo"><%=rvm.getReserPetnumber()%>마리</lable>
                            </div>
                            
                            <div id="TaxService" >세금 및 봉사료 <label id="tax" class="userInfo"><%=Integer.parseInt(rvm.getReserTotalprice())/11%></label></div>
                            <div id="totalPayment">총 결제 금액 <label id="TotalPay" class="userInfo"><%=rvm.getReserTotalprice() %></label></div>
                            


                        </td>
                        <%} %>
                        <%} %>
                        
                        
                    </table>
                    


                    <div id="CancellationPolicy">
                        <div>
                            <p id="cancelTitle">취소 정책</p>
                        </div>
    
                        <div id="cancelNoticeText">
                            <ul>
                                <li> <b style="font-weight: bold;">체크인 14일 전</b>까지(예약 확인 이메일에 명시된 시간 기준) 무료로 예약을 취소할 수 있습니다. </li>
                                <li>체크인까지 14일이 남지 않은 시점에 예약했다면, 예약 후 48시간이 경과하지 않았으며 체크인까지 5일 이상 남은 경우, 무료로 취소할 수 있습니다.</li>
                                <li>그 후에는 체크인 5일 전까지 취소하면 서비스 수수료를 제외한 숙박 요금과 청소비가 환불됩니다.</li>
                            </ul> 
                        </div>
                        <p>(예시)</p>
                        <br>
                        
                        
                        <div class="tooltipContainer">
                            <div class="tooltip">
                                <div class="tooltipBox" id="toolBefore">
                                    <p>체크인 5일전</p>
                                </div>
                            </div>
                            <div class="tooltip">
                                <div class="tooltipBox" id="toolBefore">
                                    <p>체크인</p>
                                </div>
                            </div>
                            <div class="tooltip">
                                <div class="tooltipBox" id="toolBefore">
                                    <p>체크아웃</p>
                                </div>
                            </div>
                        </div>
                        <div class="timeLine-container">

                            <div class="noticeContainer">
                                <div class="reserbox" id="Rbox1">
                                    <div class="timeLinePointer"></div>
                                </div>
                                <div class="reserbox" id="Rbox2">
                                    <div class="timeLinePointer"></div>
                                </div>
                                <div class="reserbox" id="Rbox3">
                                    <div class="timeLinePointer"></div>
                                </div>
                            </div>
                            
                            <div class="noticeContainer">
                                <div class="timeLimit">
                                    8월 16일(일) 15:00
                                </div>
                                <div class="timeLimit">
                                    8월 21일(일) 15:00
                                </div>
                                <div class="timeLimit">
                                    8월 24일(일) 15:00
                                </div>
                            </div>

                            <div class="noticeContainer">
                                <div class="noticeText">
                                    <p>
                                        숙박 요금 전액을 환불받으려면, <br>
                                        게스트가 숙소의 현지 체크인 시간 기준(확인 이메일에 명시) 5일 전까지 취소해야 합니다. <br>
                                        게스트가 무료 취소 기간 내에 예약을 취소하지 않으면 서비스 수수료는 환불되지 않습니다.
                                    </p>
                                </div>
                                <div class="noticeText">
                                    <p>
                                        체크인 날짜로부터 5일이 남지 않은 시점에 취소를 요청하는 경우 <br>
                                        첫째날에 대한 1박 요금은 환불이 불가능하나 나머지 기간에 대해서는 50%를 환불받을 수 있습니다.
                                    </p>
                                </div>
                                <div class="noticeText">
                                    <p>
                                        게스트가 숙소에 도착한 후 예정보다 빨리 떠나게 되는 경우에도, <br>
                                        나머지 숙박요금에 대하여 환불이 진행되지 않습니다.
                                    </p>
                                </div>
                            </div>
                        </div>
                        <p style="font-size: 15px;">주의: 지난 12개월 동안 서비스 수수료를 3회 환불받았거나 취소된 예약이 기존 예약과 중복되는 경우, 게스트는 서비스 수수료를 환불받을 수 없습니다.</p>

                    </div>
    
                </div>
            </div>
            <div id="emptyPlace">
                <img src="" alt="">
            </div>
        </main>
        
        <!-- TOP -->
        <div style="height: 20px;"><a href="#header" id="top">▲ TOP</a></div>
        
        <%@ include file = "../common/footer.jsp" %>

    </body>
</html>