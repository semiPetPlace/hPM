<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>게시글 작성하기</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mainpage.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/freeboardwrite.css">
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src ="<%=request.getContextPath()%>/resources/js/script.js"></script>

    </head>
    <body>
        <%@ include file = "../common/header.jsp" %>
		<% if (m != null) { %>
    <div id="main">
        <form action="<%= request.getContextPath() %>/bInsert.th" 
			      method="post" enctype="multipart/form-data">
        <div class="review_mid">
            <h1>게시글 작성</h1>
                 <h3>작성자   <%= m.getMuserName() %></h3>
                 <input type="hidden" name="userId" value="<%= m.getMuserId() %>"/>
            
            <ul class="explanation">
                <li>
                </li>
                <li>
                 
                </li>
                <li>
                
                </li>
            </ul>
        </div>
        <!-- <div class="review_top">
            <img src="../../resources/images/cafe2.jpg" alt="">
        </div> -->
        <div class="review_content">
            <div>
                <input type="text" name="title" id="post-name" placeholder="제목을 작성해 주세요."/>
            </div>
            <div id="write_menu"><input type="file" name="file" id="file" style="border:1px solid black; margin-top: 5px; width : 100%"/></div>
       
            <div id="write"><textarea name="content" cols="52" rows="15" style="resize:none; width	:100%; height:100%"></textarea></div>
            <input type="submit" value="등록" class="btn">
        </div>
        </form>
    </div>
    	<% } else { 
		request.setAttribute("msg", "회원만 열람 가능합니다.");
		request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);
	 } %> 
        <!-- TOP -->
        <div style="height: 20px; margin-right: 2%;"><a href="#header" id="top">▲ TOP</a></div>

        <%@ include file = "../common/footer.jsp" %>
    </body>
</html>