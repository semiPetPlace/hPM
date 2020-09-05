<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>

<% ArrayList<String> idList = (ArrayList<String>)request.getAttribute("idlist");%>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../resources/css/mainpage.css">
    <link rel="stylesheet" href="../../resources/css/sing-up2.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="../../resources/js/script.js"></script>
    <style>
    .glores-A-info{
    	color: lightgray;
    }
    </style>
    <script>
        $(function () {
            $('#hi').one('click', function () {
                alert('성공적으로 회원가입이 완료되었습니다.');
            });
        });
    </script>
    <script defer="">
        jQuery(function ($) {
            $('input[type=radio][checked=checked]').parent().addClass('on');
            $('input[type=radio]').on('click', function () {
                $(this).parent().addClass('on').siblings().removeClass('on');
            });
        });
    </script>
</head>

<body>
    <%@ include file = "../common/header.jsp" %>
    
    <main id="H_main">
        <div id="main-wrapper">
            <div class="glores-A-join-wrap">   <%-- action="${pageContext.request.contextPath}/join.me" --%>
                <form name="signform" method="post" action=""  id="signform" >
                
                    <div class="title"><img src="../resources/images/sign1.png" alt=""></div>
                    <div id="sing-up2" class="sing-up2">
                    <div class="glores-A-join">
                        <label for="id"><span>아이디</span></label>
                        <div class="glores-A-value">
                            <div class="reg_memberID"><input type="text" name="id" id="id" maxlength="12" >
                                <button type="button" class="id_overlap_button" onclick="id_overlap_check()" >아이디 중복체크</button>
                                <img id="id_check_sucess" style="display: none;">
                            </div>
                        </div>
                        <div class="glores-A-info idinfo">아이디는 영문+숫자만 입력 가능 합니다.</div>
                        <br>
                        
                            <label for="pw"><span>패스워드</span></label>
                            <div class="glores-A-value">
                                <div class="reg_password">
                                    <input type="hidden" name="mem_link_yn" value="2">
                                    <input type="password" name="pw" id="pw" size="25" maxlength="16"><br>
                                    <label for="pwd"><span>패스워드 확인</span></label><br>
                                    <input type="password" name="repw" id="repw" size="25" maxlength="16">
                                </div>
                            </div>
                         <div class="glores-A-info pw.regex repw.regex">패스워드는 영문+숫자+특수문자를 조합하여 8자 이상 입력해주세요.</div>
                            <br>
                            <label for="name"><span>이름</span></label>
                            <div class="glores-A-value">
                                <div class="reg_name"><input type="text" name="name" id="name" size="20" value=""
                                    maxlength="20"></div>
                                </div>
                                <div class="glores-A-info"></div>
                                <br>
                                <label for="email"><span>e-mail</span></label>
                                <div class="glores-A-value">
                                    <div class="reg_email"><input type="text" name="email" id="email" value=""></div>
                                </div>
                                <div class="glores-A-info"></div>
                                <br>
                                <label for="address"><span>주소</span></label>
                                <div class="glores-A-value">
                                    <div class="reg_address">
                                        <div class="zipcode">
                                            <input type="text" name="zip1" id="address" size="7" maxlength="7" value=""
                                            title="우편번호">
                                            <button type="button" onclick="search_zip()" title="새창열림">우편번호 찾기</button>
                                        </div>
                                        <br>
                                        <div class="addr">
                                            <input type="text" name="addr1" size="25" maxlength="50" value="" title="기본주소">
                                            <input type="text" name="addr2" size="30" maxlength="50" value="" title="상세주소"
                                            placeholder="상세주소를 입력해주세요.">
                                        </div>
                                    </div>
                                </div>
                                <div class="glores-A-info"></div>
                                <br>
                                
                            <div class="glores-A-info"></div>
                            <br>
                            <label for="hp"><span>휴대전화</span></label>
                            <div class="glores-A-value">
                                <div class="reg_mobileNumber"><select name="hp1" id="hp1" style="width:55px"
                                    title="휴대전화 첫번째">
                                    <option value="">선택</option>
                                    <option value="010">010</option>
                                    <option value="011">011</option>
                                    <option value="012">012</option>
                                    <option value="016">016</option>
                                    <option value="017">017</option>
                                    <option value="018">018</option>
                                    <option value="019">019</option>
                                </select> - <input type="text" name="hp2" size="4" maxlength="4" value=""
                                title="휴대전화 두번째">
                                - <input type="text" name="hp3" size="4" maxlength="4" value="" title="휴대전화 세번째">
                            </div>
                        </div>
                        <div class="glores-A-info"></div>
                        <br>
                        <span>생년월일</span>
                        <div class="birth">
                      
                                <label>
                                	<input type="text" name="birth" size="6" maxlength="6">&nbsp;-
                                	<input type="text" name="gender" size="1" maxlength="1" style="width:15px;">******
                                </label>
                                
                                </div>
                                <div class="glores-A-info">ex)990101-1</div>
                            </div>
                    
                    <div class="glores-A-btn-wrap">
                        <ul class="footBtwrap">
                            <button class="fpmgBt1" onclick="location='../views/sing-up1.jsp'"style="width:100px;height:20px;font-size:18px;margin-left-50px">이전</button>
                            <button class="fpmgBt2" id="signupbtn" onclick="goCreateAccount()" value="작성완료"  style="width:100px;height:20px;font-size:18px">
                        </ul>														<!-- onclick="goCreateAccount()" -->
                    </div>
                </form>
            </div>
        </div>
    </main>



    <div style="height: 20px;"><a href="#header" id="top">▲ TOP</a></div>
    <%@ include file = "../common/footer.jsp" %>
