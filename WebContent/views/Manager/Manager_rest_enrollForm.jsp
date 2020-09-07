<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semiProject.restaurant.model.vo.*"%>
<%
	Restaurant r = (Restaurant)request.getAttribute("Restaurant");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관리자 메인 화면</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Manager-DefaultCSS.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Manager-company-enrollForm.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <style>
    	#main{
    	height: 1800px;
    	}
    	textarea {
    	width:400px;
    	height: 50px;
    	overflow:visible;
    	margin-bottom:5px;
    	}
    </style>
</head>
<body>
        <%@ include file = "./Manager_header.jsp" %>  
<main id="main">
    <div id="main-wrapper">
        <div class="main-content">
            <div class="sub-menu">
                <div class="sub-list">
                    <p>업체 관리</p>
                    <ul>
                        <li><a href="/semi/hList.hj">· 동반 호텔 리스트</a></li>
                        <li><a href="/semi/phList.hj">· 위탁 호텔 리스트</a></li>
                        <li><a href="/semi/cList.hj">· 동반 카페 리스트</a></li>
                        <li><a href="/semi/rList.hj">· 동반 식당 리스트</a></li>
                    </ul>
                </div>
            </div>
             <!-- 여기에 메인 컨텐츠 넣으면 됩니다. -->    
            <div class="content">
                <div class="reservationTable">
                    <p style="font-size: 30px; font-weight: 500px; margin-bottom: 10px;">동반 식당 등록</p>
                    <div class="searchPot"></div>
                    <div class="enrollCom">
                   		<form id="erollForm" action="${pageContext.request.contextPath}/rEnroll.hj" method="post" enctype="multipart/form-data">
	                        <table border="1"  id="insertTable">
	                            <tr>
	                                <th></th>
	                            </tr>
	                            <tr>
	                                <th>카페 명</th>
	                                <td>
	                                    <input type="text" name="rname" id="rname" placeholder="업체명" required="required" autofocus>
	                                </td>
	                            </tr>
								<tr>
									<th>주소지</th>
									<td>
                                        <input type="text" id="zipCode" name="zipCode" placeholder="우편번호">
                                        <input type="button" id="ckZip" onclick="addrSearch();" value="검색">
                                    </td>
								</tr>
								<tr>
                                    <th></th>
									<td>
                                        <input type="text" id="address1" name="address1" placeholder="주소" required="required">
                                    </td>
								</tr>
								<tr>
                                    <th></th>
                                    <td>
                                        <input type="text" id="address2" name="address2" placeholder="상세주소" required="required">
                                    </td>
								</tr>
								<tr>
	                                <th>연락처</th>
	                                <td>
	                                    <input type="text" maxlength="4" name="num1" id="num1" required="required">-
	                                    <input type="text" maxlength="4" name="num2" id="num2" required="required">-
	                                    <input type="text" maxlength="4" name="num3" id="num3" required="required">
	                                </td>
	                            </tr>
	                            <tr>
	                                <th style="vertical-align:top;">홍보글</th>
	                                <td>
	                                    <textarea name="rpromotion" id="rpromotion" placeholder="업체 홍보글 입력 칸 입니다."></textarea>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th style="vertical-align:top;">요청사항</th>
	                                <td>
	                                    <textarea name="rrequest" id="rrequest" placeholder="업체 요청사항 입력 칸 입니다."></textarea>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th style="vertical-align:top;">영업시간</th>
	                                <td>
	                                    <textarea name="rtime" id="rtime" placeholder="업체 영업 시간 입력 칸 입니다."></textarea>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th style="vertical-align:top;">반려견 동반 정보</th>
	                                <td>
	                                    <textarea name="rdogCompInfo" id="rdogCompInfo" placeholder="반려견 동반 정보 입력 칸 입니다."></textarea>
	                                </td>
	                            </tr>
	                            <tr>
									<th>반려견 사이즈</th>
									<td>
										<select name="rpetSize" id="rpetSize">
											<option value="S" selected>S</option>
											<option value="M">M</option>
											<option value="L">L</option>
										</select>
									</td>
								</tr>
	                            <tr>
	                                <th>식당 대표 이미지</th>
	                                 <td style="padding:10px 0;">
										<input type="file" name="rrimage"/><br>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>상세이미지</th>
	                                 <td style="padding:10px 0;">
										<input type="file" name="rimage"/><br>
										<input type="file" name="rimage1"/><br>
										<input type="file" name="rimage2"/><br>
										<input type="file" name="rimage3"/><br>
										<input type="file" name="rimage4"/><br>
										<input type="file" name="rimage5"/><br>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>위도</th>
	                                <td>
	                                    <input type="text" maxlength="20" name="lat" id="lat">
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>경도</th>
	                                <td>
	                                    <input type="text" maxlength="20" name="lng" id="lng">
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>등록 일</th>
	                                <td>
	                                    <input type="date" name="rregisterDate" id="rregisterDate" style="margin:5px auto;">
	                                </td>
	                            </tr>
	                            <tr>
									<th>등록 여부</th>
									<td>
										<select name="rregistration" id="rregistration">
											<option value="Y" selected>Y</option>
											<option value="N">N</option>
										</select>
									</td>
								</tr>
	                        </table>
		                    <div class="empty">
		                        <br><br><br>
		                    </div>
		                    <div class="btns">
		                        <input type="button" value="이전 메뉴로" class="preBtn" onclick="history.back(-1);">
		                        <input type="submit" value="등록 완료" class="subBtn" onclick="enrollCompany();">
		                    </div>
						</form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
    /* var cnt = 1; */
    
	    function enrollCompany() {
			alert('등록이 완료되었습니다. ');
			/* $("#enrollForm").submit(); */
			$("#enrollForm").attr("action","<%= request.getContextPath()%>/rEnroll.hj");
		}
        
       /*  function addimg(){
            var inputFile = "<br><input type=\"file\" name=\"hImg"+cnt+"\"/>";

          //input type="file" 로 동적 태그생성
            document.getElementById('fileForm').innerHTML += inputFile;
            cnt++;

        } */
    
	    function addrSearch() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = ''; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수
	
	                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    fullAddr = data.roadAddress;
	
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    fullAddr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	                if(data.userSelectedType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                $('#zipCode').val(data.zonecode); //5자리 새우편번호 사용
	                
	                $('#address1').val(fullAddr);
	
	                // 커서를 상세주소 필드로 이동한다.
	                $('#address2').focus();
	            }
	        }).open();
	    };
    </script>
</main>
    <%@ include file = "./Manager_footer.jsp" %>
</body>
</html>