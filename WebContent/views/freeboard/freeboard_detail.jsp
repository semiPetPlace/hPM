<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.semiProject.board.model.vo.*"%>
<%@ page import="com.kh.semiProject.comment.model.vo.*"%>
<%@ page import="java.util.*"%>
<% 	Board b = (Board)request.getAttribute("board");
	ArrayList<Comment> clist
		= (ArrayList<Comment>)request.getAttribute("clist");
%>
<!DOCTYPE html>
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
                    <h3><%=b.getbTitle() %></h3>
                    <img src="<%=request.getContextPath()%>/resources/images/review_detail/img1.jpg" id="miniImg">
                    <label class="writer"><%=b.getbWriter() %></label>
                    <% if(m != null && m.getMuserName().equals(b.getbWriter())){ %>
                    <input type="button" value="삭제" class="comentbtn" onclick="location.href='<%=request.getContextPath()%>/boardDelete.th?bno=<%=b.getbNo() %>'" id="content_delete">
              		<% }%>
					<%if(m != null && m.getMuserId().equals("admin")){ %>
					 <input type="button" value="삭제" class="comentbtn" onclick="location.href='<%=request.getContextPath()%>/boardDelete.th?bno=<%=b.getbNo() %>'" id="content_delete">
              		<% }else if(m != null && m.getMuserId().equals("admin")){ %>
					 <input type="button" value="삭제" class="comentbtn" onclick="location.href='<%=request.getContextPath()%>/boardDelete.th?bno=<%=b.getbNo() %>'" id="content_delete">
              		<%} %>
              		<% if(m != null && m.getMuserName().equals(b.getbWriter())){%>
                    <input type="button" value="수정" class="comentbtn" onclick="location.href='<%= request.getContextPath() %>/bUpView.th?bno=<%=b.getbNo()%>'" id="content_update">
                    <%} %>
                </div>

                <img src="<%= b.getbImg() %>" id="contentImg">

                <div id="reviwecontent"><%= b.getbContent() %></div>

                <input type="button" value="목록" id="list_btn" class="comentbtn" onclick="location.href='/semi/blist.th'">


				
                <div id="review">
                    <label>댓글</label>
                    <form action="<%= request.getContextPath() %>/cmInsert.th" 
			      method="post">
			      	<% if(m != null){ %>
			      	<input type="hidden" name="writer" value="<%=m.getMuserId()%>"/>
			      	<input type="hidden" name="bnno" value="<%=b.getbNo() %>" />
			      	<input type="hidden" name="type" value="board" />
					<input type="hidden" name="refcno" value="0" />
					<input type="hidden" name="clevel" value="1" />
					<% } %>
                    <div id="writeReview"  style="padding-bottom: 0px; margin-top: 0px; ">
                        <h3>댓글 쓰기</h3>
                        <textarea cols="30" rows="10" name = "cwrite"></textarea>
                        <% if(m != null){ %>
                        <input type="submit" value="댓글 쓰기" id="writebtn">
                        <% } %>
					</div>
                	</form>
                    </div>
                <br>
                	
                	<%for (Comment bco : clist){ %>
                    <div id="comment">
                        <div id="name">
                            <img src="<%=request.getContextPath()%>/resources/images/review_detail/img1.jpg" id="miniImg">
                            <label class="writer"><%= bco.getCmwriter() %></label>
							 <% if(m != null && m.getMuserName().equals(b.getbWriter())){ %>
                            <input type="button" value="삭제" class="comentbtn" onclick="location.href='<%=request.getContextPath()%>/commentDelete.th?cmno=<%=bco.getCmno() %>&bno=<%=b.getbNo()%>&type=board'" id="review_delete">
							<%} %>
							<%if(m != null && m.getMuserId().equals("admin")){ %>
							<input type="button" value="삭제" class="comentbtn" onclick="location.href='<%=request.getContextPath()%>/commentDelete.th?cmno=<%=bco.getCmno() %>&bno=<%=b.getbNo()%>&type=board'" id="review_delete">
							<% }%>
							 <% if(m != null && m.getMuserName().equals(b.getbWriter())){ %>
                            <input type="button" value="수정" class="comentbtn" onclick="update(this)" id="comment_update" style="display: block ;">
							<input type="button" value="수정완료" class="comentbtn" onclick="update2(this)" id="comment_update2" style="display: none;">
		                	<input type="hidden" id="cmno2" value="<%=bco.getCmno()%>">
							<% }%>
                        </div>    
                         <div id="content"><textarea class="cmcontent" id="cmcontent" style="width: 100%; height: 50px; resize: none;" disabled="disabled"><%= bco.getCmcontent() %></textarea></div>
                    </div>
                    <script>
                    function update(obj) {
                		$(obj).parent().next().find('textarea')
                		.removeAttr('disabled');
                    	$(obj).siblings('.comentbtn').css('display','inline');
                    	$(obj).css('display','none');					
					}
                    function update2(obj) {
                    	var content
              		  = $(obj).parent().next().find('textarea').val();
                    	var cmno = $(obj).siblings('#cmno2').val();
                    	var bno = '<%=b.getbNo()%>';
                    	location.href="<%=request.getContextPath()%>/updateComment.th?"
           				 +"cmno="+cmno+"&bnno="+bno+"&content="+content+"&type=board";
					}
                    </script>
                 <% } %>
                    
                </div>

            <!-- TOP -->
            <div style="height: 20px; margin-right: 2%;"><a href="#header" id="top">▲ TOP</a></div>

			<%@ include file = "../common/footer.jsp" %>
    </body>
</html>