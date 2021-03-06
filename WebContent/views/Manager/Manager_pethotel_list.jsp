<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.common.PageInfo, com.kh.semiProject.Hotel.model.vo.*"%>


<% 
@SuppressWarnings("unchecked")
ArrayList<PetHotel> list = (ArrayList<PetHotel>)request.getAttribute("list");
%>
<% 
PageInfo pi = (PageInfo)request.getAttribute("pi");
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
    <title>관리자 메인 화면</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/pagination.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Manager-DefaultCSS.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Manager-company.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <style>
    	.searchCompany{
    	width: 800px;
    	}
    	.btns{
    	width: 70px;
    	margin-right: 270px;
    	margin-bottom: 40px;
    	float: right;
    	margin-top: 50px;
    	}
    	#searchCondition{
    	height: 22px;
    	margin-right: 10px;
    	}
    	#keyword{
    	height: 22px;
    	margin-right: 5px;
    	}
    	#listArea{
    	font-size:larger;
    	width:1200px;
    	}
    	.btns{
    	width: 70px;
    	margin-right:450px;
    	}
    	.next{
    	width:300px;
    	margin-left:410px;
    	margin-top:100px;
    	}
    </style>
</head>
<body>
     <%@ include file = "./Manager_header.jsp" %>
<main id="main">
    <div id="main-wrapper">
        <div class="main-content">
            <div class="sub-menu">
                <div class="sub-list">
                    <p>업체 관리</p>
                    <ul>
                        <li><a href="/semi/hList.hj">· 동반 호텔 리스트</a></li>
                        <li><a href="/semi/phList.hj">· 위탁 호텔 리스트</a></li>
                        <li><a href="/semi/cList.hj">· 동반 카페 리스트</a></li>
                        <li><a href="/semi/rList.hj">· 동반 식당 리스트</a></li>
                    </ul>
                </div>
            </div>
             <!-- 여기에 메인 컨텐츠 넣으면 됩니다. -->    
            <div class="content">
                <div class="reservationTable">
                    <p style="font-size: 30px; font-weight: 500px; margin-bottom: 10px;">위탁 호텔 리스트</p>
                    <div class="searchPot"></div>
                    
                    <div class="searchCompany">
						<select id="searchCondition" name="searchCondition">
							<option value="total">전체</option>
							<option value="phno">업체번호</option>
							<option value="phname">업체명</option>
							<option value="phtel">연락처</option>
							<option value="phprice">가격</option>
							<option value="phaddress">주소</option>
							<option value="phregisterdate">등록일</option>
							<option value="registration">등록상태</option>
						</select>
						<input type="search" id="keyword" placeholder="키워드를 입력하세요">
						<button type="button" onclick="search();">검색</button>
					</div>
                    <div class="btns">
                        <input type="button" value="업체 등록" class="enrollBtn" onclick="location.href='views/Manager/Manager_pethotel_enrollForm.jsp'">
                    </div> 
       			<table id="listArea">
                    <tr>
                        <th id="phno" style="width:70px;">업체번호</th>
                        <th id="phname" style="width:200px;">업체명</th>
                        <th id="phtel" style="width:120px;">연락처</th>
                        <th id="phprice" style="width:80px;">가격</th>
                        <th id="phaddress" style="width:400px;">주소</th>
                        <th id="phregisterdate" style="width:100px;">등록일</th>
                        <th id="registration" style="width:50px;">등록상태</th>
					</tr>
					<% for(PetHotel ph : list){ %>
					<tr>
						<td><%= ph.getPhno() %></td>
						<td><%= ph.getPhname() %></td>
						<td><%= ph.getPhtel() %></td>
						<td><%= ph.getPhprice() %></td>
						<td><%= ph.getPhaddress() %></td>
						<td><%= ph.getPhregisterdate() %></td>
						<td><%= ph.getRegistration() %></td>
					</tr>
					<% } %>
				</table>
                <div class="empty">
                    <br><br><br>
                </div>
                <!-- 페이징 처리 시작 -->
				<div class="next" align="center">
				<button onclick="location.href='<%= request.getContextPath() %>/phList.hj?currentPage=1'">◀◀</button>
				<%  if(currentPage <= 1) {  %>
				<button disabled>◀</button>
				<%  }else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/phList.hj?currentPage=<%= currentPage - 1 %>'">◀</button>
				<%  } %>
				
				<% for(int p = startPage; p <= endPage; p++) {
						if(p == currentPage) {	
				%>
					<button disabled style="border: 2px solid #7A9BAD; color: #7A9BAD;"><%= p %></button>
				<%      }else { %>
					<button onclick="location.href='<%= request.getContextPath() %>/phList.hj?currentPage=<%= p %>'"><%= p %></button>
				<%      } %>
				<% } %>
					
				<%  if(currentPage >= maxPage) {  %>
				<button disabled>▶</button>
				<%  }else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/phList.hj?currentPage=<%= currentPage + 1 %>'">▶</button>
				<%  } %>
				<button onclick="location.href='<%= request.getContextPath() %>/phList.hj?currentPage=<%= maxPage %>'">▶▶</button>
				</div> 
				<!-- 페이징 처리 끝 -->
                    </div>
                </div>
            </div>
        </div>
         <script>  
     	
		$(function(){
			$("#listArea td").mouseenter(function(){
				$(this).parent().css({"background":"#7A9BAD", "color":"white", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"white", "color":"black"});
			}).click(function(){
				//console.log($(this).parent().children().eq(0).text());
				var phno = $(this).parent().children().eq(0).text();
				location.href="<%=request.getContextPath()%>/phSelectOne.hj?phno=" + phno;
			});
		});
		
		function search(){
			location.href="<%=request.getContextPath()%>/phSearchList.hj?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();
		}
		
		</script>
</main>
<%@ include file = "./Manager_footer.jsp" %>
</body>
</html>