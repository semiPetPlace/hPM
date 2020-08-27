<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>고객센터</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../resources/css/mainpage.css">
        <link rel="stylesheet" href="../../resources/css/companyservice.css">
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src ="../../resources/js/script.js"></script>
    </head>
    <body>
        <%@ include file = "../common/header.jsp" %>
             
        <div class="topImg">
            <img src="../../resources/images/service/company.png" alt="업체 문의" class="companyImg">
        </div>
        <div class="about">
            <div class='aboutinfo'>
            <div class="info" id="info1">
                <ul>
                    <li><h2>주소</h2></li>
                    <li>서울특별시 강남구 테헤란로14길 6 남도빌딩 2F, 3F, 4F, 5F, 6F</li>
                </ul>              
            </div>
            <div class="info" id="info2">
                <ul>
                 <li><h2>전화번호</h2></li>
                 <li>1544-9970</li>
                </ul>
            </div>
             <div class="info" id="info3">
                 <ul>
                     <li><h2>Email</h2></li>
                     <li>kh2020@email.com</li>
                    </ul>
             </div>
             </div>
             
             <div id="sendback">
                 <div id="send">
                     <h1>업체 문의하기</h1>
                     <label class="sendlabel">이름 </label><br>
                     <input type="text" id="yourname" class="send" placeholder="Your name" >
                     <br>
                     <label class="sendlabel">업체명</label><br>
                     <input type="text" id="companyname" class="send" placeholder="Company name">
                     <br>
                     <label class="sendlabel">연락처</label><br>
                     <input type="text" id="tel" class="send" placeholder="Tel">
                     <br>
                     <label class="sendlabel">이메일 주소</label><br>
                     <input type="text" id="youremail" class="send" placeholder="Your email">
                     <br>
                     <label class="sendlabel">문의 내용</label><br>
                     <textarea id="msg" class="send" cols="30" rows="10" placeholder="Messasge"  ></textarea>
                     <br>
                     <input type="button" value="보내기" id="writebtn" class="send" onclick="confirm('문의 내용을 전송하겠습니까?')">
                </div>
            </div>
         </div>  

         <br><br><br>
         <br><br><br>
         <br><br><br>
            
            <!-- TOP -->
            <div style="height: 20px; margin-right: 2%;"><a href="#header" id="top">▲ TOP</a></div>


           <%@ include file = "../common/footer.jsp" %>
    </body>
</html>