</body>
 <script>
 var check = 0;
		$(function(){
            // 중복확인 & id 유효성검사             
            $("#duplcheck").on("click",function(){
                var id = $("#id").val();
                if(id == ""){
                	alert("아이디를 입력해주세요");
                	return;
                }
                var regex = /^[a-z][a-z\d]{4,11}$/;
            	var result = regex.exec(id);
                
            	 if(result != null){
                     $(".id.regex").html("");
                window.open("idDuplCheck.jsp?id="+ id,"","width=500px,height=300px,top=300px,left=200px");
                 }else{
                     $(".id.regex").html("영어 소문자,숫자 5-12자리");
                     $(".id.regex").css("color","red")
                 }
                
                
            })
            //id유효성 체크
             $("#id").on("input",function(){
            	 var regex = /^[a-z][a-z\d]{4,11}$/;
                var result = regex.exec($("#id").val())
                
                if(result != null){
                    $("[class*='idinfo']").html("중복체크가 필요합니다");
                }else{
                    $("[class*='idinfo']").html("아이디를 5글자 이상 입력하세요");
                    $("[class*='idinfo']").css("color","red")
                }
            });   
         
    	//비밀번호 유효성검사
            $("#pw").on("input",function(){
                var regex = /^[A-Za-z\d]{8,12}$/;
                var result = regex.exec($("#pw").val())
                
                if(result != null){
                    $("[class*='pw.regex']").html("");
                }else{
                    $("[class*='pw.regex']").html("영어대소문자,숫자 8-11자리");
                    $("[class*='pw.regex']").css("color","red")
                }
            });
            
           //비밀번호 확인    
               $("#repw").on("keyup",function(){
                    if($("#pw").val()==$("#repw").val()){
                       $("[class*='repw.regex']").html("비밀번호가 일치합니다"); 
                    }else{
                     $("[class*='repw.regex']").html("비밀번호가 일치하지않습니다"); 
                    }
               })
            
            //이름 유효성검사
                $("#name").on("input",function(){
                    var regex = /[가-힣]{2,}/;
                    var result = regex.exec($("#name").val());
                    
                    if(result != null){
                       $(".name.regex").html("");  
                    }else{
                        $(".name.regex").html("한글만 입력 가능합니다.");
                    }
                    
                })
            
        
            //email유효성 검사
                $("#email").on("input",function(){
                     var regex = /.+@[a-z]+(\.[a-z]+){1,2}$/;
                     var result = regex.exec($("#email").val());
                    
                    if(result != null){
                       $(".email.regex").html("");  
                    }else{
                        $(".email.regex").html("올바른 이메일이 아닙니다");
                    }
                })
          //회원가입 버튼 눌렀을 때, 빈칸 있으면 다시 유효성 검사진행    
           $("#signupbtn").on("click",function(){
        	   
        	   var id = $("#id").val();
        	   var pw = $("#pw").val();
        	   var repw = $("#repw").val();
        	   var name = $("#name").val();
        	   var email = $("#email").val();
        	   var address = $("#address").val();
        	   var idregex = /^[a-z][a-z\d]{4,11}$/;
        	   var pwregex = /^[A-Za-z\d]{8,12}$/;
        	   var nameregex = /[가-힣]{2,}/;
        	   var emailregex = /.+@[a-z]+(\.[a-z]+){1,2}$/;
        	   
        	   var idregex = idregex.exec(id);
        	   if(idregex == null){
        		   alert("아이디양식을 다시 확인해주세요");
        		   return;
        	   }
        	   if(pw != repw){
        		   alert("비밀번호가 일치하지 않습니다.");
        		   	return;
        	   }
        	   
        	   
        	   var pwregex = pwregex.exec(pw);
        	   if(pwregex == null){
        		   alert("비밀번호양식을 다시 확인해주세요");
        		   retrun;
        	   }
        	   
        	   var nameregex = nameregex.exec(name);
        	   if(nameregex == null){
        		   alert("이름양식을 다시 확인해주세요");
        		   retrun;
        	   }
        	   
        	   var emailregex = emailregex.exec(email);
        	   if(emailregex == null){
        		   alert("이메일양식을 다시 확인해주세요");
        		   retrun;
        	   }
        	 
        	 
        	   if(address == null){
        		   alert("주소를 다시 확인해주세요");
        		   retrun;
        	   } 
        	 
             	 
        
   		       alert('회원가입이 완료되었습니다. ');
     		   $("#signform").attr("action","${pageContext.request.contextPath}/join.me");
     		   $("#signform").submit();
             
           
           })
        })
        </script>
</html>