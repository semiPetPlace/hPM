<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.semiProject.Hotel.model.vo.*"%>
<%
	Hotel h = (Hotel)request.getAttribute("hotel");
	HotelConvenience hc = (HotelConvenience)request.getAttribute("hotelConvenience");
	HotelRoom hr = (HotelRoom)request.getAttribute("hotelRoom");
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
                        <li><a href="/semi/hList.hj">· 위탁 호텔 리스트</a></li>
                        <li><a href="/semi/phList.hj">· 동반 호텔 리스트</a></li>
                        <li><a href="/semi/cList.hj">· 동반 카페 리스트</a></li>
                        <li><a href="/semi/rList.hj">· 동반 식당 리스트</a></li>
                    </ul>
                </div>
            </div>
             <!-- 여기에 메인 컨텐츠 넣으면 됩니다. -->    
            <div class="content">
                <div class="reservationTable">
                    <p style="font-size: 30px; font-weight: 500px; margin-bottom: 10px;">호텔 등록</p>
                    <div class="searchPot"></div>
                    <div class="enrollCom">
                   		<form id="erollForm" action="${pageContext.request.contextPath}/hEnroll.hj" method="post" enctype="multipart/form-data">
	                        <table border="1"  id="insertTable">
	                            <tr>
	                                <th></th>
	                            </tr>
	                            <tr>
	                                <th>호텔 명</th>
	                                <td>
	                                    <input type="text" name="hName" id="hName" placeholder="호텔명" required="required" autofocus>
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
	                                <th>등급 (1~5)</th>
	                                <td>
	                                    <input type="text" name="hGrade" id="hGrade" min="1" max="5" maxlength="1" required="required" style="width: 50px;">
	                                </td>
	                            </tr>
	                            <tr>
	                                <th style="vertical-align:top;">홍보글</th>
	                                <td>
	                                    <textarea name="hPromotion" id="hPromotion" placeholder="업체 홍보글 입력 칸 입니다."></textarea>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th style="vertical-align:top;">요청사항</th>
	                                <td>
	                                    <textarea name="hRequests" id="hRequests" placeholder="업체 요청사항 입력 칸 입니다."></textarea>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>호텔 최저가</th>
	                                <td>
	                                    <input type="text" maxlength="10" name="hPrice" id="hPrice" placeholder="ex) 50000" required="required">
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>호텔 이미지</th>
	                                 <td style="padding:10px 0;">
										<input type="file" name="hImg"/><br>
										<input type="file" name="hImg1"/><br>
										<input type="file" name="hImg2"/><br>
										<input type="file" name="hImg3"/><br>
										<input type="file" name="hImg4"/><br>
										<input type="file" name="hImg5"/><br>
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
	                                <th>부가시설</th>
	                                <td>
	                                <div class="facility" style="border: 1px solid black; padding:3px; margin-top:10px; margin-bottom:10px; width:650px; font-weight: 200; font-size: small;">
		                                <div class="filter1"><input type="checkbox" id='1' name="filter" value="24시프론트"/> 24시 프론트 
					                    <input type="checkbox" id='2' name="filter" value="주차장"/> 주차장
					                    <input type="checkbox" id='3' name="filter" value="레스토랑"/> 레스토랑
					                    <input type="checkbox" id='4' name="filter" value="룸서비스"/> 룸 서비스
					                    <input type="checkbox" id='5' name="filter" value="피트니스센터"/> 피트니스 센터
					                    <input type="checkbox" id='6' name="filter" value="금연실"/> 금연실 
					                    <input type="checkbox" id='7' name="filter" value="공항셔틀버스"/> 공항 셔틀버스</div>
					                    <div class="filter2"><input type="checkbox" id='8' name="filter" value="장애인편의시설"/> 장애인 편의시설
					                    <input type="checkbox" id='9' name="filter" value="방음"/> 방음 
					                    <input type="checkbox" id='10' name="filter" value="가족실"/> 가족실
					                    <input type="checkbox" id='11' name="filter" value="스파"/> 스파 
					                    <input type="checkbox" id='12' name="filter" value="사우나"/> 사우나
					                    <input type="checkbox" id='13' name="filter" value="와이파이"/> 와이파이
					                    <input type="checkbox" id='14' name="filter" value="전기차충전소"/> 전기차 충전소 
					                    <input type="checkbox" id='15' name="filter" value="수영장"/> 수영장</div> 
					                    <div class="filter3"><input type="checkbox" id='16' name="filter" value="간이주방"/> 간이 주방
					                    <input type="checkbox" id='17' name="filter" value="욕실"/> 욕실  
					                    <input type="checkbox" id='18' name="filter" value="TV"/> TV 
					                    <input type="checkbox" id='19' name="filter" value="세탁"/> 세탁 
					                    <input type="checkbox" id='20' name="filter" value="전기포트"/> 전기포트 
					                    <input type="checkbox" id='21' name="filter" value="커피머신"/> 커피머신 
					                    <input type="checkbox" id='22' name="filter" value="루프탑"/> 루프탑 
					                    <input type="checkbox" id='23' name="filter" value="에어컨"/> 에어컨 
					                    <input type="checkbox" id='24' name="filter" value="테라스"/> 테라스
					                    <input type="checkbox" id='25' name="filter" value="발코니"/> 발코니</div>
					                </div>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>등록 일</th>
	                                <td>
	                                    <input type="date" name="hRegisterData" id="hRegisterData" style="margin:5px auto;">
	                                </td>
	                            </tr>
	                            <tr>
									<th>등록 여부</th>
									<td>
										<select name="hRegistration" id="hRegistration">
											<option value="Y" selected>Y</option>
											<option value="N">N</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>편의성</th>
									<td><span style="margin-right:80px; font-weight:400;font-size:smaller;">대중교통으로 거리</span>
										<select name="tansport" id="tansport">
											<option value="">--</option>
											<option value="대중교통(100미터이내)">100미터이내</option>
											<option value="대중교통(300미터이내)">300미터이내</option>
											<option value="대중교통(500미터이내)">500미터이내</option>
											<option value="대중교통(1000미터이내)">1000미터이내</option>
										</select>
									</td>
								</tr>
								<tr>
									<th></th>
									<td><span style="margin-right:20px; font-weight:400;font-size:smaller;">공항 이동 교통편 서비스 여부</span>
										<select name="airport" id="airport">
											<option value="Y">Y</option>
											<option value="N">N</option>
										</select>
									</td>
								</tr>
								<tr>
									<th></th>
									<td><span style="margin-right:157px; font-weight:400;font-size:smaller;">위치</span>
										<select name="location" id="location" required="required">
											<option value="">---</option>
											<option value="수도권 중심에 위치">수도권 중심에 위치</option>
											<option value="공항 주변에 위치">공항 주변에 위치</option>
											<option value="관광지 주변에 위치">관광지 주변에 위치</option>
											<option value="바닷가 주변에 위치">바닷가 주변에 위치</option>
											<option value="산 주변에 위치">산 주변에 위치</option>
										</select>
									</td>
								</tr>
								<tr>
									<th></th>
									<td><span style="margin-right:97px; font-weight:400;font-size:smaller;">무료 Wi-fi 여부</span>
										<select name="wifi" id="wifi">
											<option value="Y">Y</option>
											<option value="N">N</option>
										</select>
									</td>
								</tr>
								<tr>
									<th></th>
									<td><span style="margin-right:100px; font-weight:400;font-size:smaller;">온수 욕조 여부</span>
										<select name="tub" id="tub">
											<option value="Y">Y</option>
											<option value="N">N</option>
										</select>
									</td>
								</tr>
								<tr></tr>
								<tr></tr>
								<tr>
									<th style="border-top: 2px solid #7A9BAD; margin: 20px;"></th>
								</tr>
								<tr>
									<th>* 객실 - 1</th>
								</tr>
								<tr></tr>
								<tr>
									<th>객실 명</th>
									<td>
										<select name="rname1" id="rname1" required="required">
											<option value="슈페리어">슈페리어룸</option>
											<option value="스위트">스위트룸</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>객실 금액</th>
									<td>
										<input type="text" name="rprice1" id="rprice1" maxlength="10" min="10000"required="required">
									</td>
								</tr>
								<tr>
									<th>객실 욕조 여부</th>
									<td>
										<select name="rtub1" id="rtub1">
											<option value="Y">Y</option>
											<option value="N" selected>N</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>침대 타입</th>
									<td>
										<select name="rbadtype1" id="rbadtype1">
											<option value="1" selected>1</option>
											<option value="2" >2</option>
											<option value="3" >3</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>전망</th>
									<td>
										<select name="rview1" id="rview1">
											<option value="시티뷰">시티뷰</option>
											<option value="오션뷰">오션뷰</option>
											<option value="마운틴뷰">마운틴뷰</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>객실 사이즈(m2)</th>
									<td>
										<input type="text" name="rsize1" id="rsize1" maxlength="4" style="width: 50px;">
									</td>
								</tr>
								<tr>
									<th>객실 이미지</th>
									<td>
										<input type="file" name="rimg1" id="rimg1">
									</td>
								</tr>
								<tr>
									<th>조식 여부</th>
									<td>
										<select name="rbreakfast1" id="rbreakfast1">
											<option value="Y">Y</option>
											<option value="N" selected>N</option>
										</select>
									</td>
								</tr>
								<tr></tr>
								<tr></tr>
								<tr>
									<th>* 객실 - 2</th>
								</tr>
								<tr></tr>
								<tr>
									<th>객실 명</th>
									<td>
										<select name="rname2" id="rname2" required="required">
											<option value="슈페리어">슈페리어룸</option>
											<option value="스위트" selected>스위트룸</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>객실 금액</th>
									<td>
										<input type="text" name="rprice2" id="rprice2" maxlength="10" min="10000"required="required">
									</td>
								</tr>
								<tr>
									<th>객실 욕조 여부</th>
									<td>
										<select name="rtub2" id="rtub2">
											<option value="Y">Y</option>
											<option value="N" selected>N</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>침대 타입</th>
									<td>
										<select name="rbadtype2" id="rbadtype2">
											<option value="1" selected>1</option>
											<option value="2" >2</option>
											<option value="3" >3</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>전망</th>
									<td>
										<select name="rview2" id="rview2">
											<option value="시티뷰">시티뷰</option>
											<option value="오션뷰">오션뷰</option>
											<option value="마운틴뷰">마운틴뷰</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>객실 사이즈(m2)</th>
									<td>
										<input type="text" name="rsize2" id="rsize2" maxlength="4" style="width: 50px;">
									</td>
								</tr>
								<tr>
									<th>객실 이미지</th>
									<td>
										<input type="file" name="rimg2" id="rimg2">
									</td>
								</tr>
								<tr>
									<th>조식 여부</th>
									<td>
										<select name="rbreakfast2" id="rbreakfast2">
											<option value="Y">Y</option>
											<option value="N" selected>N</option>
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
			$("#enrollForm").attr("action","<%= request.getContextPath()%>/hEnroll.hj");
		}
	    
	    $(document).on("keyup", "input[name^=hGrade]", function() {
	        var val= $(this).val();

	        if(val.replace(/[0-9]/g, "").length > 0) {
	            alert("숫자만 입력해 주십시오.");
	            $(this).val('');
	        }

	        if(val<1 || val>5) {
	            alert("1~5범위로 입력해 주십시오.");
	            $(this).val('');
	        }
	    });
        
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