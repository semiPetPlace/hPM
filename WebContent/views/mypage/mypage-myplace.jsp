<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>찜한 플레이스</title>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mainpage.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/cafe-main.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage_myplace.css">


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
                    
    
                </div>
            </div>

            <div id="myplace">
                <label style="margin-bottom: 20px; font-size: 20px; font-weight: bold; margin-top: 5px;">찜한 플레이스</label>
                <table id="placeList">
                    <tr>
                        <td><a href="../hotel/hotel_detail.jsp"><img src="<%=request.getContextPath()%>/resources/images/hotel3.jpg" class="placeImg"> <br> 
                            <div class="recode">
                            <ul>
                                <li>종류</li>
                                <li>상호명</li>
                                <li>평점</li>
                            </ul>
                            </div>
                        </a></td>
                        <td><a href="../pethotel/pet_hotel_detail.jsp"><img src="<%=request.getContextPath()%>/resources/images/hotel3.jpg" class="placeImg"> <br> 
                            <div class="recode">
                            <ul>
                                <li>종류</li>
                                <li>상호명</li>
                                <li>평점</li>
                            </ul>
                            </div>
                        </a></td>
                        <td><a href="../restaurant/restaurant_detailpage.jsp"><img src="<%=request.getContextPath()%>/resources/images/hotel3.jpg" class="placeImg"> <br> 
                            <div class="recode">
                            <ul>
                                <li>종류</li>
                                <li>상호명</li>
                                <li>평점</li>
                            </ul>
                            </div>
                        </a></td>
                        <td><a href="../cafe/cafe-detailpage.jsp"><img src="<%=request.getContextPath()%>/resources/images/hotel3.jpg" class="placeImg"> <br> 
                            <div class="recode">
                            <ul>
                                <li>종류</li>
                                <li>상호명</li>
                                <li>평점</li>
                            </ul>
                            </div>
                        </a></td>

                    </tr>
                    <tr>
                        <td><a href="../hotel/hotel_detail.jsp"><img src="<%=request.getContextPath()%>/resources/images/hotel3.jpg" class="placeImg"> <br> 
                            <div class="recode">
                            <ul>
                                <li>종류</li>
                                <li>상호명</li>
                                <li>평점</li>
                            </ul>
                            </div>
                        </a></td>
                        <td><a href="../pethotel/pet_hotel_detail.jsp"><img src="<%=request.getContextPath()%>/resources/images/hotel3.jpg" class="placeImg"> <br> 
                            <div class="recode">
                            <ul>
                                <li>종류</li>
                                <li>상호명</li>
                                <li>평점</li>
                            </ul>
                            </div>
                        </a></td>
                        <td><a href="../restaurant/restaurant_detailpage.jsp"><img src="<%=request.getContextPath()%>/resources/images/hotel3.jpg" class="placeImg"> <br> 
                            <div class="recode">
                            <ul>
                                <li>종류</li>
                                <li>상호명</li>
                                <li>평점</li>
                            </ul>
                            </div>
                        </a></td>
                        <td><a href="../cafe/cafe-detailpage.jsp"><img src="<%=request.getContextPath()%>/resources/images/hotel3.jpg" class="placeImg"> <br> 
                            <div class="recode">
                            <ul>
                                <li>종류</li>
                                <li>상호명</li>
                                <li>평점</li>
                            </ul>
                            </div>
                        </a></td>

                    </tr>
                    <tr>
                        <td><a href="../hotel/hotel_detail.jsp"><img src="<%=request.getContextPath()%>/resources/images/hotel3.jpg" class="placeImg"> <br> 
                            <div class="recode">
                            <ul>
                                <li>종류</li>
                                <li>상호명</li>
                                <li>평점</li>
                            </ul>
                            </div>
                        </a></td>
                        <td><a href="../pethotel/pet_hotel_detail.jsp"><img src="<%=request.getContextPath()%>/resources/images/hotel3.jpg" class="placeImg"> <br> 
                            <div class="recode">
                            <ul>
                                <li>종류</li>
                                <li>상호명</li>
                                <li>평점</li>
                            </ul>
                            </div>
                        </a></td>
                        <td><a href="../restaurant/restaurant_detailpage.jsp"><img src="<%=request.getContextPath()%>/resources/images/hotel3.jpg" class="placeImg"> <br> 
                            <div class="recode">
                            <ul>
                                <li>종류</li>
                                <li>상호명</li>
                                <li>평점</li>
                            </ul>
                            </div>
                        </a></td>
                        <td><a href="../cafe/cafe-detailpage.jsp"><img src="<%=request.getContextPath()%>/resources/images/hotel3.jpg" class="placeImg"> <br> 
                            <div class="recode">
                            <ul>
                                <li>종류</li>
                                <li>상호명</li>
                                <li>평점</li>
                            </ul>
                            </div>
                        </a></td>

                    </tr>
                </table>
            </div>
        </form>
            <div id="emptyPlace">
                <img src="" alt="">
            </div>
        </main>
        
        <!-- TOP -->
        <div style="height: 20px;"><a href="#header" id="top">▲ TOP</a></div>
        
        <%@ include file = "../common/footer.jsp" %>

    </body>
</html>