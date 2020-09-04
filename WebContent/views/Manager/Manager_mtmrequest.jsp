<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import= "java.text.*,com.kh.semiProject.mQnA.model.vo.*, java.util.*"%>
<%  QnA q = (QnA)request.getAttribute("q");%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>예약 결제관리</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Manager_mtmrequest.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Manager-DefaultCSS.css">
    <style type="text/css">
    .font25{
    font-size:25px;
    font-weight: 700;
    margin-bottom: 10px;
}
#reviewContent{
    margin-top: 100px;
    padding-left: 150px;
    width: 70%;
}
#inquiry{
    margin-bottom: 30px;
}
#inquiry>p{
    margin-bottom: 20px;
    font-size: 23px;
    border-bottom: 1px solid black;
    padding-bottom: 15px;
    width: 85%;
}

#content{
    height: 600px;
    text-align: left;
    background-color: ghostwhite;
    margin-bottom: 10px;
}

.QnAtext,.QnArequset{

    margin-top: 100px;
    width: 40%;
    height: 700px;
    float: left;
    margin-right: 50px;
}
h3,h1{
    height: 20px;
    line-height: 20px;
    float: left;
    padding-left: 5px;
    padding-right: 5px;
    margin-top:5px;
    margin-left: 10px;
}
.input-title{
    border: none;
    height: 20px;
    line-height: 20px;
    float: left;
    padding-left: 5px;
    padding-right: 5px;
    margin-top:5px;
    margin-left: 13px;
}
.input-requester{
    border: none;
    height: 20px;
    line-height: 20px;
    float: left;
    padding-left: 5px;
    padding-right: 5px;
    margin-top:5px;
    margin-left: 13px;
    width: 75px;
}


.BW{
    background: white;
    text-align: center;
}

.title-block,.content-block{
    width: 100%;
    height: 35px;
    font-size: 14px;
    background: #7A9BAD;;
}
.QnAarea,.requestArea{
    width: 100%;
    margin-top: 10px;
    height: 400px;
    border: 1px solid black;
}
#request-text{
    text-align: left;
    border: none;
    max-width: -webkit-fill-available;
    padding: 15px;
    resize: none;
}
input:focus {outline:none;}
textarea:focus {outline:none;}
    </style>
</head>
<body>
    <%@ include file = "./Manager_header.jsp" %>

<main id="main">
    <div id="main-wrapper">
        <div class="main-content">
            <div class="sub-menu">
                <div class="sub-list">
                    <p>회원 관리</p>
                    <ul>
                        <li class="page_nav">· 고객 현황</li>
                        <li class="page_nav">· 고객 문의</li>
                        <li class="page_nav">· 회원 정보 수정</li> 
                    </ul>
                </div>
            </div>
            <!-- 여기에 메인 컨텐츠 넣으면 됩니다. -->
                  
            <div id="reviewContent">
                <div id="inquiry">
                    <p>문의처리</p>
                </div>
                <div class="QnAtext">
                    <p class="font25">문의 내용</p>
                    <div class="title-block">
                        <h1>제목</h1><h3 class="BW"style="margin-left:13px;width:300px"><%= q.getQnaTitle() %></h3>
                       <!--  <h1>카테고리</h1>
                        <select>
                        	<option>호텔 관련</option>
                        	<option>카페 관련</option>
                        	<option>레스토랑 관련</option>
                        </select> -->
                    </div>
                    
                    <div class="content-block">
                        <h3>작성자</h3><h3 class="BW"><%=q.getClientName() %></h3>    
                        <h3>이메일</h3><h3 class="BW"><%=q.getClientEmail() %></h3>    
                        <h3>작성일</h3><h3 class="BW"><%=q.getQnaDate() %></h3>
                    </div>
                    <div class="QnAarea">
                        <P style="padding:15px; font-size:14px"><%=q.getQnaText() %></P>
                    </div>
                    
                </div>
                <div class="QnArequset">
                    <form action="<%=request.getContextPath() %>/Clear.re?qno=<%=q.getQno()%>">
                    	<input type="hidden" value="<%=q.getQno()%>" name="qno">
                        <p class="font25">문의 처리</p>
                        <div class="title-block">
                            <h1>제목</h1><h3 class="BW"style="margin-left:13px;width:320px"><%= q.getQnaTitle() %></h3>
                        </div>
                        
                        <div class="content-block">
                            <h1>답변</h1><input type="text" class="input-title">
                            <h3>담당자</h3><input type="text" name="requester" class="input-requester">   
                    
                        </div>
                        <div class="requestArea">
                            <textarea id="request-text" name="retext"style="resize: none;" cols="73" rows="24" ></textarea>
                        </div>
                        <input id="sendBtn" type="submit" value="답변 메일로 전송" style="float: right;margin-top: 10px;">
                    </form>    
                </div>
            </div>     
</body>
</html>
<script>
 function returnList(){
	 
	 location.href="<%=request.getContextPath() %>/Clear.re?qno=<%=q.getQno()%>";
 }
</script>