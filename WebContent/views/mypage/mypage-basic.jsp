<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.semiProject.mypage.model.vo.*" %>
<% ArrayList<ReservationMana> reserList = (ArrayList<ReservationMana>)request.getAttribute("reserList");%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>main</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mainpage.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage_basic.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/cafe-main.css">
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src ="<%=request.getContextPath()%>/resources/js/script.js"></script>

    </head>
    <body>
        <%@ include file = "../common/header.jsp" %>
        <% if(m !=null){ %>
        <main id="H_main">
            <div id="main_wrapper">
                <div id="imgFile">
                    <img src="" alt="">
                </div>
                <div id="mypage_nav">
                    <ul id="mypage_nav_main" class="page_nav">
                        <li><a href="<%=request.getContextPath() %>/basic.ys?">마이페이지</a></li>
                    </ul>
                    <ul id="mypage_nav_sub">
                        <li class="page_nav"><a href="<%=request.getContextPath() %>/scheduledReser.ys?userid=<%=m.getMuserId()%>">예약·결제 관리</a></li>
                        <li class="page_nav"><a href="./mypage-myplace.jsp">찜한 플레이스</a></li>
                        <li class="page_nav"><a href="./mypage-review.jsp">내가 쓴 게시글</a></li>
                        <br><br><br>
                        <li class="page_nav"><a href="./mypage-Member.Modification.jsp">회원 정보 수정</a></li>
                        
                        <li class="page_nav"><a href="./mypage-withdrawal.jsp">회원 탈퇴</a></li>
                    </ul>
                </div>
                
                <div id="showBox">
                    <table id="TTop">
                        <tr id="STop">
                            <div id="userInfo">
                                <tr>
                                    <td>
                                        <li><label id="userName" style="font-size: large; font-weight: 500;">Name : <%=m.getMuserName() %></label></li>     
                                        <li><label id="userId" style="font-size: 14px; color: gray;">Id : <%=m.getMuserId() %></label></li>
                                        <li><label id="phoneNum" style="font-size: 14px;"><%=m.getTel() %></label></li>                           
                                    </td>
                                </tr>
                                
                            </div>
                        </tr>
                    </table>

                    <table id="TBottom">
                        <tr>
                            <p class="looked_around_place">최근예약된 플레이스</p>
                        </tr>
                        <tr id="placeList1">
                        
                        
                          <tr class="place">
                          <% int i=0;
                        	for(ReservationMana rvm : reserList) {
                        	%>
                        	<% String[] himg = rvm.getReserHotelimg().split(","); %>
                          		<%if(i == 4){
                            		break;
                            	} %>
                              <td>
                                  <div class="list">
                                      <a href="#"><img src="<%=request.getContextPath()%>/resources/images/<%=himg[0] %>" alt="" width="200px"></a>
                                      <ul>
                                          <li>동반호텔</li>
                                          <li><%=rvm.getReserhotelname() %></li>
                                          <li><%=rvm.getReserDate() %></li>
                                      </ul>
                                  </div>
                                  
                              </td>
                              <%i++;
	                      	} %>
                          </tr>
	                      <tr class="place2">
	                         
	                          
	                      </tr>
	                      
                      	</tr>
                    </table>
                </div>
                
            </div>
            
            <% } else { 
		request.setAttribute("msg", "회원만 열람 가능합니다.");
		request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);
	 } %> 
            
        </main>
        <!-- TOP -->
        <div style="height: 20px; margin: 2px;"><a href="#header" id="top">▲ TOP</a></div>

	
		<%@ include file = "../common/footer.jsp" %>
            
    </body>
</html>