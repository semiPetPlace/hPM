<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관리자 메인 화면</title>
    <link rel="stylesheet" href="/semi/resources/css/Manager-DefaultCSS.css">
    <link rel="stylesheet" href="/semi/resources/css/Manager-border.css">
</head>
<body>
    <%@ include file = "./Manager_header.jsp" %>
<main id="main">
    <div id="main-wrapper">
        <div class="main-content">
            <div class="sub-menu">
                <div class="sub-list">
                    <p>게시판 관리</p>
                    <ul>
                        <li><a href="">· 게시글 관리</a></li>
                        <li><a href="">· 리뷰 관리</a></li>
                    </ul>
                </div>
            </div>
            <div id="content">
            <div class="top">
               <p id="top">게시글 관리</p>
               <input type="button" value="삭제" class="btn">
               <input type="button" value="공지" class="btn">
            </div>

                <div id="table">
                    <table>
                        <tr>
                            <th></th>
                            <th id="num">순번</th>
                            <th id="name">글제목</th>
                            <th id="witer">작성자</th>
                            <th id="day">작성일</th>
                        </tr>
                         <tr>
                            <td><input type="checkbox" name="check" id=""></td>
                            <td>123</td>
                            <td><a href=""> 가나다라가나다라가나다라가나다라가나</a></td>
                            <td>홍길동</td></a>
                            <td>2014-11-15</td>
                         </tr>
                         <tr>
                            <td><input type="checkbox" name="check" id=""></td>
                            <td>123</td>
                            <td><a href=""> 가나다라가나다라가나다라가나다라가나</a></td>
                            <td>홍길동</td></a>
                            <td>2014-11-15</td>
                         </tr>
                         <tr>
                            <td><input type="checkbox" name="check" id=""></td>
                            <td>123</td>
                            <td><a href=""> 가나다라가나다라가나다라가나다라가나</a></td>
                            <td>홍길동</td></a>
                            <td>2014-11-15</td>
                         </tr>
                    </table>
                    <div class="search">
                       <span>검색</span>
                       <input type="text" name="search" id="search">
                       <input type="button" value="검색">
                     </div>
                    <div id="next">
                        <ul>
                           <a href=""><li><</li></a>
                           <a href=""><li>1</li></a>
                           <a href=""><li>2</li></a>
                           <a href=""><li>3</li></a>
                           <a href=""><li>4</li></a>
                           <a href=""><li>5</li></a>
                           <a href=""><li>></li></a>
                        </ul>
                    </div>
                  </div>
                </div>
                <div class="empty">
                    <br><br><br>
                </div>
            </div>
        </div>
    </div>
</main>
<footer id="footer">
    <div id="foot">
        <p style="color: rgb(131, 131, 131);">Copyright © 1998-2020 KH Information Educational Institute All Right Reserved</p>
    </div>
</footer>
</body>
</html>