<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>투숙완료 예약</title>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../resources/css/mainpage.css">
        <link rel="stylesheet" href="../../resources/css/mypage_scheduled.css">
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src ="../../resources/js/script.js"></script>
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
                        <li><a href="./mypage-basic.jsp">마이페이지</a></li>
                    </ul>
                    <ul id="mypage_nav_sub">
                        <li class="page_nav"><a href="./mypage-reservation.payment.jsp">예약·결제 관리</a></li>
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
                        <td><a href="./mypage-scheduled.reservation.jsp">투숙예정 예약</a></td>
                    </th>
                    <th>
                        <td><a href="./mypage-finished.reservation.jsp" style="border-bottom: 3px solid #ffb600;">투숙완료 예약</a></td>
                    </th>
                    <th>
                        <td><a href="./mypage-canceled.reservation.jsp">취소된 예약</a></td>
                    </th>
                </div>

                <!-- 1번예약 -->
                <div class="hotelList">
                    <table>
                       <tr style="display: flex; padding: 10px;">
                            <td class="guestRecode">
                                <div id="showList">
                                    
                                    <ul>
                                        <li>예약번호</li>
                                        <li>예약자명</li>
                                        <li>연락처</li>
                                        <li>비상연락처</li>
                                        <li>호텔명</li>
                                        <li>체크인</li>
                                        <li>체크아웃</li>
                                        <li>결제금액</li>
                                    </ul>
                                    
                                </div>
                            </td>
                            
                            <td class="guestRecode">
                                <div id="showRecode">
                                    <ul>
                                        <li>0102222222</li>
                                        <li>한윤수</li>
                                        <li>01020425685</li>
                                        <li>01020425685</li>
                                        <li>반얀트리 호텔</li>
                                        <li>2020.8.8. 15:00 </li>
                                        <li>2020.8.9. 12:00</li>
                                        <li>3,800,000</li>
    
                                    </ul>
                                </div>
                            </td>
    
                            <td>
                                <div id="showImg">
                                    <img src="../../resources/images/hotel4.jpg" alt="">
                                </div>
                            </td>
                       </tr>
                    </table>
                    <div id="viewDetail">
                        <a href="./mypage-reservation.payment.jsp">> 상세 예약 보기</a>
                        <a href="../review/review_write.jsp">> 리뷰 작성하기</a>
                    </div>
                </div>
                <!-- 1번예약 끝 -->
                <!-- 2번예약 -->
                <div class="hotelList">
                    <table>
                       <tr style="display: flex; padding: 10px;">
                            <td class="guestRecode">
                                <div id="showList">
                                    
                                    <ul>
                                        <li>예약번호</li>
                                        <li>예약자명</li>
                                        <li>연락처</li>
                                        <li>비상연락처</li>
                                        <li>호텔명</li>
                                        <li>체크인</li>
                                        <li>체크아웃</li>
                                        <li>결제금액</li>
                                    </ul>
                                    
                                </div>
                            </td>
                            
                            <td class="guestRecode">
                                <div id="showRecode">
                                    <ul>
                                        <li>0102222222</li>
                                        <li>한윤수</li>
                                        <li>01020425685</li>
                                        <li>01020425685</li>
                                        <li>반얀트리 호텔</li>
                                        <li>2020.8.8. 15:00 </li>
                                        <li>2020.8.9. 12:00</li>
                                        <li>3,800,000</li>
    
                                    </ul>
                                </div>
                            </td>
    
                            <td>
                                <div id="showImg">
                                    <img src="../../resources/images/hotel4.jpg" alt="">
                                </div>
                            </td>
                       </tr>
                    </table>
                    <div id="viewDetail">
                        <a href="./mypage-reservation.payment.jsp">> 상세 예약 보기</a>
                        <a href="../review/review_write.jsp">> 리뷰 작성하기</a>
                    </div>
                </div>
                <!-- 2번예약 끝 -->

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