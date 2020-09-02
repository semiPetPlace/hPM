<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import= "java.text.*,com.kh.semiProject.Manager.model.vo.*, java.util.*"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관리자 메인 화면</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Manager_sells_C_detail.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Manager-DefaultCSS.css">
</head>
<body>
    <%@ include file = "./Manager_header.jsp" %>
<main id="main">
    <div id="main-wrapper">
        <div class="main-content">
            <div class="sub-menu">
                <div class="sub-list">
                    <p>예약.결제관리</p>
                    <ul>
                        <li><a href="">· 호텔별 매출 상세</a></li>
                        <li><a href="">· 고객별 매출 상세</a></li>
                    </ul>
                </div>
            </div>
            <div class="content">
                <div class="reservationTable">
                    <p style="font-size: 30px; font-weight: 500px; margin-bottom: 10px;">회원별 매출 상세</p>
                    <div class="searchPot"> </div>
                    <div class="filter-block">
                        <select name="filter" id="filter">
                            <option value="hotel">회원 명</option>
                            <option value="hotelnum">회원 번호</option>
                            <option value="hoteltype">예약 횟수</option>
                            <option value="location">취소 횟수</option>
                        </select>
                    </div>

                    <div class="reservationList">
                        <table class="detailedTable">
                            <th class="listTitle" id="userNo" >회원 번호</th>
                            <th class="listTitle" id="userName">회원 명</th>
                            <th class="listTitle" id="reserCount">예약 횟수</th>
                            <th class="listTitle" id="cancelCount">취소 횟수</th>
                            <th class="listTitle" id="totalPay">총 결제 금액</th>
                            <th class="listTitle" id="avgPay">평균 결제 금액</th>
                            <th class="listTitle" id="reserByY">연간 이용(회)</th>
                            <th class="listTitle" id="joinDate">회원가입일</th>
                            <th class="listTitle" id="status">회원 상태</th>

                            <tr class="listCal">
                                <td>1</td>
                                <td>김민우</td>
                                <td>4</td>
                                <td>0</td>
                                <td>1014800원</td>
                                <td>253300</td>
                                <td>2</td>
                                <td>2019-04-11</td>
                                <td>normal</td>
                            </tr>
                            <tr class="listCal">
                                <td>2</td>
                                <td>김혜주</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                            </tr>
                            <tr class="listCal">
                                <td>3</td>
                                <td>정택환</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                            </tr>
                            <tr class="listCal">
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                            </tr>
                            <tr class="listCal">
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                            </tr>
                             <tr class="listCal">
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                            </tr>
                            <tr class="listCal">
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                            </tr>
                            <tr class="listCal">
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                                <td>1</td>
                            </tr>
                            
                            
                        </table>
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
        <p style="color: rgb(131, 131, 131);">Copyright © 1998-2020 KH Information Educational Institute All Right Reserved</p>
    </div>
</footer>
</body>
</html>