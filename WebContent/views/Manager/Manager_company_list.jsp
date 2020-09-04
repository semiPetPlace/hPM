<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.semiProject.mCompany.model.vo.*"%>

<% ArrayList<Company> list = (ArrayList<Company>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관리자 메인 화면</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Manager-DefaultCSS.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Manager-company.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
                        <li><a href="/semi/cList.co">· 전체 업체 목록</a></li>
                        <li><a href="/semi/views/Manager/Manager_company_enrollForm.jsp">· 업체 등록</a></li>
                    </ul>
                </div>
            </div>
             <!-- 여기에 메인 컨텐츠 넣으면 됩니다. -->    
            <div class="content">
                <div class="reservationTable">
                    <p style="font-size: 30px; font-weight: 500px; margin-bottom: 10px;">전체 업체 목록</p>
                    <div class="searchPot"></div>
                    
                    <div class="searchCompany">
						<select id="searchCondition" name="searchCondition">
							<option value="total">전체</option>
							<option value="cName">업체명</option>
							<option value="category">업체분류</option>
							<option value="comNum">업체번호</option>
							<option value="address">주소</option>
							<option value="state">등록상태</option>
							<option value="enrollDate">등록일</option>
							<option value="phone">연락처</option>
							<option value="email">이메일</option>
						</select>
						<input type="search" id="keyword" placeholder="키워드를 입력하세요">
						<button type="button" onclick="search();">검색</button>
					</div>
                    <div class="btns">
                        <input type="button" value="업체 등록" class="enrollBtn" onclick="location.href='views/Manager/Manager_company_enrollForm.jsp'">
                        <!-- <input type="button" value="업체 삭제" class="deleteBtn" onclick="alert('해당 업체 삭제가 완료되었습니다. ')"> -->
                    </div> 
       			<table id="listArea">
                    <tr>
                        <th id="comNum">업체번호</th>
                        <th id="category">업체분류</th>
                        <th id="cName">업체명</th>
                        <th id="address">주소</th>
                        <th id="enrollDate">등록일</th>
                        <th id="phone">연락처</th>
                        <th id="email">이메일</th>
                        <th id="state">등록상태</th>
					</tr>
					<% for(Company c : list){ %>
					<tr>
						<td><%= c.getComNum() %></td>
						<td><%= c.getCategory() %></td>
						<td><%= c.getcName() %></td>
						<td><%= c.getAddress() %></td>
						<td><%= c.getEnrollDate() %></td>
						<td><%= c.getPhone() %></td>
						<td><%= c.getEmail() %></td>
						<td><%= c.getState() %></td>
					</tr>
					<% } %>
				</table>
				
                        <div class="empty">
                            <br><br><br>
                        </div>
                        <div id="next">
                            <ul>
                                <a href=""><li><</li></a>
                                <a href=""><li>1</li></a>
                                <a href=""><li>2</li></a>
                                <a href=""><li>3</li></a>
                                <a href=""><li>4</li></a>
                                <a href=""><li>5</li></a>
                                <a href=""><li>></li></a>
                            </ul>
                        </div>
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
				var comNum = $(this).parent().children().eq(0).text();
				location.href="<%=request.getContextPath()%>/cDetail.co?comNum=" + comNum;
			});
		});
		
		function search(){
			location.href="<%=request.getContextPath()%>/searchCompany.co?con="+$('#searchCondition').val()+"&keyword="+$('#keyword').val();
		}
		
		</script>
</main>
<%@ include file = "./Manager_footer.jsp" %>
</body>
</html>