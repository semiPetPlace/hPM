<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>예약 결제관리</title>
    <link rel="stylesheet" href="../../resources/css/Manager-DefaultCSS.css">
    <link rel="stylesheet" href="../../resources/css/Manager_mtmrequest.css">
</head>
<body>
    <header>
        <div id="main-nav" class="clearfix">
            <div class="m-logo">
                <a href="#" class="m-logo-link"><img src="../../resources/images/logo.png" alt="로고"></a>
            </div>
        <div class="m-menu-nav">
            <div class="list">
                <ul>
                    <li><a href="">관리자 메인</a></li>
                    <li><a href="../Manager/Manager_Reservation.html">예약·결제 관리</a></li>
                    <li><a href="">게시판 관리</a></li>
                    <li><a href="">업체 관리</a></li>
                    <li><a href="">회원 관리</a></li>
                    <li><a href="">매출 관리</a></li>
                    <li><a href="">통계 관리</a></li>
                </ul>
            </div>
            <div class="login-area">
                <label class="login-name">관리자 님의 방문을 환영합니다.</label>
				<div class="logoutBtn" onclick="logout()">로그아웃</div> 
            </div>
        </div>
    </div>
</header>

<main id="main">
    <div id="main-wrapper">
        <div class="main-content">
            <div class="sub-menu">
                <div class="sub-list">
                    <p>회원 관리</p>
                    <ul>
                        <li class="page_nav">· 고객 현황</li>
                        <li class="page_nav">· 고객 문의</li>
                        <li class="page_nav">· 회원 정보 수정</li> 
                    </ul>
                </div>
            </div>
            <!-- 여기에 메인 컨텐츠 넣으면 됩니다. -->
                  
            <div id="reviewContent">
                <div id="inquiry">
                    <p>문의처리</p>
                </div>
                <div class="QnAtext">
                    <p class="font25">문의 내용</p>
                    <div class="title-block">
                        <h1>제목</h1><h3 class="BW"style="margin-left:13px;width:300px">체크아웃 시간</h3>
                    </div>
                    
                    <div class="content-block">
                        <h3>작성자</h3><h3 class="BW">김혜주</h3>    
                        <h3>이메일</h3><h3 class="BW">cdiee2@gmail.com</h3>    
                        <h3>작성일</h3><h3 class="BW">2020-08-20</h3>
                    </div>
                    <div class="QnAarea">
                        <P style="padding:15px; font-size:14px">호텔 체크아웃 시간을 어떻게 확인해야하나요.</P>
                    </div>
                    
                </div>
                <div class="QnArequset">
                    <form action="">
                        <p class="font25">문의 처리</p>
                        <div class="title-block">
                            <h1>제목</h1><h3 class="BW"style="margin-left:13px;width:320px">체크아웃 시간</h3>
                        </div>
                        
                        <div class="content-block">
                            <h1>답변</h1><input type="text" class="input-title">
                            <h3>담당자</h3><input type="text" name="requester" id="" class="input-requester">   
                    
                        </div>
                        <div class="requestArea">
                            <textarea id="request-text"style="resize: none;" cols="73" rows="24" ></textarea>
                        </div>
                        <input type="submit" value="답변 메일로 전송" style="float: right;margin-top: 10px;">
                    </form>    
                </div>
            </div>     
</body>
</html>