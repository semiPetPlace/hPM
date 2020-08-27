<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.semiProject.Hotel.model.vo.*" %>
<% ArrayList<Hotel> hlist = (ArrayList<Hotel>)request.getAttribute("hlist");  %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>hotelmain</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../resources/css/mainpage.css">
        <link rel="stylesheet" href="../../resources/css/hotelmain.css">
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src ="../../resources/js/script.js"></script>
        
        
    </head>
    <style>
    a{
    color: black;
    
}
a:hover{
    color: black;
    text-decoration:none;
}
/* ------------------------hotel main------------------------------- */
.wrapper{
    width: 1300px;
    margin-left: auto;
    margin-right: auto;
}
#main-image{
    max-height: 200px;
    overflow: hidden;
}
#main-img-box{
    text-align: center;
    height: 100px;
    margin-top: 100px;
}
#main-img-box>img{
    padding-bottom: 50px;
    position: relative;
    display: block;
    margin: auto;
}
/* --------------------------- 검색바 ----------------------------- */
#searchbar{
    height: 80px;
    text-align: center;
}
.wrapper{
    width: 1300px;
    margin-left: auto;
    margin-right: auto;
}

#main-wrapper{
    height: 100%;
    text-align:center;
    /* width: fit-content; */
    min-width:1300px;
}
#H_main{
    width: 100%;
    height: fit-content;
   
}
#main-image{
    padding: 50px 0;
    overflow: hidden;
}
/* 이미지 메뉴 */
.Menu{
    background: #f8f8f8;
    width: 19%;
    height: 100%;
    margin: 4%;
    margin-top:0;
    margin-bottom:0;
    box-sizing: border-box;
    float: left;
}
/* 검색창 */
#search-box{
    width:800px;
    height:70px;
    margin:0 auto;
    background:#fff;
    box-shadow: 0 4px 15px rgba(0,0,0,0.15);
    padding-left:30px;
    font-size:0;
}
/* 검색창 select태그 */
#search-box select{
    border:0;
    outline:0;
    width:190px;
    height:70px;
    font-size:16px;
    margin-right:20px;
}
#search-box input[type="text"]{
    border:0;
    outline:0;
    width:280px;
    font-size:16px;
    height:70px;
    text-indent:20px;
}
.btn_search{
    outline:0;
    border:0;
    background:#ffb600;
    width:70px;
    line-height:68px;
    font-size:16px;
}
/* --------------------------- 검색바 끝----------------------------- */

#H_main{
    width: 100%;
    height: 3650px;
}
#left-filter{
    margin-left: 140px;
    width: 180px;
    height: 800px;
    float: left;
    border: 1px solid orange;
    border-radius: 5px;
    margin-top: 50px;
    padding: 20px;   
}
#left-filter h1{
    font-size: 1.8rem;
    font-weight: bold;
}
#left-filter label{
    font-size: 1.5rem;
    font-weight: bold;
    margin-bottom: 10px ;
}
#left-filter input,.filter{
    font-size: 1.2rem;
    margin-bottom: 3px;
    margin-left: 5px;
    height: 23px;
    vertical-align: middle;
    
}


