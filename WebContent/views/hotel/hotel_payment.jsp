<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.semiProject.Hotel.model.vo.*" %>
<% Hotel h = (Hotel)request.getAttribute("hd"); %>
<% HotelConvenience hc = (HotelConvenience)request.getAttribute("hc"); %>
<% HotelFacility hf = (HotelFacility)request.getAttribute("hf"); %>
<% HotelRoom hr = (HotelRoom)request.getAttribute("hr");%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>hotel_payment</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="/semi/resources/css/mainpage.css">
        <link rel="stylesheet" href="/semi/resources/css/hotel_payment.css">
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src ="/semi/resources/js/script.js"></script>
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

    </head>
    <body>
    	
    	
        <%@ include file = "../common/header.jsp" %>

        <!--------------------- main --------------------->
        <form id="kakao.jsp" method="get">
        <div class="main">
            <div class="mainimg">
                <h1 class="boldtext">결제하기</h1>
            </div>
            <div class="left-block">
                <div id="myreservation">
                    <div class="title">
                        <strong class="boldtext">내 예약 정보</strong>
                    </div>
                    <div class="checkinout">
                        <div class="checkin" >
                            <p class="normaltext" style="border-right: 3px solid white;">체크인</p>
                            <strong class="boldtext">2020년 8월 9일 (일)</strong>
                            <p class="normaltext"><%= hr.getRcheckin() %></p>
                        </div>
                        <div class="checkout">
                            <p class="normaltext">체크아웃</p>
                            <strong class="boldtext">2020년 9월 10일 (월)</strong>
                            <p class="normaltext"><%= hr.getRcheckout() %></p>
                        </div>
                    </div>
                    <p class="normaltext">총 숙박기간:</p>
                    <strong class="boldtext">1박</strong>
                    <hr style="color: orange;">
                    <strong class="boldtext">선택 객실:</strong>
                    <p class="normaltext"><%=hr.getRname() %></p>
                </div>
                <div class="price">
                    <div class="title">
                        <strong class="boldtext">결제 요금 내역</strong>
                    </div>
                    <div style="height: 20%;padding-right: 10px;">
                        <p class="normaltext"><%=hr.getRname() %></p>
                        <p class="normaltext left">&#8361;<%=hr.getRprice()%></p>
                        <p class="normaltext">10% 세금</p>
                        <p class="normaltext left">&#8361;<%=hr.getRprice()*0.1 %></p>
                    </div>

                    <div style="height: 40%; padding-right: 10px; background: rgb(255, 248, 230);;">
                        <p class="normaltext" style="font-size: 18px; ">금액</p>
                        <p class="normaltext left" style="font-size: 18px;">&#8361;<%=hr.getRprice()*0.1+hr.getRprice() %></p>
                        <hr>
                        <p class="normaltext">현지 통화로 검색</p>
                        <p class="normaltext left">&#8361;<%=hr.getRprice()*0.1+hr.getRprice() %></p>
                        <p class="normaltext" style="font-size: 12px; margin: 0;">KRW</p>
                        <p class="normaltext" style="color: gray;">(반려견 2마리)</p>
                    </div>

                    <div style="height: 12%; padding-right: 10px;">
                        <p class="normaltext" style="width: 90%;">
                            &#8361; 통화로 환산한 요금을 표시합니다. 환율은 금일 기준입니다.
                        </p>
                    </div>
                </div>
                <div id="refund">
                    <div class="title">
                        <strong class="boldtext">취소 위약금은 얼마인가요?</strong>
                    </div>
                    <strong class="boldtext">취소 시 수수료가 부가됩니다</strong>
                    <p style="float:right; margin-top:13px;margin-right:10px">&#8361;<%=hr.getRprice()*0.1 %></p>
                </div>
                <div id="include">
                    <div class="title">
                        <strong class="boldtext">예약 포함 사항</strong>
                    </div>
                    <p class="normaltext">무료 Wi-fi</p>
                    <p class="normaltext">무료 주차</p>
                </div>
                <div id="infoimportant">
                    <div class="title">
                        <strong class="boldtext">중요 정보</strong>
                    </div>
                    <p class="normaltext" style="font-size:12px; padding-right:10px;">
                        자정 이후에 도착 예정이신  경우 사전에 호텔로 연락하여 주시기 바랍니다. 
                        사전 고지 사항이 없을 경우 호텔에서 예약을 취소 할 수도 있습니다.
                    </p>
                </div>
            </div>    

            <div class="main-block">
                <div id="hotel-info">
                    <div id="hotelimg"><img src="<%= h.gethImg() %>" alt=""></div>
                    <div id="hoteltext">
                        <div class="hotelname"><%=h.gethName() %></div>
                        <div style="float: right;background:navy;width: 70px; height:50px;">
                            <p style="font-size: 16px; color: rgb(255, 240, 197); font-weight: bold;margin-top: 16px;">평점<%=h.gethScore() %></p>
                        </div>
                        <div style="float: right;border: 25px solid navy;border-left:25px solid white;width: 50px; height:50px;"></div>
                        <div class="grade">
                            <span style="font-size: 18px;"><%= h.gethGrade() %>성급</span> 
                            <div class="facility">무료주차</div>
                            <div class="facility">흡연가능</div>
                        </div>
                        <div class="address"><img src="/semi/resources/images/icons/location.png" width="20px" alt="깃발표시"><%= h.gethAddress() %></div>
                    </div>
                </div>
                <div id="textblock">상세 정보를 입력해 주십시오.</div>
                <div id="client-input">
                    <div class="travltype">
                        <span>여행 목적 선택하기</span><br>
                        <label for="totrable"> <input type="radio" name="fortravel" id="totrable"> 여행 및 관광</label>
                        <label for="tobusiness"> <input type="radio" name="forbusiness" id="tobusiness"> 출장 및 비지니스</label>
                    </div>
                    <div class="personaldata">
                        <div class="name">
                            <div class="firstname" style="float: left;">
                                <p>성을 입력하세요</p>
                                <input type="text" name="firstname" id="">
                            </div>
                            <div class="lastname">
                                <p>이름을 입력하세요</p>
                                <input type="text" name="lastname" id="">
                            </div>
                        </div>
                        <div class="email">
                            <div class="input-email">
                                <p>이메일 주소</p>  
                                <input type="email" name="email" id="email">
                            </div>
                            <div class="input-email">
                                <p>이메일 주소 확인</p>  
                                <input type="email" name="emailcheck" id="emailchk">
                            </div>
                        </div>
                        <div class="forwho">
                                <span>본인을 위한 예약인가요?</span><br>
                                <label for="me"> <input type="radio" name="forme" id="me"> 대표 투숙객: 본인</label><br>
                                <label for="other"> <input type="radio" name="forother" id="other"> 다른 사람을 대신하여 예약함</label>
                        </div>
                        <hr>
                        <div class="sub-block">
                            <span id="roomtype"><%=hr.getRname() %> - 서울의 대부분의 객실보다 넓음</span>
                            <p id="price"> &#8361;180,400</p><p id="day">(1박)</p>
                            <p><a href="">환불 불가</a></p>
                            <div class="facility-box">
                                <div class="facility"><img src="/semi/resources/images/icons/cityview.png" alt=""> <span>도시 전망</span></div>
                                <div class="facility"><img src="/semi/resources/images/icons/air-conditioner.png" alt=""><span>에어컨</span></div>
                                <div class="facility"><img src="/semi/resources/images/icons/bathroom.png" alt=""><span>전용 욕실</span></div>
                                <div class="facility"><img src="/semi/resources/images/icons/mute.png" alt=""><span>방음 시설</span></div>
                            </div>
                            <div class="headcount">
                                투숙객: <input class="inputbox" style="width: 40px;" type="number" name="" min="1" max="20">
                            </div>
                            <div class="clientname">
                                <p>투숙객 성명</p>
                                <input class="inputbox" type="text" name="fullname" id="fullname">
                            </div>
                        </div>
                    </div>

                </div>
                <div id="textblock">숙소에 질문하기</div>
                <div id="question">
                    <strong class="boldtext" style="font-size: 18px; height: 10px; width: 100%;">별도 요청 사항</strong>
                    <p class="normaltext" style="width: 100%; padding-left:0;margin-bottom: 10px;">
                        별도  요청사항 제공을 보장해드리기 어렵습니다만, 숙소 측에서 최선을 다해 준비하겠습니다. <br>
                        예약 후에고 별도 요청사항을 보내실 수 있어요!    
                    </p>
                    <textarea name="guestRequest" id="" cols="50" rows="6"></textarea>
                    <div>
                        <input type="checkbox"  name="" id="" style="float: left;margin-top: 3px;margin-right: 5px; ">
                        <p class="normaltext" style="margin-top: 0px; padding-left: 5px;">조용한 객실을 원합니다.</p>
                    </div>
                    <strong class="boldtext">숙소측에 체크인 예정 시간을 알려주세요(선택입력)</strong>
                    <p class="normaltext">체크인 시간에 관해 숙소로부터 답변이 올 수 있습니다.</p>
                    <div style="width: 100%; height: 30px;">
                        <strong class="boldtext inlinetext" style="margin-bottom: 9px;" >24시간 프론트 데스크 - </strong>
                        <p class="normaltext inlinetext" > 언제나 도움을 받으실 수 있어요!</p>
                        <strong class="boldtext inlinetext" style="margin-bottom: 9px;" > 체크인 가능 시간은 14:00 ~ 24:00</strong>
                        <p class="normaltext inlinetext " >입니다.</p>
                    </div>
                    
                    <p class="boldtext inlinetext">도착시간 : </p>
                    <p class="boldtext inlinetext"> 2020년 8월 9일 일요일</p>
                    <select name="checkintime" id="checkintime" >
                        <option value="14:00 ~ 15:00" selected>14:00 ~ 15:00</option>
                        <option value="15:00 ~ 16:00">15:00 ~ 16:00</option>
                        <option value="16:00 ~ 17:00">16:00 ~ 17:00</option>
                        <option value="17:00 ~ 18:00">17:00 ~ 18:00</option>
                        <option value="18:00 ~ 19:00">18:00 ~ 19:00</option>
                        <option value="19:00 ~ 20:00">19:00 ~ 20:00</option>
                        <option value="20:00 ~ 21:00">20:00 ~ 21:00</option>
                        <option value="21:00 ~ 22:00">21:00 ~ 22:00</option>
                        <option value="22:00 ~ 23:00">22:00 ~ 23:00</option>
                        <option value="23:00 ~ 24:00">23:00 ~ 24:00</option>
                    </select>
	
                </div>
                <div id="btn-block">
                    <input type="button" id="test1" value="결제 하기">
                    <p>예약 완료시 주소로 예약 확인서가 바로 전송됩니다. </p>
                </div>
                
                
                <!-- <script>
                	
                    $('#test1').click(function(){
                        $('#fm1').attr('action','/semi/hotel_finishedReservation.jsp').submit();
                    });
                </script> -->

            </div>

        </div>
        

          </form>
        <!--------------------- main 끝 --------------------->
        
        <%@ include file = "../common/footer.jsp" %>
       
<script>
	$('#test1').click(function(){
		IMP.init('imp30525532');
		
		IMP.request_pay({
		    pg : 'inicis',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '<%=hr.getRname()%>',
		    amount : <%=hr.getRprice()*0.1+hr.getRprice()%>, 
		    buyer_email : 'kkkkk',
		    buyer_name : $('#fullname').val(),
		    
		    buyer_tel : '010-1234-5678',

		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        console.log(buyer_name);
		        location.href='/semi/view/reservationfinished.ys?hno=<%=h.gethNo()%>&hroom=<%=hr.getRname()%>'
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	});
	
</script>
        
        
    </body>
</html>