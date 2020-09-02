<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
	display: block;
}
body {
    line-height: 1;
    font-family: 'Noto Sans KR', sans-serif;
}
ol, ul, li{
	list-style: none;
}
blockquote, q {
	quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
	content: '';
	content: none;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
}

html,body {
    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0;
    font-size: 12px;
}

.clearfix{
    content:"";
    display: block;
    clear: both;
}

.wrapper{
    width: 1300px;
    margin-left: auto;
    margin-right: auto;
}
 
#main-nav {
    height: 120px;
    background: #1E344E;
    min-width: 1500px;
}

.m-logo {
    float:left;
}

.m-logo-link {
    display: block;
    height: 80px;
    margin-top: 20px;
    margin-left: 60px;
}

.m-logo img {
    height: 100%;
}

.m-menu-nav {
    color: white;
    font-size: 18pt;
    font-weight: 600;
    margin-left: 50px;
}

.list {
    position: absolute;
    margin-top: 45px;
    margin-left: 250px;
    width: 1400px;
    height: 30px;
    
}

.m-menu-nav li {
    color: white;
    float: left;
    margin-left: 1%;
    margin-right: 1%;
    text-shadow: 0 0 4px #7a9bad;
}

.m-menu-nav a {
    color: white;
    text-decoration: none;
}

#main-wrapper {
    min-width: 960px;
    height: 100%;
}

.main-content {
    height: 100%;
    min-width: 1600px;
}

.main-content>div {
    float: left;
}

.sub-menu {
    width: 250px;
    height: 100%;
    background: #7A9BAD;
}

.sub-list {
    width: 100%;
    height: 500px;
    margin-left: 40px;
}

.sub-list>p {
    color: black;
    font-size: 18pt;
    font-weight: 600;
    line-height: 2em;
    margin-top: 50px;
}

.sub-list li {
    font-size: 14pt;
    line-height: 1.4em;
    margin-left: 30px;
}

.sub-list a {
    color: black;
    text-decoration: none;
}

.login-area {
    float: right;
    margin-top: 50px;
    margin-right: 15px;
}

.login-name {
    font-size: 11pt;
    font-weight: 400;
}

.logoutBtn {
    width: 70px;
    height: 20px;
    background-color: white;
    color: black;
    font-size: 12pt;
    border: 1px solid lightgray;
    border-radius: 8px;
    margin-top: 10px;
    margin-left: 120px;
    text-align: center;
}
</style>
<header>
    <div id="main-nav" class="clearfix">
        <div class="m-logo">
            <a href="#" class="m-logo-link"><img src="<%=request.getContextPath()%>/resources/images/logo.png" alt="로고"></a>
        </div>
        <div class="m-menu-nav">
            <div class="list">
                <ul>
                    <li><a href="./Manager_main.html">관리자 메인</a></li>
                    <li><a href="./Manager_reservation.html">예약·결제 관리</a></li>
                    <li><a href="./Manager_reviewBoard.html">게시판 관리</a></li>
                    <li><a href="#" src="gocList()">업체 관리</a></li>
                    <li><a href="./Manager_client_search.html">회원 관리</a></li>
                    <li><a href="./Manager_sells_Total_detail copy.html">매출 관리</a></li>
                </ul>
            </div>
            <div class="login-area">
                <label class="login-name">관리자 님의 방문을 환영합니다.</label>
                <div class="logoutBtn" onclick="logout()">로그아웃</div> 
            </div>
        </div>
    </div>
</header>
<script>
	function gocList(){
		location.href="/semi/cList.co"
	}
</script>