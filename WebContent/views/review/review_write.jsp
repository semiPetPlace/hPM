<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String type =request.getParameter("type"); %>
    <% int cno =Integer.parseInt(request.getParameter("cno"));%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>후기작성</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mainpage.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/review_write.css">
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src ="<%=request.getContextPath()%>/resources/js/script.js"></script>
        <script src="<%=request.getContextPath()%>/resources/js/jquery-1.11.3.min.js"></script>
		<script src="<%=request.getContextPath()%>/resources/js/star.js"></script>
        <style>
		.star-input>.input,
		.star-input>.input>label:hover,
		.star-input>.input>input:focus+label,
		.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('/semi/resources/images/grade_img.png')no-repeat;}
		.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
		.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
		.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
		star-input>.input.focus{outline:1px dotted #ddd;}
		.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
		.star-input>.input>label:hover,
		.star-input>.input>input:focus+label,
		.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
		.star-input>.input>label:hover~label{background-image: none;}
		.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
		.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
		.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
		.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
		.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
		.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
	</style>
    </head>
    <body>
        <%@ include file = "../common/header.jsp" %>
        
    <div id="main">
      <form action="<%= request.getContextPath() %>/rvInsert.th" q
			      method="post" enctype="multipart/form-data">
			      <input type="hidden" name="type" value="<%= type %>">
			      <input type="hidden" name="cno" value="<%= cno %>">
			      <input type="hidden" name="star-input" value="0">
        <div class="review_top">
            <label>리뷰 작성</label>
	   		 <h3>작성자   <%= m.getMuserName() %></h3>
             <input type="hidden" name="userId" value="<%= m.getMuserId() %>"/>
             
        </div>
        <div class="review_mid">
            <p>별점을 매겨주세요</p>
		<span class="star-input">
			<span class="input">

		    	<input type="radio" name="star-input" value="1" id="p1">
		    	<label for="p1">1</label>
		    	<input type="radio" name="star-input" value="2" id="p2">
		    	<label for="p2">2</label>
		    	<input type="radio" name="star-input" value="3" id="p3">
		    	<label for="p3">3</label>
		    	<input type="radio" name="star-input" value="4" id="p4">
		    	<label for="p4">4</label>
		    	<input type="radio" name="star-input" value="5" id="p5">
		    	<label for="p5">5</label>
		  	</span>		
		</span>
        </div>

          <script>
              $('.starRev span').click(function(){
                $(this).parent().children('span').removeClass('on');
                $(this).addClass('on').prevAll('span').addClass('on');
                 return false;
              });
          </script>

        <div class="review_content">
             <div>
                <input type="text" name="title" id="post-name" placeholder="제목을 작성해 주세요." style="width:100%"/>
            </div>
        <div id="write_menu"><input type="file" name="file" id="file" style="border:1px solid black; margin-top: 5px; width : 100%"/></div>

        <div id="write"><textarea name="content" cols="52" rows="15" style="resize:none; width	:100%; height:100%"></textarea></div>
            <input type="submit" value="등록" id="writebtn">
        </div>
   	</form>
  	
    </div>
        <!-- TOP -->
        <div style="height: 20px; margin-right: 2%;"><a href="#header" id="top">▲ TOP</a></div>
        
        <%@ include file = "../common/footer.jsp" %>
    </body>
</html>