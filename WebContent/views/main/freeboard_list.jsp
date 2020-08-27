<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>공지사항</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../resources/css/mainpage.css">
        <link rel="stylesheet" href="../../resources/css/freeboard_list.css">
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src ="../../resources/js/script.js"></script>

    </head>
    <body>
        <%@ include file = "../common/header.jsp" %>
        
        <div class="post">
            <img src="../../resources/images/freeboard_list/dog_lab.png" alt="게시판" id="board-img">
           <table>
                <tr>
                    <td>
                   <div class="post_border">
                         <a href="./freeboard/freeboard_detail.jsp" class="postName">게시판 글제목</a>
                         <label class="write-date">작성일시</label>
                   </td>
                </tr>
                <tr>
                    <td>
                     <div class="postImg_border" >
                           <img src="../../resources/images/freeboard_list/images.jpg" class="postImg">
                      </div>
                  </td>
                </tr>
                <tr>
                    <td>
                        <div class="postContent">
                            내용을 작성하세요.
                            <a href="./freeboard/freeboard_detail.jsp">더보기</a>
                        </div>
                     </td>
                </tr>
                <tr>
                    <td>
                        <div class="postInfo">
                            <img src="../../resources/images/freeboard_list/pat3.png" class="postInfo_Img">
                            <label class="label_position">이름</label>
                        </div>
                     </td>
                </div>
                </tr>

                

            </table>


            <div id="post_num">
                <ul id="num">
                    <li><input type="button" value="◀"></li>
                    <li><input type="button" value="1" onclick="location.href='./freeboard_list.jsp' "></li>
                    <li><input type="button" value="2" onclick="location.href='./freeboard_list.jsp' "></li>
                    <li><input type="button" value="3" onclick="location.href='./freeboard_list.jsp' "></li>
                    <li><input type="button" value="4" onclick="location.href='./freeboard_list.jsp' "></li>
                    <li><input type="button" value="5" onclick="location.href='./freeboard_list.jsp' "></li>
                    <li><input type="button" value="▶"></li>
                </ul>
            </div>

        </div>
   

        <!-- TOP -->
        <div style="height: 20px; margin-right: 2%; margin-top: 200px;"><a href="#header" id="top">▲ TOP</a></div>


        <%@ include file = "../common/footer.jsp" %>
    </body>
</html>