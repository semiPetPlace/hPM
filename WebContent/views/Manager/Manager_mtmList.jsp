<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import= "java.text.*,com.kh.semiProject.mQnA.model.vo.*, java.util.*"%>
<%
	ArrayList<QnA> qList = (ArrayList<QnA>)request.getAttribute("qList");
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
                                <td><%= q.getClientName() %></td>
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