<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>게시글 작성하기</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../resources/css/mainpage.css">
        <link rel="stylesheet" href="../../resources/css/freeboardwrite.css">
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src ="../../resources/js/script.js"></script>

    </head>
    <body>
        <%@ include file = "../common/header.jsp" %>


    <div id="main">
        
        <div class="review_mid">
            <h1>게시글 작성</h1>
            
            <ul class="explanation">
                <li>
                    이곳에는 기본적인 후기 작성 요령과
                </li>
                <li>
                    작성 방법 등을 설명해 줍니다.
                </li>
                <li>
                    (3줄~4줄 정도면 적당)
                </li>
            </ul>
        </div>
        <!-- <div class="review_top">
            <img src="../../resources/images/cafe2.jpg" alt="">
        </div> -->
        <div class="review_content">
            <div>
                <input type="text" name="게시글 제목" id="post-name" placeholder="제목을 작성해 주세요."/>
            </div>
            <div id="write_menu">게시글 메뉴·기능 버튼</div>
            <div id="write">내용</div>
            <input type="button" value="임시 저장" class="btn">
            <input type="button" value="등록" class="btn" onclick="confirm('등록하시겠습니까?')">
        </div>
    </div>
        <!-- TOP -->
        <div style="height: 20px; margin-right: 2%;"><a href="#header" id="top">▲ TOP</a></div>

        <%@ include file = "../common/footer.jsp" %>
    </body>
</html>ml>