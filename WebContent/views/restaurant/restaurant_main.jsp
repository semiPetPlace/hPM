<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semiProject.restaurant.model.vo.*, com.kh.common.PageInfo, java.util.*" %>
<% 
	ArrayList<Restaurant> list = (ArrayList<Restaurant>)request.getAttribute("list");
	Restaurant r = (Restaurant)request.getAttribute("restaurant");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	String local = (String)request.getAttribute("local");
	String size = (String)request.getAttribute("size");
	String keyword = (String)request.getAttribute("keyword");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
 %>    
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개편한 세상</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/mainpage.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/restaurant-main.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/pagination.css">
    <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src ="<%= request.getContextPath() %>/resources/js/script.js"></script>
</head>
<body>
    	<%@ include file = "../common/header.jsp" %>

	<main id="H_main">
		<div id="main-wrapper">
			<div id="main-image">
				<img
					src="<%= request.getContextPath() %>/resources/images/icons/restaurant.png"
					alt="main-background" width="20%;" style="max-height: initial;">
			</div>

			<!-- 검색창 부분 -->
			<div id="search-box">
				<select name="local" id="search_local">
					<option value="nonselect" class="nonselect">지역</option>
					<option value="서울" class="seoul">서울</option>
					<option value="경기" class="gyeonggi">경기</option>
					<option value="인천" class="incheon">인천</option>
					<option value="대구" class="daegu">대구</option>
					<option value="부산" class="busan">부산</option>
					<option value="제주" class="jeju">제주</option>
				</select> <select name="size" id="search_size">
					<option value="nonselect" class="nonselect">반려견 사이즈</option>
					<option value="A">견종 무관</option>
					<option value="S">소형견</option>
					<option value="M">중형견</option>
					<option value="L">대형견</option>
				</select> <input type="text" name="keyword" id="keyword" placeholder="동반 카페명">
				<button onclick="search_restaurant();" class="btn_search">검색</button>
			</div>
			<!-- 검색창 부분 끝 -->

			<!-- 카페/레스토랑 리스트 -->
			<div id="cafeList">
				<% if(list.isEmpty()) { %>
					<p style="font-size: 20pt; margin: auto; padding-top: 50px;">검색 결과가 없습니다.</p>
				<% } %>
				<table>
					<% int cnt = 1; %>
					<% for(Restaurant rm : list) { %>
					<% if(cnt % 3 == 1) { %>
					<tr>
					<% } %>
						<td>
						<input type="hidden" value="<%= rm.getRno() %>" />
							<div class="cafeList-list"
							onclick="location.href='<%= request.getContextPath() %>/rView.ch?rno=<%= rm.getRno() %>'"
							style="cursor: pointer; margin: 50px 5% 0 0;">
								<a><img src="<%= request.getContextPath() %>/resources/images/restaurant/<%= rm.getRrimage() %>"
									style="width: 433px; height: 433px;" alt="restaurant"></a>
								<h4 style="margin-bottom: 0;"><%= rm.getRname() %></h4>
								<p class="infoText"><%= rm.getRpromotion() %></p>
								<p class="price">★ 평점 <%= rm.getRscore() %></p>
							</div>
						</td>
					<% if(cnt % 3 == 0) { %>
					</tr>
					<% cnt = 0; } %>
					<% cnt++; } %>
				</table>
			</div>
			<!-- 카페/레스토랑 리스트 끝 -->

	<!-- 페이징 처리 시작 -->
	<div class="list_number" align="center">
		<% if(keyword != null) { %>
			<button onclick="location.href='<%= request.getContextPath() %>/rSearch.ch?local=<%= local %>&size=<%= size %>&keyword=<%= keyword %>&currentPage=1'">◀◀</button>
			<%  if(currentPage <= 1) {  %>
			<button disabled>◀</button>
			<%  }else { %>
			<button onclick="location.href='<%= request.getContextPath() %>/rSearch.ch?local=<%= local %>&size=<%= size %>&keyword=<%= keyword %>&currentPage=<%= currentPage - 1 %>'">◀</button>
			<%  } %>

			<% for(int p = startPage; p <= endPage; p++) {
				if(p == currentPage) {	
			%>
			<button disabled style="border: 1px solid #ffb600; color: #ffb600;"><%= p %></button>
			<%      }else { %>
			<button onclick="location.href='<%= request.getContextPath() %>/rSearch.ch?local=<%= local %>&size=<%= size %>&keyword=<%= keyword %>&currentPage=<%= p %>'"><%= p %></button>
			<%      } %>
			<% } %>

			<%  if(currentPage >= maxPage) {  %>
			<button disabled>▶</button>
			<%  }else { %>
			<button onclick="location.href='<%= request.getContextPath() %>/rSearch.ch?local=<%= local %>&size=<%= size %>&keyword=<%= keyword %>&currentPage=<%= currentPage + 1 %>'">▶</button>
			<%  } %>
			<button onclick="location.href='<%= request.getContextPath() %>/rSearch.ch?local=<%= local %>&size=<%= size %>&keyword=<%= keyword %>&currentPage=<%= maxPage %>'">▶▶</button>

		<% }else { %>

			<button onclick="location.href='<%= request.getContextPath() %>/rList.ch?currentPage=1'">◀◀</button>
			<%  if(currentPage <= 1) {  %>
			<button disabled>◀</button>
			<%  }else { %>
			<button onclick="location.href='<%= request.getContextPath() %>/rList.ch?currentPage=<%= currentPage - 1 %>'">◀</button>
			<%  } %>

			<% for(int p = startPage; p <= endPage; p++) {
				if(p == currentPage) {	
			%>
			<button disabled style="border: 1px solid #ffb600; color: #ffb600;"><%= p %></button>
			<%      }else { %>
			<button onclick="location.href='<%= request.getContextPath() %>/rList.ch?currentPage=<%= p %>'"><%= p %></button>
			<%      } %>
			<% } %>

			<% if(currentPage >= maxPage) {  %>
			<button disabled>▶</button>
			<% }else { %>
			<button onclick="location.href='<%= request.getContextPath() %>/rList.ch?currentPage=<%= currentPage + 1 %>'">▶</button>
			<% } %>
			<button onclick="location.href='<%= request.getContextPath() %>/rList.ch?currentPage=<%= maxPage %>'">▶▶</button>
		<% } %>
	</div>
	<!-- 페이징 처리 끝 -->

	<script>
	$(function(){
	
		$(function(){
			var search_local = $('#search_local').val();
			var search_size = $('#search_size').val();
		});
		
		$('.btn_search').click(function(){
			if($('#search_local').val() != "nonselect" && $('#search_size').val() != "nonselect") {	
				location.href="<%= request.getContextPath() %>/rSearch.ch?local=" + $('#search_local').val() + "&size=" + $('#search_size').val() + "&keyword=" + $('#keyword').val();
			}else {
				alert("검색할 지역과 반려견 사이즈를 선택해 주세요.");
			}
			
		});
	});
	</script>
	</div>
	
	<!-- TOP -->
	<div style="height: 20px; margin-right: 2%;"><a href="#header" id="top">▲ TOP</a></div>

	</main>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>