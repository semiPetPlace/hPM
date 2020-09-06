<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import= "com.kh.common.*,java.text.*,com.kh.semiProject.mQnA.model.vo.*, java.util.*"%>
<%
	ArrayList<QnA> qList = (ArrayList<QnA>)request.getAttribute("qList");
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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Manager-DefaultCSS.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Manager_mtmList.css">
    <style type="text/css">
    	#trh:hover{
		    background: #cae5f3 ;
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
                    <p>1:1문의 관리</p>
                    <ul>
                        <li><a href="#">· 문의 처리 대기</a></li>
                        <li><a href="#" onclick="goRequestedView()">· 문의 처리 완료</a></li>
                    </ul>
                </div>
            </div>
            <div id="content">
            <div class="top">
               <p id="top">문의 처리 대기</p>
               <div class="searchPot"> </div>
               <input type="button" value="삭제" class="btn">
               <input type="button" value="공지" class="btn">
            </div>

                <div id="table">
                    <table>
                        <tr>
                            <th id="qno">NO</th>
                            <th id="userid">작성자</th>
                            <th id="user-name">이름</th>
                            <th id="title">문의사항</th>
                            <th id="category">카테고리</th>
                            <th id="enrolldate">문의날짜</th>
                        </tr>
                        <%for(QnA q : qList){ %>
                            <tr class="listCal" id="trh">
                                <td><%= q.getQno() %></td>
                                <td><%= q.getClientId() %></td>
                                <td><a href="<%=request.getContextPath() %>/mDetail.ma?userName=<%=q.getClientName()%>"><%= q.getClientName() %></a></td>
                                <td><a href="<%=request.getContextPath() %>/requst.re?qno=<%=q.getQno()%>"><%= q.getQnaTitle() %></a></td>
                                <td><%= q.getQnaCategory() %></td>
                                <td><%= q.getQnaDate() %></td>
                            </tr> 
                         <%} %>
                     
                    </table>
                    <div class="search">
                       <span>검색</span>
                       <input type="text" name="search" id="search">
                       <input type="button" value="검색">
                     </div>
                   <div class="pagingArea" align="center">
			<button onclick="location.href='<%= request.getContextPath() %>/listView.mt?currentPage=1'"><<</button>
			<%  if(currentPage <= 1){  %>
			<button disabled><</button>
			<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/listView.mt?currentPage=<%=currentPage - 1 %>'"><</button>
			<%  } %>
			
			<% for(int p = startPage; p <= endPage; p++){
					if(p == currentPage){	
			%>
				<button disabled><%= p %></button>
			<%      }else{ %>
				<button onclick="location.href='<%= request.getContextPath() %>/listView.mt?currentPage=<%= p %>'"><%= p %></button>
			<%      } %>
			<% } %>
				
			<%  if(currentPage >= maxPage){  %>
			<button disabled>></button>
			<%  }else{ %>
			<button onclick="location.href='<%= request.getContextPath() %>/listView.mt?currentPage=<%=currentPage + 1 %>'">></button>
			<%  } %>
			<button onclick="location.href='<%= request.getContextPath() %>/listView.mt?currentPage=<%=maxPage %>'">>></button>
			
		</div>
                  </div>
                </div>
                <div class="empty">
                    <br><br><br>
                </div>
            </div>
        </div>
        
       
    </div>
</main>
<footer id="footer">
    <div id="foot">
        <p style="color: black;">Copyright © 1998-2020 KH Information Educational Institute All Right Reserved</p>
    </div>
</footer>
</body>
</html>
<script>
	function goRequestedView(){
		location.href="/semi/requestedView.mt";
	}
</script>