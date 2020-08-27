<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>pet_hotel_main</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../resources/css/mainpage.css">
        <link rel="stylesheet" href="../../resources/css/pet_hotelmain.css">
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src ="../../resources/js/script.js"></script>
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    </head>
    <body>
        <%@ include file= "../common/header.jsp" %>

        <!------------------------ 메인 ------------------------->
        <main id="H_main">
            <!-- 메인 이미지 -->
            <div id="main-img-box">
                <img src="../../resources/images/icons/pet_hotel-main.png" alt="">
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
                    <input type="text" placeholder="위탁 호텔명"></input>
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
                    <div class="filter"><input type="checkbox" > 필터1</div> 
                    <div class="filter"><input type="checkbox" > 필터1</div> 
                    <div class="filter"><input type="checkbox" > 필터1</div> 
                    <div class="filter"><input type="checkbox" > 필터1</div> 
                    <hr>
                    <label for="">위치</label><br>
                    <div class="filter"><input type="checkbox" > 필터1</div> 
                    <div class="filter"><input type="checkbox" > 필터1</div> 
                    <div class="filter"><input type="checkbox" > 필터1</div> 
                    <hr>
                    <label for="">평점</label><br>
                    <div class="filter"><input type="checkbox" > 필터1</div> 
                    <div class="filter"><input type="checkbox" > 필터1</div> 
                    <div class="filter"><input type="checkbox" > 필터1</div> 
                    <div class="filter"><input type="checkbox" > 필터1</div> 
                    <div class="filter"><input type="checkbox" > 필터1</div> 
                    <div class="filter"><input type="checkbox" > 필터1</div> 
                    <div class="filter"><input type="checkbox" > 필터1</div> 
                </div>
 
                <!------------ 왼쪽 필터 끝 ------------>
    
                <!------------- hotel-list ------------>
                <div id="main-content">
                    <div class="hotel-box">
                        <div class="count-hotel">
                            <p style="float: right;">검색된 숙소 120개</p>
                        </div>
                    <div class="hotel-info-list">
                        <div class="hotelimg"><img src="../../resources/images/hotel1.jpg" alt=""></div>
                        <div class="hotelinfo">
                            <strong> <a href="../../views/pethotel/pet_hotel_detail.jsp" >호텔이름</a></strong>
                            <span>  평점 4.5</span> 
                            <hr>
                            <p>주소지</p><br>
                            <p>숙소 상세설명</p>
                        </div>
                        <div class="price">103,300원</div>
                    </div>
                    <div class="hotel-info-list">
                        <div class="hotelimg"><img src="../../resources/images/hotel1.jpg" alt=""></div>
                        <div class="hotelinfo">
                            <strong> <a href="../../views/pethotel/pet_hotel_detail.jsp" >호텔이름</a></strong>
                            <span>  평점 4.5</span> 
                            <hr>
                            <p>주소지</p><br>
                            <p>숙소 상세설명</p>
                        </div>
                        <div class="price">103,300원</div>
                    </div>
                    <div class="hotel-info-list">
                        <div class="hotelimg"><img src="../../resources/images/hotel1.jpg" alt=""></div>
                        <div class="hotelinfo">
                            <strong> <a href="../../views/pethotel/pet_hotel_detail.jsp" >호텔이름</a></strong>
                            <span>  평점 4.5</span> 
                            <hr>
                            <p>주소지</p><br>
                            <p>숙소 상세설명</p>
                        </div>
                        <div class="price">103,300원</div>
                    </div>
                    <div class="hotel-info-list">
                        <div class="hotelimg"><img src="../../resources/images/hotel1.jpg" alt=""></div>
                        <div class="hotelinfo">
                            <strong> <a href="../../views/pethotel/pet_hotel_detail.jsp" >호텔이름</a></strong>
                            <span>  평점 4.5</span> 
                            <hr>
                            <p>주소지</p><br>
                            <p>숙소 상세설명</p>
                        </div>
                        <div class="price">103,300원</div>
                    </div>
                    <div class="hotel-info-list">
                        <div class="hotelimg"><img src="../../resources/images/hotel1.jpg" alt=""></div>
                        <div class="hotelinfo">
                            <strong> <a href="../../views/pethotel/pet_hotel_detail.jsp" >호텔이름</a></strong>
                            <span>  평점 4.5</span> 
                            <hr>
                            <p>주소지</p><br>
                            <p>숙소 상세설명</p>
                        </div>
                        <div class="price">103,300원</div>
                    </div>
                    <div class="hotel-info-list">
                        <div class="hotelimg"><img src="../../resources/images/hotel1.jpg" alt=""></div>
                        <div class="hotelinfo">
                            <strong> <a href="../../views/pethotel/pet_hotel_detail.jsp" >호텔이름</a></strong>
                            <span>  평점 4.5</span> 
                            <hr>
                            <p>주소지</p><br>
                            <p>숙소 상세설명</p>
                        </div>
                        <div class="price">103,300원</div>
                    </div>
                    <div class="hotel-info-list">
                        <div class="hotelimg"><img src="../../resources/images/hotel1.jpg" alt=""></div>
                        <div class="hotelinfo">
                            <strong> <a href="../../views/pethotel/pet_hotel_detail.jsp" >호텔이름</a></strong>
                            <span>  평점 4.5</span> 
                            <hr>
                            <p>주소지</p><br>
                            <p>숙소 상세설명</p>
                        </div>
                        <div class="price">103,300원</div>
                    </div>
                    <div class="hotel-info-list">
                        <div class="hotelimg"><img src="../../resources/images/hotel1.jpg" alt=""></div>
                        <div class="hotelinfo">
                            <strong> <a href="../../views/pethotel/pet_hotel_detail.jsp" >호텔이름</a></strong>
                            <span>  평점 4.5</span> 
                            <hr>
                            <p>주소지</p><br>
                            <p>숙소 상세설명</p>
                        </div>
                        <div class="price">103,300원</div>
                    </div>
                    <div class="hotel-info-list">
                        <div class="hotelimg"><img src="../../resources/images/hotel1.jpg" alt=""></div>
                        <div class="hotelinfo">
                            <strong> <a href="../../views/pethotel/pet_hotel_detail.jsp" >호텔이름</a></strong>
                            <span>  평점 4.5</span> 
                            <hr>
                            <p>주소지</p><br>
                            <p>숙소 상세설명</p>
                        </div>
                        <div class="price">103,300원</div>
                    </div>
                    <div class="hotel-info-list">
                        <div class="hotelimg"><img src="../../resources/images/hotel1.jpg" alt=""></div>
                        <div class="hotelinfo">
                            <strong> <a href="../../views/pethotel/pet_hotel_detail.jsp" >호텔이름</a></strong>
                            <span>  평점 4.5</span> 
                            <hr>
                            <p>주소지</p><br>
                            <p>숙소 상세설명</p>
                        </div>
                        <div class="price">103,300원</div>
                    </div>
                    
                    
                </div>
                <!------------ hotel-list 끝----------->
            </div>        
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