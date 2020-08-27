<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>리뷰제목</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../resources/css/mainpage.css">
        <link rel="stylesheet" href="../../resources/css/review_details.css">
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src ="../../resources/js/script.js"></script>
    </head>
    <body>
        <%@ include file = "../common/header.jsp" %>

        <div id="reviewContent">
            <div id="review_top">
                <p>리뷰 제목</p>
                <img src="../../resources/images/review_detail/img1.jpg" id="miniImg">
                <label class="writer">작성자 이름</label>
                <input type="button" value="삭제" class="comentbtn" onclick="confirm('삭제하시겠습니까?')" id="content_delete">
                <input type="button" value="수정" class="comentbtn" onclick="confirm('수정하시겠습니까?')" id="content_update">
            </div>
            <img src="../../resources/images/review_detail/review1.webp" alt="" id="contentImg">
            <div id="reviwecontent">게시글 내용</div>
            <input type="button" value="목록" class="comentbtn" onclick="location.href='./review_list.jsp'">
            
            <div id="review">
                <label >댓글</label>
                <div id="comment">
                    <div id="name">
                        <img src="../../resources/images/review_detail/img1.jpg" id="miniImg">
                        <label class="writer">이름</label>
                    </div>
                        <div id="content">내용</div>
                        <input type="button" value="삭제" class="comentbtn" onclick="confirm('삭제하시겠습니까?')" id="review_delete">
                        <input type="button" value="수정" class="comentbtn" onclick="confirm('수정하시겠습니까?')" id="review_update">
                    </div>
                </div>
                <div id="writeReview">
                    <h3>댓글쓰기</h3>
                    <textarea cols="30" rows="10"></textarea>
                    <input type="button" value="댓글쓰기" id="writebtn">
                </div>
            </div>         
        <!-- TOP -->
        <div style="height: 20px; margin-right: 2%;"><a href="#header" id="top">▲ TOP</a></div>

        <%@ include file = "../common/footer.jsp" %>
    </body>
</html>