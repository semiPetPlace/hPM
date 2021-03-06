<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>내가 쓴 게시글</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mainpage.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage-review.css">
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src ="<%=request.getContextPath()%>/resources/js/script.js"></script>
    </head>
    <body>
        	<%@ include file = "../common/header.jsp" %>

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
            
            <div id="review_list_content">
                <label class="review_list_lb">내가 쓴 게시글</label>
                <table id="review_list">
                        <tr class="review_row">
                            <td>
                                <div class="review1" onclick="location.href='<%=request.getContextPath()%>/views/review/review_detail.jsp'">
                                    <img src="<%=request.getContextPath()%>/resources/images/review_list/back1.jpg" class="reviewImg">
                                    <div class="review_content">
                                        <label>글 제목</label>
                                        <div>게시글 내용</div>
                                    </div>
                                </div>     
                            </td>
                            <td>
                                <div class="review2" onclick="location.href='<%=request.getContextPath()%>/views/review/review_detail.jsp'">
                                    <img src="<%=request.getContextPath()%>/resources/images/review_list/back1.jpg" class="reviewImg">
                                    <div class="review_content">
                                        <label>글 제목</label>
                                        <div>게시글 내용</div>
                                    </div>
                                </div>     
                            </td>
                            <td>
                                <div class="review2" onclick="location.href='<%=request.getContextPath()%>/views/review/review_detail.jsp'">
                                    <img src="<%=request.getContextPath()%>/resources/images/review_list/back1.jpg" class="reviewImg">
                                    <div class="review_content">
                                        <label>글 제목</label>
                                        <div>게시글 내용</div>
                                    </div>
                                </div>     
                            </td>
                            <td>
                                <div class="review3" onclick="location.href='<%=request.getContextPath()%>/views/review/review_detail.jsp'">
                                    <img src="<%=request.getContextPath()%>/resources/images/review_list/back1.jpg" class="reviewImg">
                                    <div class="review_content">
                                        <label>글 제목</label>
                                        <div>게시글 내용</div>
                                    </div>
                                </div>     
                            </td>
                        </tr>
   
                        <tr class="review_row">
                            <td>
                                <div class="review1" onclick="location.href='<%=request.getContextPath()%>/views/review/review_detail.jsp'">
                                    <img src="<%=request.getContextPath()%>/resources/images/review_list/back1.jpg" class="reviewImg">
                                    <div class="review_content">
                                        <label>글 제목</label>
                                        <div>게시글 내용</div>
                                    </div>
                                </div>     
                            </td>
                            <td>
                                <div class="review2" onclick="location.href='<%=request.getContextPath()%>/views/review/review_detail.jsp'">
                                    <img src="<%=request.getContextPath()%>/resources/images/review_list/back1.jpg" class="reviewImg">
                                    <div class="review_content">
                                        <label>글 제목</label>
                                        <div>게시글 내용</div>
                                    </div>
                                </div>     
                            </td>
                            <td>
                                <div class="review2" onclick="location.href='<%=request.getContextPath()%>/views/review/review_detail.jsp'">
                                    <img src="<%=request.getContextPath()%>/resources/images/review_list/back1.jpg" class="reviewImg">
                                    <div class="review_content">
                                        <label>글 제목</label>
                                        <div>게시글 내용</div>
                                    </div>
                                </div>     
                            </td>
                            <td>
                                <div class="review3" onclick="location.href='<%=request.getContextPath()%>/views/review/review_detail.jsp'">
                                    <img src="<%=request.getContextPath()%>/resources/images/review_list/back1.jpg" class="reviewImg">
                                    <div class="review_content">
                                        <label>글 제목</label>
                                        <div>게시글 내용</div>
                                    </div>
                                </div>     
                            </td>
                        </tr>
   
                        <tr class="review_row">
                            <td>
                                <div class="review1" onclick="location.href='<%=request.getContextPath()%>/views/review/review_detail.jsp'">
                                    <img src="<%=request.getContextPath()%>/resources/images/review_list/back1.jpg" class="reviewImg">
                                    <div class="review_content">
                                        <label>글 제목</label>
                                        <div>게시글 내용</div>
                                    </div>
                                </div>     
                            </td>
                            <td>
                                <div class="review2" onclick="location.href='<%=request.getContextPath()%>/views/review/review_detail.jsp'">
                                    <img src="<%=request.getContextPath()%>/resources/images/review_list/back1.jpg" class="reviewImg">
                                    <div class="review_content">
                                        <label>글 제목</label>
                                        <div>게시글 내용</div>
                                    </div>
                                </div>     
                            </td>
                            <td>
                                <div class="review2" onclick="location.href='<%=request.getContextPath()%>/views/review/review_detail.jsp'">
                                    <img src="<%=request.getContextPath()%>/resources/images/review_list/back1.jpg" class="reviewImg">
                                    <div class="review_content">
                                        <label>글 제목</label>
                                        <div>게시글 내용</div>
                                    </div>
                                </div>     
                            </td>
                            <td>
                                <div class="review3" onclick="location.href='<%=request.getContextPath()%>/views/review/review_detail.jsp'">
                                    <img src="<%=request.getContextPath()%>/resources/images/review_list/back1.jpg" class="reviewImg">
                                    <div class="review_content">
                                        <label>글 제목</label>
                                        <div>게시글 내용</div>
                                    </div>
                                </div>     
                            </td>
                        </tr>
                </table>
   
                <div id="post_num">
                    <ul id="num">
                        <li><input type="button" value="◀"></li>
                        <li><input type="button" value="1" onclick="location.href='./mypage-review.jsp' "></li>
                        <li><input type="button" value="2" onclick="location.href='./mypage-review.jsp' "></li>
                        <li><input type="button" value="3" onclick="location.href='./mypage-review.jsp' "></li>
                        <li><input type="button" value="4" onclick="location.href='./mypage-review.jsp' "></li>
                        <li><input type="button" value="5" onclick="location.href='./mypage-review.jsp' "></li>
                        <li><input type="button" value="▶"></li>
                    </ul>
                </div>
            </div>
        </div>


         
   
         <!-- TOP -->
         <div style="height: 20px; margin-right: 2%;"><a href="#header" id="top">▲ TOP</a></div>
         
         <%@ include file = "../common/footer.jsp" %>
         
    </body>
</html>