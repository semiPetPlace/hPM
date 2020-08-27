<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>main</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../resources/css/mainpage.css">
        <link rel="stylesheet" href="../../resources/css/mypage_basic.css">
        <link rel="stylesheet" href="../../resources/css/cafe-main.css">
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
                        <li class="page_nav"><a href="./mypage-scheduled.reservation.jsp">예약·결제 관리</a></li>
                        <li class="page_nav"><a href="./mypage-myplace.jsp">찜한 플레이스</a></li>
                        <li class="page_nav"><a href="./mypage-review.jsp">내가 쓴 게시글</a></li>
                        <br><br><br>
                        <li class="page_nav"><a href="./mypage-Member.Modification.jsp">회원 정보 수정</a></li>
                        
                        <li class="page_nav"><a href="./mypage-withdrawal.jsp">회원 탈퇴</a></li>
                    </ul>
                </div>
                
                <div id="showBox">
                    <table id="TTop">
                        <tr id="STop">
                            <div id="userInfo">
                                <tr>
                                    <td>
                                        <li><label id="userName" style="font-size: large; font-weight: 500;">Name</label></li>     
                                        <li><label id="userId" style="font-size: 14px; color: gray;">Id</label></li>
                                        <li><label id="phoneNum" style="font-size: 14px;">010-2222-3333</label></li>                           
                                    </td>
                                </tr>
                                
                            </div>
                        </tr>
                    </table>

                    <table id="TBottom">
                        <tr>
                            <p class="looked_around_place">내가 본 플레이스</p>
                        </tr>
                            <tr id="placeList1">
                                <tr class="place">
                                    <td>
                                        <div class="list">
                                            <a href="#"><img src="../../resources/images/hotel1.jpg" alt="" width="200px"></a>
                                            <ul>
                                                <li>종류</li>
                                                <li>상호명</li>
                                                <li>평점</li>
                                            </ul>
                                        </div>
                                        
                                    </td>
                                    <td>
                                        <div class="list">
                                            <a href="#"><img src="../../resources/images/hotel1.jpg" alt="" width="200px"></a>
                                            <ul>
                                                <li>종류</li>
                                                <li>상호명</li>
                                                <li>평점</li>
                                            </ul>
                                        </div>
                                        
                                    </td>
                                    <td>
                                        <div class="list">
                                            <a href="#"><img src="../../resources/images/hotel1.jpg" alt="" width="200px"></a>
                                            <ul>
                                                <li>종류</li>
                                                <li>상호명</li>
                                                <li>평점</li>
                                            </ul>
                                        </div>
                                        
                                    </td>
                                    <td>
                                        <div class="list">
                                            <a href="#"><img src="../../resources/images/hotel1.jpg" alt="" width="200px"></a>
                                            <ul>
                                                <li>종류</li>
                                                <li>상호명</li>
                                                <li>평점</li>
                                            </ul>
                                        </div>
                                        
                                    </td>
                                </tr>
                            </div>
                        </tr>
                        <tr class="place2">
                            <td>
                                <div class="list">
                                    <a href="#"><img src="../../resources/images/hotel1.jpg" alt="" width="200px"></a>
                                    <ul>
                                        <li>종류</li>
                                        <li>상호명</li>
                                        <li>평점</li>
                                    </ul>
                                </div>
                                
                            </td>
                            <td>
                                <div class="list">
                                    <a href="#"><img src="../../resources/images/hotel1.jpg" alt="" width="200px"></a>
                                    <ul>
                                        <li>종류</li>
                                        <li>상호명</li>
                                        <li>평점</li>
                                    </ul>
                                </div>
                                
                            </td>
                            <td>
                                <div class="list">
                                    <a href="#"><img src="../../resources/images/hotel1.jpg" alt="" width="200px"></a>
                                    <ul>
                                        <li>종류</li>
                                        <li>상호명</li>
                                        <li>평점</li>
                                    </ul>
                                </div>
                                
                            </td>
                            <td>
                                <div class="list">
                                    <a href="#"><img src="../../resources/images/hotel1.jpg" alt="" width="200px"></a>
                                    <ul>
                                        <li>종류</li>
                                        <li>상호명</li>
                                        <li>평점</li>
                                    </ul>
                                </div>
                                
                            </td>
                        </tr>
                    </div>
                </tr>
                    </table>
                </div>
                
            </div>
            
            
            
        </main>
        <!-- TOP -->
        <div style="height: 20px; margin: 2px;"><a href="#header" id="top">▲ TOP</a></div>

		<%@ include file = "../common/footer.jsp" %>
            
    </body>
</html>