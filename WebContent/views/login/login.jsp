<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/mainpage.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/login.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/script.js"></script>
</head>

<body>
   	<%@ include file = "../common/header.jsp" %>


    <main>
        <div id="container">
            <div class="contents">

                <form name="page_login_page_form" method="post" action="<%=request.getContextPath() %>/login.me" target="ok_frame"
                    onsubmit="return page_login_page_form_chk(this)">
                    <input type="hidden" name="re_url" value="">
                    <input type="hidden" name="this_domain">
                    <input type="hidden" name="post_action">
                    <input type="hidden" name="mode">
                    <input type="hidden" name="popup" value="">
                    <div class="">

                        <main id="H_main">
                            <div id="main-wrapper">

                                <br><br><br>
                                <br><br><br>

                                <div id="login" class="login">

                                    <br><br>
                                    <img src="../../resources/images/login.png" alt="login" width="350">
                                    <br><br>


                                    <div class="">
                                        <span>
                                            <input type="checkbox" name="id_save" id="" value="1">
                                            <label for="id_save">아이디 저장</label>
                                        </span>
                                        <span>
                                            <input type="checkbox" name="auto_login_yn" id="" value="1">
                                            <label for="auto_login_yn">자동 로그인</label>
                                        </span>
                                        <span>
                                            <input type="checkbox" name="page_ssl_yn" id="" value="1" checked="">
                                            <label for="page_ssl_yn">보안접속</label>
                                        </span>
                                    </div>
                                    <br>
                                    <div id="" class="login">
                                        <ul>
                                            <label for="input_id" class="">
                                                <li>아이디
                                            </label>
                                            &nbsp; <input type="text" name="id" placeholder="아이디" required=""></li>
                                            <br>
                                            <label for="input_pw" class="">
                                                <li>비밀번호
                                            </label>
                                            <input type="password" name="pwd" maxlength="16" placeholder="비밀번호" required=""></li>
                                        </ul>
                                        <br>
                                        <input id="button" class="button" type="image" src="<%=request.getContextPath() %>/resources/images/login.jpg"></input>
                                    </div>
                                    <br>
                                    <div class="login-btn-box">
                                        <a href="find_id.jsp">아이디 · 비밀번호 찾기</a>
                                        <a href="sing-up1.jsp">회원가입</a>
                                    </div>
                                </div>
                            </div>

                    </div>
                </form>
    </main>




    <div style="height: 20px;"><a href="#header" id="top">▲ TOP</a></div>
    	<%@ include file = "../common/footer.jsp" %>
</body>
</html>