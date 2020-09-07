<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, com.kh.semiProject.Hotel.model.vo.*" %>
<% ArrayList<PetHotel> phlist = (ArrayList<PetHotel>)request.getAttribute("phlist");  %>
<% String area = (String)request.getAttribute("area"); %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>pet_hotel_main</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="/semi/resources/css/mainpage.css">
        <link rel="stylesheet" href="/semi/resources/css/pet_hotelmain.css">
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src ="/semi/resources/js/script.js"></script>
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
        <%@ include file= "../common/header.jsp" %>

        <!------------------------ 메인 ------------------------->
        <main id="H_main" style="height:1600px">
            <!-- 메인 이미지 -->
            <div id="main-img-box">
                <img src="/semi/resources/images/icons/pet_hotel-main.png" alt="">
            </div>
            <!-- 메인 이미지 끝 -->
            <!-- 검색창 부분 -->
            <form id="searchform" method="post">
				<div id="search-box">
<!-- 						<input type="date" class="check" name="checkin" id="checkin"
							style="font-size: 1.4rem; width: 180px; border: none; margin-right: 20px;">

						<input type="date" class="check" name="checkout" id="checkout"
							style="font-size: 1.4rem; width: 180px; margin-right: 95px; border: none; "> -->
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
				<script>
				$(function(){
					$('#searchBtn').click(function(){
						if($('#area').val()!="x"){
							$('#searchform').attr('action','/semi/pethotelsearch.ys?area='+$('#area').val()).submit();	
						}else{
							alert("지역을 선택해주세요");
						}
						

					});
				});
			</script>
			</form>
            <!-- 검색창 부분 끝 -->
            <div style="height: 3000">
                
    
                <!------------- hotel-list ------------>
                <div id="main-content">
                    <div class="hotel-box">
                        <div class="count-hotel">
                        </div>
                    	<table id="hlist">
                           <% for(PetHotel ph : phlist){ %>
                            <tr>
                                <td style="padding-bottom: 20px; "> 
                                <input type="hidden" value="<%= ph.getPhno()%>" id="ch1">
          							<a  id="nextpage" href="<%=request.getContextPath() %>/pethoteldetail.ys?ph_no=<%= ph.getPhno()%>">
	                                    <div class="hotel-info-list">
	                                        <div class="hotelimg"><img src="<%=request.getContextPath() %>/resources/images/<%=ph.getImg() %>" alt=""></div>
	                                        <div class="hotelinfo">
	                                            <strong><%=ph.getPhname() %></strong>
	                                            <span>  평점 <label><%= ph.getPhscore()%></label></span> 
	                                            <hr>
	                                            <p><%= ph.getPhaddress() %></p><br>
	                                            <p><%= ph.getPhpromotion()%></p>
	                                        </div>
	                                        <div class="price"><%= ph.getPhprice()%></div>
	                                    </div>
                                    </a>
                                </td>
                            </tr>
                             <%} %>
                        </table>
                        
                    
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