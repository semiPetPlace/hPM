<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import= "java.text.*,com.kh.semiProject.Manager.model.vo.*, java.util.*"%>
<%	Manager ma = (Manager)request.getAttribute("ma"); %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>관리자 메인 화면</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Manager-DefaultCSS.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Manager-main.css">
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!-- 부트스트랩 -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <!-- 차트 링크 -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>
<body>
<%@ include file = "./Manager_header.jsp" %>
<%! 	Calendar cal = Calendar.getInstance();
		SimpleDateFormat daily = new SimpleDateFormat("MM/dd");
		SimpleDateFormat montly = new SimpleDateFormat("yy/MM");
		%>
		<%! String[] days = new String[12];
			String[] month = new String[12];%>
		<% for (int i = 0; i < days.length; i++) {
			cal.add(cal.DATE, -1);
			days[i]=daily.format(cal.getTime());
			}
			for (int i = 0; i < month.length; i++) {
				cal.add(cal.MONTH, -1);
				month[i]=montly.format(cal.getTime());
			}
		%>
	

<main id="main">
    <div id="main-wrapper">
        <div class="main-content">
            <div class="sub-menu">
                <div class="sub-list">
                    <p>관리자 메인</p>
                    <ul>
                        <li><a href="">· 메인 화면</a></li>
                        <li><a href="">· 메인 화면</a></li>
                    </ul>
                </div>
            </div>
            <div class="content">
                <div class="statistics">

                    <div class="sales_trend graph-box">
                        <div class="sales_name">
                            <label class="t1">DAILY</label>
                            <label class="t2">매출 분석</label>
                            <label class="t3">(단위 : 천원)</label>
                            
                            <div class="container" style="padding-left:0;">
                                  <canvas class="dailyChart"></canvas>
                            </div>
                            <script>
                                const dVisitor = [264, 259, 249, 262, 250, 280, 250,260,276,290,301,220]; 
                                const dSells = [<%= ma.getDaily()[11]%>, <%= ma.getDaily()[10]%>,<%= ma.getDaily()[9]%>,
			                                	<%= ma.getDaily()[8]%>,<%= ma.getDaily()[7]%>,<%= ma.getDaily()[6]%>,
			                                	<%= ma.getDaily()[5]%>,<%= ma.getDaily()[4]%>,<%= ma.getDaily()[3]%>,
			                                	<%= ma.getDaily()[2]%>,<%= ma.getDaily()[1]%>,<%= ma.getDaily()[0]%>];
                                var ctx = document.getElementById("dailyChart"); var ctx = document.getElementsByClassName("dailyChart"); 
                                var mixedChart = { type: 'bar', 
                                                   labels: ['<%=days[11]%>',
	                                                	   '<%=days[10]%>',
	                                                	   '<%=days[9]%>',
	                                                	   '<%=days[8]%>',
	                                                	   '<%=days[7]%>',
	                                                	   '<%=days[6]%>',
	                                                	   '<%=days[5]%>',
	                                                	   '<%=days[4]%>',
	                                                	   '<%=days[3]%>',
	                                                	   '<%=days[2]%>',
	                                                	   '<%=days[1]%>',
	                                                	   '<%=days[0]%>',], 
                                                   datasets : [ { label: '일 매출(천원)',
                                                                  data : dSells, backgroundColor: 'rgb(30, 52, 78, 0.8)' },
                                                                   { label: '방문자(명)',
                                                                    data: dVisitor, backgroundColor: 'transparent',
                                                                     borderColor: 'hotpink', type: 'line' } ] }; 
                                var dailyChart = new Chart(ctx, { type: 'bar', 
                                                               data: mixedChart, 
                                                               options: { legend: { display: true } } }); // var dailyChart = new Chart(ctx, { // type: 'bar', // data: mixedChart, // options: { // legend: { // display: true // } // } // }); 
                            </script>
                        </div>
                        <div class="more_details">
                            <a href="">> 더보기</a>
                        </div>
                    </div>

                    <div class="graph-box">
                        <div class="sales_name">
                            <label class="t1">MONTHlY</label>
                            <label class="t2">매출 분석</label>
                            <label class="t3">(단위 : 천원)</label>
                            
                            <div class="container" style="padding-left:0;">
                                <canvas class="montlyChart"></canvas>
                          </div>
                          <script>
                              const mVisitor = [264, 259, 249, 262, 257, 282, 253,261,270,290,300,290]; 
                              const mSells = [<%= ma.getMontly()[11]%>, <%= ma.getMontly()[10]%>,<%= ma.getMontly()[9]%>,
				                              <%= ma.getMontly()[8]%>,<%= ma.getMontly()[7]%>,<%= ma.getMontly()[6]%>,
				                              <%= ma.getMontly()[5]%>,<%= ma.getMontly()[4]%>,<%= ma.getMontly()[3]%>,
				                              <%= ma.getMontly()[2]%>,<%= ma.getMontly()[1]%>,<%= ma.getMontly()[0]%>];
                              var ctx = document.getElementById("montlyChart"); var ctx = document.getElementsByClassName("montlyChart"); 
                              var mixedChart1 = { type: 'bar', 
                            		  labels: ['<%=month[11]%>',
		                                   	   '<%=month[10]%>',
		                                	   '<%=month[9]%>',
		                                	   '<%=month[8]%>',
		                                	   '<%=month[7]%>',
		                                	   '<%=month[6]%>',
		                                	   '<%=month[5]%>',
		                                	   '<%=month[4]%>',
		                                	   '<%=month[3]%>',
		                                	   '<%=month[2]%>',
		                                	   '<%=month[1]%>',
		                                	   '<%=month[0]%>',], 
                                                 datasets : [ { label: '일 매출(천원)',
                                                                data : mSells, backgroundColor: 'rgb(30, 52, 78, 0.8)' },
                                                                 { label: '방문자(명)',
                                                                  data: mVisitor, backgroundColor: 'transparent',
                                                                   borderColor: 'hotpink', type: 'line' } ] }; 
                              var montlyChart = new Chart(ctx, { type: 'bar', 
                                                             data: mixedChart1, 
                                                             options: { legend: { display: true } } }); 
                          </script>
                        </div>
                        <div class="more_details">
                            <a href="">> 더보기</a>
                        </div>
                    </div>

                </div>
                <div class="current_situation ">
                    <div class="situation_box">
                        <div class="tables">
                            <table>
                                <tr>
                                    <td class="sb_lb">올해 매출</td>
                                    <td class="count"><%= ma.getSaleY() %>천원</td>
                                </tr>
                                <tr>
                                    <td class="sb_lb">이 달의 매출</td>
                                    <td class="count"><%= ma.getSaleM() %>천원</td>
                                </tr>
                             
                            </table>
                        </div>
                        <div class="tables">
                            <table>
                                <tr>
                                    <td class="sb_lb">올해 예약</td>
                                    <td class="count"><%= ma.getReservationY() %></td>
                                </tr>
                                <tr>
                                    <td class="sb_lb">이달의 예약</td>
                                    <td class="count"><%= ma.getReservationM() %>건</td>
                                </tr>
                                <tr>
                                    <td class="sb_lb"></td>
                                    <td class="count"></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tables">
                            <table>
                                <tr>
                                    <td class="sb_lb">총 회원</td>
                                    <td class="count"><%= ma.getMembercount() %>명</td>
                                </tr>
                                <tr>
                                    <td class="sb_lb">이달의 회원 가입</td>
                                    <td class="count"><%= ma.getMembercount() %>명</td>
                                </tr>
                              
                            </table>
                        </div>
                    </div>

                </div>
            </div>
                <div class="empty">
                <br><br><br>
                </div>
        </div>
    </div>
</main>
<footer id="footer">
    <div id="foot">
        <p style="color: rgb(131, 131, 131);">Copyright © 1998-2020 KH Information Educational Institute All Right Reserved</p>
    </div>
</footer>
</body>
</html>