#main-content{
    width: 1300px;
    height: 100%;
    padding: 20px;
    margin-left: 320px;
    box-sizing: border-box;

}
.hotel-info-list {
    width: 1250px;
    height: 300px;
    margin-bottom: 20px;
    padding: 20px;
    background: white;
    border: 1px solid orange;
    border-radius: 10px;
}
.count-hotel{
    width: 1250px;
    height: 30px;
    padding-right: 10px;
}
#main-content .hotel-box strong{
    font-size: 2.5rem;
    
}
#main-content .hotel-box span{
    font-size: 1.5rem;
    background: rgb(255, 255, 70);
}
#main-content .hotel-box p{
    font-size: 1.5rem;
}
.hotelimg{
    height: 260px;
    width: 260px;
    float: left;
    overflow: hidden;
    border-radius: 5px;
}
.hotelimg img{
    width: 260px;
    /* overflow: hidden; */
    border-radius: 5px;
}
.hotelinfo {
    float: left;
    height: 232px;
    width: 900px;
    padding: 10px;
}
.price{
    height:30px;
    float: right;
    margin-right: 20px;
    font-size: 20px;
}
/* 페이징 */
.list_number{
    text-align:center;
    height: 50px;
}
.list_n_menu {
    padding:10px; MARGIN:50px; TEXT-ALIGN: center;
}
.list_n_menu A {
    padding:5px 8px 4px 8px; MARGIN: 2px; BORDER: rgb(146, 145, 145) 1px solid; COLOR: #999; TEXT-DECORATION: none
}
.list_n_menu A:hover {
    BORDER:#999 1px solid; COLOR: #666;
}
.list_n_menu A:active {
    BORDER:#999 1px solid; COLOR: #666;
}
.list_n_menu .current {
    BORDER: #f9c550 1px solid; padding:5px 8px 4px 8px; FONT-WEIGHT: bold; MARGIN: 2px; COLOR: #f9c550;
}
.list_n_menu .disabled {
    BORDER: #eee 1px solid; padding:5px 8px 4px 8px; MARGIN: 2px; COLOR: #ddd;
}



    
    </style>
    <body>
        <%@ include file="../common/header.jsp" %>

        <!------------------------ 메인 ------------------------->
        <main id="H_main">
            <!-- 메인 이미지 -->
            <div id="main-img-box">
                <img src="../../resources/images/icons/hotel-main.png" alt="">
            </div>
            <!-- 메인 이미지 끝 -->
            <!-- 검색창 부분 -->
            <div id="searchbar">
                <div id="search-box">
                    <select name="지역" id="">
                        <option value="x" class="nonselect">지역</option>
                        <option value="">서울</option>
                        <option value="">경기</option>
                        <option value="">인천</option>
                        <option value="">대구</option>
                        <option value="">부산</option>
                        <option value="">제주</option>
                    </select>
                    <select name="반려견사이즈" id="">
                        <option value="반려견사이즈" class="nonselect">반려견사이즈</option> 
                        <option value="소형견">소형견</option> 
                        <option value="중형견">중형견</option> 
                        <option value="대형견">대형견</option> 
                    </select>
                    <input type="text" placeholder="동반 카페명"></input>
                    <button type="button" class="btn_search">검색</button>
                </div>
            </div>
            <!-- 검색창 부분 끝 -->
            <div style="height: 3000">
                <!------------ 왼쪽 필터 ------------>
                <div id="left-filter">
                    <h1>필터링 기준</h1>
                    <hr>
                    <label for="">인기필터</label><br>
                    <div class="filter"><input type="checkbox" > 24시프론트</div> 
                    <div class="filter"><input type="checkbox" > 주차장</div> 
                    <div class="filter"><input type="checkbox" > 레스토랑</div> 
                    <div class="filter"><input type="checkbox" > 룸서비스</div>
                    <div class="filter"><input type="checkbox" > 피트니스센터</div> 
                    <div class="filter"><input type="checkbox" > 금연실</div> 
                    <div class="filter"><input type="checkbox" > 공항셔틀버스</div>
                    <div class="filter"><input type="checkbox" > 방음</div> 
                    <div class="filter"><input type="checkbox" > 가족실</div> 
                    <div class="filter"><input type="checkbox" > 스파</div> 
                    <div class="filter"><input type="checkbox" > 사우나</div> 
                    <div class="filter"><input type="checkbox" > 와이파이</div> 
                    <div class="filter"><input type="checkbox" > 전기차 충전소</div> 
                    <div class="filter"><input type="checkbox" > 간의주방</div> 
                    <div class="filter"><input type="checkbox" > 욕실</div> 
                    <div class="filter"><input type="checkbox" > 욕조</div> 
                    <div class="filter"><input type="checkbox" > TV</div> 
                    <div class="filter"><input type="checkbox" > 세탁</div> 
                    <div class="filter"><input type="checkbox" > 전망</div> 
                    <div class="filter"><input type="checkbox" > 전기포트</div> 
                    <div class="filter"><input type="checkbox" > 커피머신</div> 
                    <div class="filter"><input type="checkbox" > 루프탑</div> 
                    <div class="filter"><input type="checkbox" > 공기청정기</div> 
                    <div class="filter"><input type="checkbox" > 테라스</div> 
                    <div class="filter"><input type="checkbox" > 발코니</div> 
                    <hr>
                    <label for="">위치</label><br>
                     
                    <hr>
                    <label for="">평점</label><br>
                     
                </div>
 
                <!------------ 왼쪽 필터 끝 ------------>
    
                <!------------- hotel-list ------------>
                <div id="main-content">
                    
                    <div class="hotel-box">
                        <div class="count-hotel">
                                <p style="float: right;">검색된 숙소 120개</p>
                        </div>
                        <table>
                        	<% for(Hotel h : hlist){ %>
                            <tr>
                                <td>
                                    <div class="hotel-info-list">
                                        <div class="hotelimg"><img src="<%=h.gethImg() %>" alt=""></div>
                                        <div class="hotelinfo">
                                            <strong> <a href="../../views/hotel/hotel_detail.jsp" ><%= h.gethName() %></a></strong>
                                            <span>  평점 <label><%= h.gethScore() %></label></span> 
                                            <hr>
                                            <p><%= h.gethAddress() %></p><br>
                                            <p><%= h.gethPromotion() %></p>
                                        </div>
                                        <div class="price"><%= h.gethPrice() %></div>
                                    </div>
                                </td>
                            </tr>
                             <%} %>
                        </table>
                    </div>
                </div>        
            <!------------ hotel-list 끝----------->
        </main>
        <!--페이징-->
        <div class="list_number">
            <div>
                <p><div class="list_n_menu"><span class="disabled"><  이전</span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a><a href="#?page=4">4</a><a href="#?page=5">5</a><a href="#?page=6">6</a><a href="#?page=7">7</a>...<a href="#?page=199">199</a><a href="#?page=200">200</a><a href="#?page=2">다음  ></a></div></p>
            </div>
        </div>
        <!--페이징 끝-->   
         <!------------------------ 메인 끝------------------------->

         <%@ include file = "../common/footer.jsp" %>
    </body>
</html>