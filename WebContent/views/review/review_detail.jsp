<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.kh.semiProject.review.model.vo.*"%>
<% 	Review rv = (Review)request.getAttribute("review"); %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>리뷰제목</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mainpage.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/review_details.css">
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src ="<%=request.getContextPath()%>/resources/js/script.js"></script>
    </head>
    <body>
        <%@ include file = "../common/header.jsp" %>

        <div id="reviewContent">
            <div id="review_top">
                <p><%= rv.getRvtitle() %></p>
                <img src="<%=request.getContextPath()%>/resources/images/review_detail/img1.jpg" id="miniImg">
                <label class="writer"><%= rv.getRvwriter() %></label><br>
                 <label class="writer">별점 : <%= rv.getRvScore() %>점</label>
                  <% if(m != null && m.getMuserName().equals(rv.getRvwriter())){ %>
                <input type="button" value="삭제" class="comentbtn" onclick="location.href='<%=request.getContextPath()%>/reviewDelete.th?rvno=<%=rv.getRvno() %>'" id="content_delete">
                <input type="button" value="수정" class="comentbtn" onclick="location.href='<%= request.getContextPath() %>/rvUpView.th?rvno=<%=rv.getRvno()%>'" id="content_update">
				<%} %>           
            </div>
            
            <img src="<%= rv.getRvimage() %>" alt="" id="contentImg">
            <div id="reviwecontent"><%= rv.getRvcontent() %></div>
            <input type="button" value="목록" class="comentbtn" onclick="location.href='/semi/rvList.th'">
            
            <div id="review">
                <label >댓글</label>
                <div id="comment">
                    <div id="name">
                        <img src="<%=request.getContextPath()%>/resources/images/review_detail/img1.jpg" id="miniImg">
                        <label class="writer">이름</label>
                    </div>
                        <div id="content">내용</div>
                        <input type="button" value="삭제" class="comentbtn" onclick="confirm('삭제하시겠습니까?')" id="review_delete">
                        <input type="button" value="수정" class="comentbtn" onclick="confirm('수정하시겠습니까?')" id="review_update">
                    </div>
                </div>
                
                
                <div id="writeReview">
                    <h3>댓글쓰기</h3>
                    <textarea cols="30" rows="10"></textarea>
                    <input type="button" value="댓글쓰기" id="writebtn">
                </div>
            </div>         
        <!-- TOP -->
        <div style="height: 20px; margin-right: 2%;"><a href="#header" id="top">▲ TOP</a></div>

        <%@ include file = "../common/footer.jsp" %>
    </body>
</html>