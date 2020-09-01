<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semiProject.cafe.model.vo.*, com.kh.common.PageInfo, java.util.*"%>
<% 
	ArrayList<Cafe> list = (ArrayList<Cafe>)request.getAttribute("list");
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개편한 세상</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/mainpage.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/cafe-main.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/pagination.css">
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
            <form action="searchForm_cafe" method="get">
            <div id="search-box">
                <select name="지역" id="search_local">
                    <option value="x" class="nonselect">지역</option>
                    <option value="">서울</option>
                    <option value="">경기</option>
                    <option value="">인천</option>
                    <option value="">대구</option>
                    <option value="">부산</option>
                    <option value="">제주</option>
                </select>
                <select name="반려견사이즈" id="search_size">
                    <option value="반려견사이즈" class="nonselect">반려견 사이즈</option> 
                    <option value="소형견">소형견</option> 
                    <option value="중형견">중형견</option> 
                    <option value="대형견">대형견</option> 
                </select>
                <input type="text" id="keyword" placeholder="동반 카페명">
                <button onclick="search_cafe();" class="btn_search">검색</button>
            </div>
            </form>
            <!-- 검색창 부분 끝 -->

            <!-- 카페/레스토랑 리스트 -->
            <div id="cafeList">
                <table>
				<% int cnt = 1; %>
                    <% for(Cafe cm : list) { %>
					<% if(cnt % 3 == 1) { %>
                    <tr>
                    <% } %>	
                        <td>
                        <input type="hidden" value="<%= cm.getCno() %>"/>
							<div class="cafeList-list"
							onclick="location.href='<%= request.getContextPath() %>/cView.ch?cno=<%= cm.getCno() %>'"
							style="cursor:pointer; width: 433px;">
                            <a>
                                <img src="<%= request.getContextPath() %>/resources/images/cafe1.jpg" alt="cafe">
							</a>
                                <h4 style="margin-bottom: 0;"><%= cm.getCname() %></h4>
                                <p class="infoText"><%= cm.getCpromotion() %></p>
                                <p class="price">★ 평점 <%= cm.getCscore() %></p>
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
			<button onclick="location.href='<%= request.getContextPath() %>/cList.ch?currentPage=1'">◀◀</button>
			<%  if(currentPage <= 1) {  %>
			<button disabled>◀</button>
			<%  }else { %>
			<button onclick="location.href='<%= request.getContextPath() %>/cList.ch?currentPage=<%= currentPage - 1 %>'">◀</button>
			<%  } %>
			
			<% for(int p = startPage; p <= endPage; p++) {
					if(p == currentPage) {	
			%>
				<button disabled style="border: 1px solid #ffb600; color: #ffb600;"><%= p %></button>
			<%      }else { %>
				<button onclick="location.href='<%= request.getContextPath() %>/cList.ch?currentPage=<%= p %>'"><%= p %></button>
			<%      } %>
			<% } %>
				
			<%  if(currentPage >= maxPage) {  %>
			<button disabled>▶</button>
			<%  }else { %>
			<button onclick="location.href='<%= request.getContextPath() %>/cList.ch?currentPage=<%= currentPage + 1 %>'">▶</button>
			<%  } %>
			<button onclick="location.href='<%= request.getContextPath() %>/cList.ch?currentPage=<%= maxPage %>'">▶▶</button>
			</div>
			<!-- 페이징 처리 끝 -->
			
			
			<script>
			
			// 검색 기능
			function search_cafe(){
				location.href="<%= request.getContextPath() %>/searchNotice.no?con="+$('#search_local').val()+$('#search_size').val()+"&keyword="+$('#keyword').val();
			}
			
			</script>
        </div>
            <!-- TOP -->
            <div style="height: 20px; margin-right: 2%;"><a href="#header" id="top">▲ TOP</a></div>
            
    </main>
        <%@ include file = "../common/footer.jsp" %>
    </body>
    </html>