<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.kh.semiProject.notice.model.vo.*"%>
<!DOCTYPE html>
<% 	Notice n = (Notice)request.getAttribute("notice"); %>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>상세보기</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mainpage.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/freeboard_detail.css">
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src ="<%=request.getContextPath()%>/resources/js/script.js"></script>
    </head>
    <body>
        <%@ include file = "../common/header.jsp" %>



            <!-- 여기에 메인 컨텐츠 넣으면 됩니다. -->
                  
            <div id="reviewContent">

                <div id="review_top">
                    <h3><%=n.getnTitle() %></h3>
                    <img src="<%=request.getContextPath()%>/resources/images/review_detail/img1.jpg" id="miniImg">
                    <label class="writer"><%=n.getnWriter() %></label>
                    <% if(m != null && m.getMuserId().equals("admin")){ %>
                    <input type="button" value="삭제" class="comentbtn"  onclick="location.href='<%=request.getContextPath()%>/nDelete.th?nno=<%=n.getnNo() %>'" id="content_delete">
                    <input type="button" value="수정" class="comentbtn" onclick="location.href='<%= request.getContextPath() %>/nUpView.th?nno=<%=n.getnNo()%>'" id="content_update">
                    <%}%>
                </div>

                <img src="<%= n.getnImg() %>"alt="" id="contentImg">

                <div id="reviwecontent"><%= n.getnContent() %></div>

                <input type="button" value="목록" id="list_btn" class="comentbtn" onclick="location.href='./semi/nList.th'">



                <div id="review">
                    <label>댓글</label>
                    <div id="comment">
                        <div id="name">
                            <img src="<%=request.getContextPath()%>/resources/images/review_detail/img1.jpg" id="miniImg">
                            <label class="writer">이름</label>
                        </div>
                            <div id="content">내용</div>
                            <input type="button" value="삭제" class="comentbtn" onclick="confirm('삭제하시겠습니까?')" id="review_delete">
                            <input type="button" value="수정" class="comentbtn" onclick="confirm('수정하시겠습니까?')" id="review_update">
                        </div>
                         

                    <div id="writeReview">
                        <h3>댓글 쓰기</h3>
                        <textarea cols="30" rows="10"></textarea>
                        <input type="button" value="댓글 쓰기" id="writebtn">
                    </div>
                </div>         
            <!-- TOP -->
            <div style="height: 20px; margin-right: 2%;"><a href="#header" id="top">▲ TOP</a></div>
		</div>

            <%@ include file = "../common/footer.jsp" %>
    </body>
</html>