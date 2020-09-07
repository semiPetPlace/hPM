<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>회원 정보 수정</title>
        
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="/semi/resources/css/mainpage.css">
        <link rel="stylesheet" href="/semi/resources/css/cafe-main.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
        <link rel="stylesheet" href="/semi/resources/css/mypage_Member.Modification.css">

        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src ="/semi/resources/js/script.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
        <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>

        
    </head>
    <body>
        <%@ include file = "../common/header.jsp" %>
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
                
            </div>

            
            <!-- 여기까지 네비 -->

            <div id="tag"><label id="tagTitle">회원 정보 수정</label> <label class="caution">*</label><label id="tagNotice">필수정보입력</label></div>

            
            <div id="showbox">
                <div>
                    <table>
                        <tr id="innerTop">
                            <td>
                                <div class="showList">
                                    <ul class="list1">
                                        <li>아이디</li>
                                        <li> <label class="caution">*</label> 비밀번호</li>
                                        <li> <label class="caution">*</label> 비밀번호 확인</li>
                                        <li>이름</li>
                                        <li>생년월일</li>
                                        <li>  <label class="caution">*</label> 연락처</li>
                                    </ul>
                                </div>
                            </td>

                            <td>
                                <div class="showRecode">
                                    <ul class="list2">
                                        <li><input type="text" name="" id="id" readonly value="<%=m.getMuserId()%>"></li>
                                        <li><input type="text" name="" id="password"></li>
                                        <li><input type="text" name="" id="passwordCheck"></li>
                                        <li><input type="text" name="" id="name" readonly value="<%=m.getMuserName()%>"></li>
                                        <li><input type="text" name="" id="brith" class="ssn" value="<%=m.getMbirth()%>" readonly> 
                                        </li>
                                        <li style="margin-bottom: 20px;"><input type="text" name="" id="phone1" class="pNum" readonly value="010"> - 
                                            <input type="text" name="" id="phone2" class="pNum"> - 
                                            <input type="text" name="" id="phone3" class="pNum"></li>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="showList">
                                    <ul class="list1">
                                        <li>주소</li>
                                        <br><br>
                                        <li>이메일</li>
                                    </ul>
                                </div>
                            </td>

                            <td>
                                <div class="showRecode">
                                    <ul class="list2">
                                        <li><input type="text" name="zib" id="address1" class="adr"> - 
                                            <input type="text" name="addr1" id="address2" class="adr" style="width:200px"> 
                                            <input type="button" class="postbtn" value="우편주소 검색" onclick="openZipSearch()">
                                        </li>
                                        <li><input type="text" name="addr2" id="address3" class="detailAdr"></li>
                                        <li><input type="text" name="" id="email1" class="email"> @
                                            <input type="text" name="" id="email2" class="email" >
                                        </li>
                                    </ul>
                                </div>

                            </td>

                        </tr>
                       
                        
                    </table>
                </div>

                <div id="decisionButton">
                    <a href="#ex1"><input type="button" value="수정하기" id="btn1"> </a>
                    <a href="../views/mypage-basic.jsp"><input type="button" value="취소" id="btn2" > </a>
                </div>
                
                
            </div>
            <div id="emptyPlace">
                <img src="" alt="">
            </div>
        </main>
        
        <!-- TOP -->
        <div style="height: 20px;"><a href="#header" id="top">▲ TOP</a></div>
        
        <%@ include file = "../common/footer.jsp" %>
        
        
						<!-- modal -->
        <div id="ex1" class="modal" style="height: 150px;">
            <p>
                <div id="Notice-modal">
                    <label class="caution">**</label>
                    <p>주의사항</p>
                    <ul>
                        <li>회원 정보를 수정하시겠습니까? </li>
                       
                    </ul>
        
                </div>
                <div style="text-align: center; margin-top: 30px;" >
                    <a href="#"><input type="button" value="회원정보 수정" id="btn3"></a>
                    <a href="#"><input type="button" value="취소" id="btn4"></a>
                </div>
                
            </p>
        </div>
        <script>
	        $('a[href="#ex1"]').click(function(event) {
	        	var password = $('#password').val();
	        	var passwordcheck = $('#passwordcheck').val();
	    		event.preventDefault();
	            if($('#password').val() == "" || $('#passwordcheck').val() == "" || $('#phone2').val() == ""|| $('#phone3').val() == ""){
	            	alert("필수값을 입력해주세요.");
	            }else if(password == passwordcheck){
	            	alert("변경할 비밀번호를 확인하세요.")
	            }else{
	            	$(this).modal({
	              		fadeDuration: 250
	            	});
	            }
	    	
	      
	   		});
	       
	        
	        
            

            function openZipSearch() {
	            new daum.Postcode({
		            oncomplete: function(data) {
                    $('[name=zip]').val(data.postcode); // 우편번호 (5자리)
                    $('[name=addr1]').val(data.address);
                    $('[name=addr2]').val(data.buildingName);
                    }
                }).open();
            }
     	</script>
        
    </body>
</html>