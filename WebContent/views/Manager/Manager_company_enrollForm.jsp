<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>관리자 메인 화면</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Manager-DefaultCSS.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Manager-company-enrollForm.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
                        <li><a href="/semi/cList.co">· 전체 업체 목록</a></li>
                        <li><a href="/semi/views/Manager/Manager_company_enrollForm.jsp">· 업체 등록</a></li>
                    </ul>
                </div>
            </div>
             <!-- 여기에 메인 컨텐츠 넣으면 됩니다. -->    
            <div class="content">
                <div class="reservationTable">
                    <p style="font-size: 30px; font-weight: 500px; margin-bottom: 10px;">업체 등록</p>
                    <div class="searchPot"></div>
                    <div class="enrollCom">
                   		<form id="erollForm" action="${pageContext.request.contextPath}/cEnroll.co" method="post">
	                        <table border="1">
	                        	<tr>
	                        		<th></th>
	                        	</tr>
	                        	<tr>
	                        		<th></th>
	                        	</tr>
	                            <tr>
	                                <th>업체 분류</th>
	                                <td>
	                                    <select name="category" id="category">
                                            <option value="">--선택--</option>
                                            <option value="위탁호텔">위탁호텔</option>
                                            <option value="동반호텔">동반호텔</option>
                                            <option value="동반카페">동반카페</option>
                                            <option value="동반식당">동반식당</option>
                                        </select>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>사업자번호</th>
	                                <td>
	                                    <input type="text" maxlength="3" name="num1" id="num1" required="required">-
	                                    <input type="text" maxlength="2" name="num2" id="num2" required="required">-
	                                    <input type="text" maxlength="5" name="num3" id="num3" required="required">
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>기업 형태</th>
	                                <td>
	                                    <select name="corp" id="corp">
                                            <option value="">--선택--</option>
                                            <option value="법인">법인</option>
                                            <option value="개인">개인</option>
                                        </select>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>업체 명</th>
	                                <td>
	                                    <input type="text" name="cName" id="cName" required="required">
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>업체 등록 일</th>
	                                <td>
	                                    <input type="date" name="enrollDate" id="enrollDate">
	                                </td>
	                            </tr>
								<tr>
									<th>업체 주소</th>
									<td>
                                        <input type="text" id="zipCode" name="zipCode" placeholder="우편번호">
                                        <input type="button" id="ckZip" onclick="addrSearch();" value="검색">
                                    </td>
								</tr>
								<tr>
                                    <th></th>
									<td>
                                        <input type="text" id="address1" name="address1" placeholder="주소">
                                    </td>
								</tr>
								<tr>
                                    <th></th>
                                    <td>
                                        <input type="text" id="address2" name="address2" placeholder="상세주소">
                                    </td>
								</tr>
								<tr>
	                                <th>업체 연락처</th>
	                                <td>
	                                    <input type="text" maxlength="4" name="pNum1" id="pNum1">-
	                                    <input type="text" maxlength="4" name="pNum2" id="pNum2">-
	                                    <input type="text" maxlength="4" name="pNum3" id="pNum3">
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>대표자</th>
	                                <td>
	                                    <input type="text" maxlength="5" name="rName1" id="rName1">
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>담당자</th>
	                                <td>
	                                    <input type="text" maxlength="5" name="rName2" id="rName2">
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>담당자 연락처</th>
	                                <td>
	                                    <input type="text" maxlength="3" name="conNum1" id="conNum1">-
	                                    <input type="text" maxlength="4" name="conNum2" id="conNum2">-
	                                    <input type="text" maxlength="4" name="conNum3" id="conNum3">
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>담당자 이메일</th>
	                                <td>
	                                    <input type="email" name="email" id="email">
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>은행명</th>
	                                <td>
	                                    <input type="text" name="bankName" id="bankName">
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>예금주</th>
	                                <td>
	                                    <input type="text" name="holder" id="holder">
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>계좌번호</th>
	                                <td>
	                                    <input type="text" maxlength="14" name="account" id="account">
	                                </td>
	                            </tr>
	                            <tr>
									<th>등록 상태</th>
									<td>
										<select name="state" id="state">
											<option value="Y" selected>Y</option>
											<option value="N">N</option>
										</select>
									</td>
								</tr>
	     						<tr>
	                        		<th></th>
	                        	</tr>
	                        	<tr>
	                        		<th></th>
	                        	</tr>
	                        </table>
		                    <div class="empty">
		                        <br><br><br>
		                    </div>
		                    <div class="btns">
		                        <input type="button" value="이전 메뉴로" class="preBtn" onclick="history.back(-1);">
		                        <input type="submit" value="등록 완료" class="subBtn" onclick="enrollCompany();">
		                        <!-- <input type="button" value="업체 삭제" class="deleteBtn" onclick="alert('해당 업체 삭제가 완료되었습니다. ')"> -->
		                    </div>
						</form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
	    function enrollCompany() {
			alert('업체 등록이 완료되었습니다. ');
			/* $("#enrollForm").submit(); */
			$("#enrollForm").attr("action","<%= request.getContextPath()%>/cEnroll.co");
		}
    
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