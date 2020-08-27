<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>내가쓴 게시글</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../resources/css/mainpage.css">
        <link rel="stylesheet" href="../../resources/css/review_list.css">
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src ="../../resources/js/script.js"></script>
    </head>
    <body>
        <%@ include file = "../common/header.jsp" %>


        <div id="main">
        <div id="reviewlist_top">
            <img src="../../resources/images/review_list/review-board.png" alt="플레이스 리뷰">
        </div>
         <div id="review_list_content">
             <table id="review_list">
                     <tr class="review_row">
                         <td>
                             <div class="review1" onclick="location.href='./review_detail.jsp'">
                                 <img src="../../resources/images/review_list/back1.jpg" class="reviewImg">
                                 <div class="review_content">
                                     <label>글 제목</label>
                                     <div>게시글 내용</div>
                                 </div>
                             </div>     
                         </td>
                         <td>
                             <div class="review2" onclick="location.href='./review_detail.jsp'">
                                 <img src="../../resources/images/review_list/back1.jpg" class="reviewImg">
                                 <div class="review_content">
                                     <label>글 제목</label>
                                     <div>게시글 내용</div>
                                 </div>
                             </div>     
                         </td>
                         <td>
                             <div class="review2" onclick="location.href='./review_detail.jsp'">
                                 <img src="../../resources/images/review_list/back1.jpg" class="reviewImg">
                                 <div class="review_content">
                                     <label>글 제목</label>
                                     <div>게시글 내용</div>
                                 </div>
                             </div>     
                         </td>
                         <td>
                             <div class="review3" onclick="location.href='./review_detail.jsp'">
                                 <img src="../../resources/images/review_list/back1.jpg" class="reviewImg">
                                 <div class="review_content">
                                     <label>글 제목</label>
                                     <div>게시글 내용</div>
                                 </div>
                             </div>     
                         </td>
                     </tr>

                     <tr class="review_row">
                         <td>
                             <div class="review1" onclick="location.href='./review_detail.jsp'">
                                 <img src="../../resources/images/review_list/back1.jpg" class="reviewImg">
                                 <div class="review_content">
                                     <label>글 제목</label>
                                     <div>게시글 내용</div>
                                 </div>
                             </div>     
                         </td>
                         <td>
                             <div class="review2" onclick="location.href='./review_detail.jsp'">
                                 <img src="../../resources/images/review_list/back1.jpg" class="reviewImg">
                                 <div class="review_content">
                                     <label>글 제목</label>
                                     <div>게시글 내용</div>
                                 </div>
                             </div>     
                         </td>
                         <td>
                             <div class="review2" onclick="location.href='./review_detail.jsp'">
                                 <img src="../../resources/images/review_list/back1.jpg" class="reviewImg">
                                 <div class="review_content">
                                     <label>글 제목</label>
                                     <div>게시글 내용</div>
                                 </div>
                             </div>     
                         </td>
                         <td>
                             <div class="review3" onclick="location.href='./review_detail.jsp'">
                                 <img src="../../resources/images/review_list/back1.jpg" class="reviewImg">
                                 <div class="review_content">
                                     <label>글 제목</label>
                                     <div>게시글 내용</div>
                                 </div>
                             </div>     
                         </td>
                     </tr>

                     <tr class="review_row">
                         <td>
                             <div class="review1" onclick="location.href='./review_detail.jsp'">
                                 <img src="../../resources/images/review_list/back1.jpg" class="reviewImg">
                                 <div class="review_content">
                                     <label>글 제목</label>
                                     <div>게시글 내용</div>
                                 </div>
                             </div>     
                         </td>
                         <td>
                             <div class="review2" onclick="location.href='./review_detail.jsp'">
                                 <img src="../../resources/images/review_list/back1.jpg" class="reviewImg">
                                 <div class="review_content">
                                     <label>글 제목</label>
                                     <div>게시글 내용</div>
                                 </div>
                             </div>     
                         </td>
                         <td>
                             <div class="review2" onclick="location.href='./review_detail.jsp'">
                                 <img src="../../resources/images/review_list/back1.jpg" class="reviewImg">
                                 <div class="review_content">
                                     <label>글 제목</label>
                                     <div>게시글 내용</div>
                                 </div>
                             </div>     
                         </td>
                         <td>
                             <div class="review3" onclick="location.href='./review_detail.jsp'">
                                 <img src="../../resources/images/review_list/back1.jpg" class="reviewImg">
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
                     <li><input type="button" value="1" onclick="location.href='./review_list.jsp' "></li>
                     <li><input type="button" value="2" onclick="location.href='./review_list.jsp' "></li>
                     <li><input type="button" value="3" onclick="location.href='./review_list.jsp' "></li>
                     <li><input type="button" value="4" onclick="location.href='./review_list.jsp' "></li>
                     <li><input type="button" value="5" onclick="location.href='./review_list.jsp' "></li>
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