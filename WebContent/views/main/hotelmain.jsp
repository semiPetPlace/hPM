
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.semiProject.Hotel.model.vo.*" %>
<% ArrayList<Hotel> hlist = (ArrayList<Hotel>)request.getAttribute("hlist");  %>
<% String Cin = (String)request.getAttribute("Cin"); %>
<% String Cout = (String)request.getAttribute("Cout"); %>
<% String area = (String)request.getAttribute("area"); %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>hotelmain</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="/semi/resources/css/mainpage.css">
        <link rel="stylesheet" href="/semi/resources/css/hotelmain.css">
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src ="/semi/resources/js/script.js"></script>
        
       
    </head>
<style>
#search-box{
    /* width: 70%; */
    min-width: fit-content;
    text-align: center;
    margin-left: auto;
    margin-bottom: 10px;
    display: flex;
/* 검색 버튼 */
.button-5{
    width:100px;
    height:30px;
    border:2px solid #f9c550;
    float:right;
    text-align:center;
    cursor:pointer;
    position:relative;
    box-sizing: border-box;
    overflow:hidden;
    margin: 0px 90px 40px -300px;
    border-radius: 15px;
}



.button-5:hover .eff-5{
    left:0;top:0;
}

.button-5:hover a{
    color:#fff;
}


/* 검색창 select태그 */
select{
    -moz-appearance: none; /* Firefox */  
    -webkit-appearance: none; /* Safari and Chrome */  
    appearance: none; 
    text-align: center;
    padding: 5px 20px 0px 0px;
    border: 1px solid #c1c1c1;
    border-radius: 3px;
    margin-left: 140px;

    font-size: 1.4rem;
    width: 200px;
    text-align: center;
    margin-left: 0px;
    border: none;
}
</style>
    <body>
        <%@ include file="../common/header.jsp" %>

        <!------------------------ 메인 ------------------------->
        <main id="H_main">
            <!-- 메인 이미지 -->
            <div id="main-img-box">
                <img src="/semi/resources/images/icons/hotel-main.png" alt="">
            </div>
            <!-- 메인 이미지 끝 -->
           <form id="searchform" method="post">
				<div id="search-box">
						<input type="date" class="check" name="checkin" id="checkin"
							style="font-size: 1.4rem; width: 180px; border: none; margin-right: 20px;">
							<% String checkin = request.getParameter("checkin");%>
								console.log(checkin);
						<input type="date" class="check" name="checkout" id="checkout"
							style="font-size: 1.4rem; width: 180px; margin-right: 95px; border: none; ">
					<select name="area" id="area"
						style="font-size: 1.4rem; width: 180px; text-align: center; margin-right: 50px; border: none;">
						<option value="x" class="nonselect">지역</option>
						<option value="서울">서울</option>
						<option value="경기">경기</option>
						<option value="인천">인천</option>
						<option value="대구">대구</option>
						<option value="부산">부산</option>
						<option value="제주">제주</option>
					</select>

					<!-- 검색 버튼 -->
					<button value="검색" style="border:none ; width: 100px;height: 50%; border-radius: 10px; 
							background: #f9c550;margin: auto;margin-right: 30px; font-size:14px;color: white;" id="searchBtn">검색</button>
				</div>
			</form>
			<script>
				$(function(){
					$('#searchBtn').click(function(){

						$('#searchform').attr('action','/semi/hotelsearch.ys?checkin='+$('#checkin').val()+'&checkout='+$('#checkout').val()+'&area='+$('#area').val()).submit();

					});
				});
			</script>
			
			
			<!-- 검색창 부분 끝 -->
            <div style="height: 3000">
                <!------------ 왼쪽 필터 ------------>
                <div id="left-filter">
                    <h1>필터링 기준</h1>
                    <hr>
                    <label for="">인기필터</label><br>
                    <div class="filter"><input type="checkbox" id='1' name="checklist"> 24시프론트</div> 
                    <div class="filter"><input type="checkbox" id='2' name="checklist"> 주차장</div> 
                    <div class="filter"><input type="checkbox" id='3' name="checklist"> 레스토랑</div> 
                    <div class="filter"><input type="checkbox" id='4' name="checklist"> 룸서비스</div>
                    <div class="filter"><input type="checkbox" id='5' name="checklist"> 피트니스센터</div> 
                    <div class="filter"><input type="checkbox" id='6' name="checklist"> 금연실</div> 
                    <div class="filter"><input type="checkbox" id='7' name="checklist"> 공항셔틀버스</div>
                    <div class="filter"><input type="checkbox" id='8' name="checklist"> 방음</div> 
                    <div class="filter"><input type="checkbox" id='9' name="checklist"> 가족실</div> 
                    <div class="filter"><input type="checkbox" id='10' name="checklist"> 스파</div> 
                    <div class="filter"><input type="checkbox" id='11' name="checklist"> 사우나</div> 
                    <div class="filter"><input type="checkbox" id='12' name="checklist"> 와이파이</div> 
                    <div class="filter"><input type="checkbox" id='13' name="checklist"> 전기차 충전소</div> 
                    <div class="filter"><input type="checkbox" id='14' name="checklist"> 간의주방</div> 
                    <div class="filter"><input type="checkbox" id='15' name="checklist"> 욕실</div> 
                    <div class="filter"><input type="checkbox" id='16' name="checklist"> 욕조</div> 
                    <div class="filter"><input type="checkbox" id='17' name="checklist"> TV</div> 
                    <div class="filter"><input type="checkbox" id='18' name="checklist"> 세탁</div> 
                    <div class="filter"><input type="checkbox" id='19' name="checklist"> 전망</div> 
                    <div class="filter"><input type="checkbox" id='20' name="checklist"> 전기포트</div> 
                    <div class="filter"><input type="checkbox" id='21' name="checklist"> 커피머신</div> 
                    <div class="filter"><input type="checkbox" id='22' name="checklist"> 루프탑</div> 
                    <div class="filter"><input type="checkbox" id='23' name="checklist"> 공기청정기</div> 
                    <div class="filter"><input type="checkbox" id='24' name="checklist"> 테라스</div> 
                    <div class="filter"><input type="checkbox" id='25' name="checklist"> 발코니</div> 
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
                        <table id="hlist">
                           <% for(Hotel h : hlist){ %>
                            <tr>
                                <td style="padding-bottom: 20px;"> 
                                <input type="hidden" value="<%=h.gethNo()%>" id="ch1">
          							<a  id="nextpage" href="<%=request.getContextPath() %>/hotelDetail.ys?h_no=<%= h.gethNo() %>">
	                                    <div >
	                                        <div class="hotelimg"><img src="<%=h.gethImg() %>" alt=""></div>
	                                        <div class="hotelinfo">
	                                            <strong><%= h.gethName() %></strong>
	                                            <span>  평점 <label><%= h.gethScore() %></label></span> 
	                                            <hr>
	                                            <p><%= h.gethAddress() %></p><br>
	                                            <p><%= h.gethPromotion() %></p>
	                                        </div>
	                                        <div class="price"><%= h.gethPrice() %></div>
	                                    </div>
                                    </a>
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
         
         
        <!--  <script>
         	$('.filter').checked(function(){
         		$.ajax({
         			url:
         		})
         	})
         </script> -->
         
         
    </body>
</html>
