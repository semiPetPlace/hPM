<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semiProject.cafe.model.vo.*, java.util.*"%>
<% 
	ArrayList<Cafe> list = (ArrayList<Cafe>)request.getAttribute("list");
 %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개편한 세상</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/mainpage.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/cafe-main.css">
    <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src ="<%= request.getContextPath() %>/resources/js/script.js"></script>
</head>
<body>
    	<%@ include file = "../common/header.jsp" %>
    	
    <main id="H_main">
        <div id="main-wrapper">
            <div id="main-image">
                <img src="<%= request.getContextPath() %>/resources/images/icons/cafe.png" alt="main-background" width="20%;" style="max-height: initial;">
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
                <button onclick="search_cafe();" class="btn_search">검색</button>
            </div>
            <!-- 검색창 부분 끝 -->

            <!-- 카페/레스토랑 리스트 -->
            <div id="cafeList">
                <table>
                    <tr>
                    <% for(Cafe cm : list){ %>
                        <td>
                        <input type="hidden" value="<%= cm.getCno() %>"/>
                            <div class="cafeList-list">
                            <a id="cfdetailpage">
                                <img src="<%= request.getContextPath() %>/resources/images/cafe1.jpg" alt="cafe">
							</a>
                                <h4 style="margin-bottom: 0;"><%= cm.getCname() %></h4>
                                <p class="infoText"><%= cm.getCpromotion() %></p>
                                <p class="score">★ 평점 <%= cm.getCscore() %></p>
                            </div>
                        </td>
                        <% } %>
                  	 <tr>
                </table>
            </div>
            <!-- 카페/레스토랑 리스트 끝 -->
			<%@ include file ="../common/pagination.jsp" %>
			<script>
			// 페이징 처리 시작
				// location.href 주소 안의 /servlet.link? 주소만 바꿔서 사용
				<% int p = startPage; %>
				
				$('#stp').click(function(){
					location.href='<%= request.getContextPath() %>/cList.ch?currentPage=1';
				});
				$('#bkp').click(function(){
					location.href='<%= request.getContextPath() %>/cList.ch?currentPage=<%= currentPage - 1 %>';
				});
				$('#chp').click(function(){
					location.href='<%= request.getContextPath() %>/cList.ch?currentPage=<%= p %>';
				});
				$('#nxp').click(function(){
					location.href='<%= request.getContextPath() %>/cList.ch?currentPage=<%= currentPage + 1 %>';
				});
				$('#mxp').click(function(){
					location.href='<%= request.getContextPath() %>/cList.ch?currentPage=<%= maxPage %>';
				});	
			// 페이징 처리 끝
			
            
			// 상세 페이지로 이동 시작
    		$(function() {
    						 
    			 $(".cafeList-list").mouseenter(function(){
    				 $(this).parent().css({"cursor":"pointer"});
    			 }).click(function(){
    				 var cno = $(this).parent().find("input").val();
     				$('#cfdetailpage').attr("href",'/semi/cView.ch?cno=' + cno).click();
     				<%-- location.href="<%= request.getContextPath() %>/cView.ch?cno=" + cno; --%>
    			 });
    		});
			// 상세 페이지로 이동 끝
			
			
			</script>
        </div>
            <!-- TOP -->
            <div style="height: 20px; margin-right: 2%;"><a href="#header" id="top">▲ TOP</a></div>
            
    </main>
        <%@ include file = "../common/footer.jsp" %>
    </body>
    </html>