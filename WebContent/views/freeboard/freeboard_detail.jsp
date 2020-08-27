<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>상세보기</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../resources/css/mainpage.css">
        <link rel="stylesheet" href="../../resources/css/freeboard_detail.css">
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src ="../../resources/js/script.js"></script>
    </head>
    <body>
        <%@ include file = "../common/header.jsp" %>




            <!-- 여기에 메인 컨텐츠 넣으면 됩니다. -->
                  
            <div id="reviewContent">

                <div id="review_top">
                    <h3>게시글 제목</h3>
                    <img src="../../resources/images/freeboard_detail/pat3.png" id="miniImg">
                    <label class="writer">작성자 이름</label>
                    <input type="button" value="삭제" class="comentbtn" onclick="confirm('삭제하시겠습니까?')" id="content_delete">
                    <input type="button" value="수정" class="comentbtn" onclick="confirm('수정하시겠습니까?')" id="content_update">
                </div>

                <img src="../../resources/images/freeboard_detail/images.jpg"alt="" id="contentImg">

                <div id="reviwecontent">게시글 내용</div>

                <input type="button" value="목록" id="list_btn" class="comentbtn" onclick="location.href='./freeboard_list.jsp'">



                <div id="review">
                    <label>댓글</label>
                    <div id="comment">
                        <div id="name">
                            <img src="../../resources/images/freeboard_detail/pat3.png" id="miniImg">
                            <label class="writer">이름</label>
                        </div>
                            <div id="content">내용</div>
                            <input type="button" value="삭제" class="comentbtn" onclick="confirm('삭제하시겠습니까?')" id="review_delete">
                            <input type="button" value="수정" class="comentbtn" onclick="confirm('수정하시겠습니까?')" id="review_update">
                        </div>
                    </div>

                    <div id="writeReview">
                        <h3>댓글 쓰기</h3>
                        <textarea cols="30" rows="10"></textarea>
                        <input type="button" value="댓글 쓰기" id="writebtn">
                    </div>
                </div>         
            <!-- TOP -->
            <div style="height: 20px; margin-right: 2%;"><a href="#header" id="top">▲ TOP</a></div>

			<%@ include file = "../common/footer.jsp" %>
    </body>
</html>