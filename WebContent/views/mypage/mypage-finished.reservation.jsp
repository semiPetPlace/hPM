<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.*, com.kh.semiProject.mypage.model.vo.*" %>
<% ArrayList<ReservationMana> reserList = (ArrayList<ReservationMana>)request.getAttribute("reserList");%>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>투숙완료 예약</title>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mainpage.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage_scheduled.css">
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src ="<%=request.getContextPath()%>/resources/js/script.js"></script>
    </head>
    <style>
    #showImg>img{
    width: 200px;
    height: 200px;
    margin-left: 1px;
    padding: 10px;
	}
    </style>
    <body>
        <%@ include file = "../common/header.jsp" %>
        <main id="H_main">
            <div id="main_wrapper">
                <div id="imgFile">
                    <img src="" alt="">
                </div>
                <div id="mypage_nav">
                    <ul id="mypage_nav_main" class="page_nav">
                        <li><a href="./mypage-basic.jsp">마이페이지</a></li>
                    </ul>
                    <ul id="mypage_nav_sub">
                        <li class="page_nav"><a href="<%=request.getContextPath() %>/scheduledReser.ys?userid=<%=m.getMuserId()%>">예약·결제 관리</a></li>
                        <li class="page_nav"><a href="./mypage-myplace.jsp">찜한 플레이스</a></li>
                        <li class="page_nav"><a href="./mypage-review.jsp">내가 쓴 게시글</a></li>
                        <br><br><br>
                        <li class="page_nav"><a href="./mypage-Member.Modification.jsp">회원 정보 수정</a></li>
                        
                        <li class="page_nav"><a href="./mypage-withdrawal.jsp">회원 탈퇴</a></li>
                    </ul>
                </div>
                
            </div>
            <!-- 여기까지 네비 -->

            <div id="showbox">
                <div id="innerNav">
                    <th>
                        <td><a href="<%=request.getContextPath() %>/scheduledReser.ys?userid=<%=m.getMuserId()%>">투숙예정 예약</a></td>
                    </th>
                    <th>
                        <td><a href="<%=request.getContextPath() %>/finishedReser.ys?userid=<%=m.getMuserId()%>" style="border-bottom: 3px solid #ffb600;">투숙완료 예약</a></td>
                    </th>
                    <th>
                        <td><a href="<%= request.getContextPath()%>/canceledReser.ys?userid=<%=m.getMuserId()%>">취소된 예약</a></td>
                    </th>
                </div>

                <!-- 1번예약 -->
                <% if(reserList !=null){ %>
                <% for(ReservationMana rvm : reserList){ %>
              	<% String[] himg = rvm.getReserHotelimg().split(","); %>
                <div class="hotelList">
                    <table>
                       <tr style="display: flex; padding: 10px;">                           
                            <td class="guestRecode" style="width:70%">
                                <div id="showRecode">
                                    <ul>
                                    	
                                        <li>예약번호 : H-<%=rvm.getReserDate()%>.<%=rvm.getReserNo() %></li>
                                        <li>예약자명 : <%=rvm.getReserGuestid() %></li>
                                        <li>연 락 처  : <%=rvm.getReserGuestemail() %></li>
                                        <li>호 텔 명  :<%=rvm.getReserhotelname() %></li>
                                        <li>체 크 인  :<%=rvm.getReserCheckin() %></li>
                                        <li>체크아웃 :<%=rvm.getReserCheckout() %></li>
                                        <li>결제금액 :<%=rvm.getReserTotalprice() %></li>
    
                                    </ul>
                                </div>
                            </td>
    
                            <td>
                                <div id="showImg" >
                                    <img src="<%=request.getContextPath()%>/resources/images/<%=himg[0] %>" alt="" >
                                </div>
                            </td>
                       </tr>
                    </table>
                    <div id="viewDetail">
                        <a href="<%=request.getContextPath() %>/detailReser.ys?reserno=<%=rvm.getReserNo() %>">> 상세 예약 보기</a>
                    </div>
                </div>
                <%} %>
                <%} %>
                <!-- 1번예약 끝 -->

            </div>
            <div id="emptyPlace">
                <img src="" alt="">
            </div>

        </main>
         <!-- TOP -->
         <div style="height: 20px; margin: 2px;"><a href="#header" id="top">▲ TOP</a></div>

         <%@ include file = "../common/footer.jsp" %>
    </body>
</html>