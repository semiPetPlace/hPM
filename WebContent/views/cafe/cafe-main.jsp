<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개편한 세상</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../resources/css/mainpage.css">
    <link rel="stylesheet" href="../../resources/css/cafe-main.css">
    <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src ="../../resources/js/script.js"></script>
</head>
<body>
    	<%@ include file = "../common/header.jsp" %>
    	
    <main id="H_main">
        <div id="main-wrapper">
            <div id="main-image">
                <img src="../../resources/images/icons/cafe.png" alt="main-backgroung" width="20%;" style="max-height: initial;">
            </div>

            <!-- 검색창 부분 -->
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
            <!-- 검색창 부분 끝 -->

            <!-- 카페/레스토랑 리스트 -->
            <div id="cafeList" >
                <table>
                    <tr>
                        <td>
                            <div class="cafeList-list">
                                <a href="../../views/cafe/cafe-detailpage.jsp">
                                    <img src="../../resources/images/cafe1.jpg" alt="cafe">
                                </a>
                                <h4 style="margin-bottom: 0;">cafe name</h4>
                                <p class="infoText">information of hotel </p>
                                <p class="price">별점★★★★★</p>
                            </div>
                        </td>    
                        <td>
                            <div class="cafeList-list">
                                <a href="../../views/restaurant/restaurant_detailpage.jsp">
                                    <img src="../../resources/images/cafe1.jpg" alt="cafe">
                                </a>
                                <h4 style="margin-bottom: 0;">cafe name</h4>
                                <p class="infoText">information of hotel </p>
                                <p class="price">별점★★★★★</p>
                            </div>
                        </td>    
                        <td>
                            <div class="cafeList-list">
                                <a href="../../views/restaurant/restaurant_detailpage.jsp">
                                    <img src="../../resources/images/cafe1.jpg" alt="cafe">
                                </a>
                                <h4 style="margin-bottom: 0;">cafe name</h4>
                                <p class="infoText">information of hotel </p>
                                <p class="price">별점★★★★★</p>
                            </div>
                        </td>    
                    </tr>
                    <tr>
                        <td>
                            <div class="cafeList-list">
                                <a href="../../views/restaurant/restaurant_detailpage.jsp">
                                    <img src="../../resources/images/cafe1.jpg" alt="cafe">
                                </a>
                                <h4 style="margin-bottom: 0;">cafe name</h4>
                                <p class="infoText">information of hotel </p>
                                <p class="price">별점★★★★★</p>
                            </div>
                        </td>    
                        <td>
                            <div class="cafeList-list">
                                <a href="../../views/restaurant/restaurant_detailpage.jsp">
                                    <img src="../../resources/images/cafe1.jpg" alt="cafe">
                                </a>
                                <h4 style="margin-bottom: 0;">cafe name</h4>
                                <p class="infoText">information of hotel </p>
                                <p class="price">별점★★★★★</p>
                            </div>
                        </td>    
                        <td>
                            <div class="cafeList-list">
                                <a href="../../views/restaurant/restaurant_detailpage.jsp">
                                    <img src="../../resources/images/cafe1.jpg" alt="cafe">
                                </a>
                                <h4 style="margin-bottom: 0;">cafe name</h4>
                                <p class="infoText">information of hotel </p>
                                <p class="price">별점★★★★★</p>
                            </div>
                        </td>    
                    </tr>
                    <tr>
                        <td>
                            <div class="cafeList-list">
                                <a href="../../views/restaurant/restaurant_detailpage.jsp">
                                    <img src="../../resources/images/cafe1.jpg" alt="cafe">
                                </a>
                                <h4 style="margin-bottom: 0;">cafe name</h4>
                                <p class="infoText">information of hotel </p>
                                <p class="price">별점★★★★★</p>
                            </div>
                        </td>    
                        <td>
                            <div class="cafeList-list">
                                <a href="../../views/restaurant/restaurant_detailpage.jsp">
                                    <img src="../../resources/images/cafe1.jpg" alt="cafe">
                                </a>
                                <h4 style="margin-bottom: 0;">cafe name</h4>
                                <p class="infoText">information of hotel </p>
                                <p class="price">별점★★★★★</p>
                            </div>
                        </td>    
                        <td>
                            <div class="cafeList-list">
                                <a href="../../views/restaurant/restaurant_detailpage.jsp">
                                    <img src="../../resources/images/cafe1.jpg" alt="cafe">
                                </a>
                                <h4 style="margin-bottom: 0;">cafe name</h4>
                                <p class="infoText">information of hotel </p>
                                <p class="price">별점★★★★★</p>
                            </div>
                        </td>    
                    </tr>
                   
                </table>
            </div>
            <!-- 카페/레스토랑 리스트 끝 -->
            <!--페이징-->
            <div class="list_number">
                <div>
                    <p><div class="list_n_menu"><span class="disabled"><  이전</span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a><a href="#?page=4">4</a><a href="#?page=5">5</a><a href="#?page=6">6</a><a href="#?page=7">7</a>...<a href="#?page=199">199</a><a href="#?page=200">200</a><a href="#?page=2">다음  ></a></div></p>
                </div>
            </div>
            <!--페이징 끝-->
        </div>
            <!-- TOP -->
            <div style="height: 20px; margin-right: 2%;"><a href="#header" id="top">▲ TOP</a></div>
            
    </main>
        <%@ include file = "../common/footer.jsp" %>
    </body>
    </html>