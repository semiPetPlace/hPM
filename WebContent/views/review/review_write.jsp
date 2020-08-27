<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>후기작성</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../resources/css/mainpage.css">
        <link rel="stylesheet" href="../../resources/css/review_write.css">
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src ="../../resources/js/script.js"></script>
    </head>
    <body>
        <%@ include file = "../common/header.jsp" %>
        
    <div id="main">
        <div class="review_top">
            <label>후기 작성</label>
            <ul>
                <li>
                    이곳에는 기본적인 후기 작성 요령과
                </li>
                <li>
                    작성방법등을 설명해줍니다.
                </li>
                <li>
                    세 네 줄 정도면 적당
                </li>
            </ul>
        </div>
        <div class="review_mid">
            <p>별점을 매겨주세요</p>
            <div class="starRev">
                <span class="starR1 on">별1_왼쪽</span>
                <span class="starR2">별1_오른쪽</span>
                <span class="starR1">별2_왼쪽</span>
                <span class="starR2">별2_오른쪽</span>
                <span class="starR1">별3_왼쪽</span>
                <span class="starR2">별3_오른쪽</span>
                <span class="starR1">별4_왼쪽</span>
                <span class="starR2">별4_오른쪽</span>
                <span class="starR1">별5_왼쪽</span>
                <span class="starR2">별5_오른쪽</span>
              </div>
        </div>

          <script>
              $('.starRev span').click(function(){
                $(this).parent().children('span').removeClass('on');
                $(this).addClass('on').prevAll('span').addClass('on');
                 return false;
              });
          </script>

        <div class="review_content">
            <label>이곳에 게시글을 작성해주세요!</label>
            <div id="write_menu">게시글 메뉴 버튼</div>
            <div id="write">내용</div>
            <input type="button" value="등록" id="writebtn" onclick="confirm('등록하시겠습니까?')">
        </div>
    </div>
        <!-- TOP -->
        <div style="height: 20px; margin-right: 2%;"><a href="#header" id="top">▲ TOP</a></div>
        
        <%@ include file = "../common/footer.jsp" %>
    </body>
</html>