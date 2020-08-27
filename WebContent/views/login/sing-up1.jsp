<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>회원가입 이용약관</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../resources/css/mainpage.css">
        <link rel="stylesheet" href="../../resources/css/sign-up1.css">
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src ="../../resources/js/script.js"></script>
        <script>
            function allCheck() {
                $("[name=check2]").prop("checked", true);
            }// 모두 체크하기
    
            function oneCheck(a) {
                var allChkBox = $("[name=check1]");
                var chkBoxName = $(a).attr("name");
    
                if ($(a).prop("checked")) {
                    checkBoxLength = $("[name=" + chkBoxName + "]").length;
                    //전체체크박스 수(모두동의하기 체크박스 제외)
                    checkedLength = $("[name=" + chkBoxName + "]:checked").length;
                    //체크된 체크박스 수 
                    if (checkBoxLength == checkedLength) {
                        allChkBox.prop("checked", true);
                        //전체체크박스수 == 체크된 체크박스 수 같다면 모두체크
    
                    } else {
                        allChkBox.prop("checked", false);
    
                    }
                }
                else {
                    allChkBox.prop("checked", false);
                }
            }
    
            $(function () {
                $("[name=check1]").click(function () {
                    allCheck(this);
                    //모두동의하기 체크박스 클릭시
                });
                $("[name=check2]").each(function () {
                    $(this).click(function () {
                        oneCheck(this);
                    });
                });
            });
    
    </script>
    </head>
    <body>
        <%@ include file = "../common/header.jsp" %>

        <section class="all_wrap">
            <form action="" id="section01">
                <ul class="join_box">
                    <div class="title"><img src="../../resources/images/sign2.png" alt=""></div>
                    <li class="checkBox check01">
                        <ul class="clearfix">
                            <li>이용약관, 개인정보 수집 및 이용,
                                위치정보 이용약관(선택), 프로모션 안내
                                메일 수신(선택)에 모두 동의합니다.</li>
                            <li class="btn mainbtn">
                                <input type="checkbox" name="check1" id="chk" class="chekALL hidden chkid chkAll">  
                            </li>
                        </ul>
    
                    </li>
                    <li class="checkBox check02">
                        <ul class="clearfix">
                            <li>이용약관 동의(필수)</li>
                            <li class="btn">
                                <input type="checkbox" name="check2" class="chekALL hidden chk2All chkAll" required="">
                                
                            </li>
                        </ul>
                        
                        <textarea name="" id="">여러분을 환영합니다.
개편한 세상 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 개편한 세상 서비스의 이용과 관련하여 개편한 세상 서비스를 제공하는 개편한 세상 주식회사(이하 ‘개편한 세상’)와 이를 이용하는 개편한 세상 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 개편한 세상 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
           </textarea>
                    </li>
                    <li class="checkBox check03">
                        <ul class="clearfix">
                            <li>개인정보 수집 및 이용에 대한 안내(필수)</li>
                            <li class="btn">
                                <input type="checkbox" name="check2" class="chekALL hidden chk3All chkAll" required="">
                                
                            </li>
                        </ul>
    
                        <textarea name="" id="">여러분을 환영합니다.
개편한 세상 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 개편한 세상 서비스의 이용과 관련하여 개편한 세상 서비스를 제공하는 개편한 세상 주식회사(이하 ‘개편한 세상’)와 이를 이용하는 개편한 세상 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 개편한 세상 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.           </textarea>
                    </li>
                    <li class="checkBox check03">
                        <ul class="clearfix">
                            <li>위치정보 이용약관 동의(선택)</li>
                            <li class="btn">
                                <input type="checkbox" name="check2" class="chekALL hidden chk4All chkAll">
                                
                            </li>
                        </ul>
    
                        <textarea name="" id="">여러분을 환영합니다.
개편한 세상 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 개편한 세상 서비스의 이용과 관련하여 개편한 세상 서비스를 제공하는 개편한 세상 주식회사(이하 ‘개편한 세상’)와 이를 이용하는 개편한 세상 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 개편한 세상 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.           </textarea>
                    </li>
                    <li class="checkBox check04">
                        <ul class="clearfix">
                            <li>이벤트 등 프로모션 알림 메일 수신(선택)</li>
                            <li class="btn">
                                <input type="checkbox" name="check2" class="chekALL hidden chk5ll chkAll">
                               
                            </li>
                        </ul>
    
                    </li>
                </ul>
                <ul class="footBtwrap">
                    <li><button class="fpmgBt1" onclick="location='login.jsp'">이전</button></li>
                    <li><button class="fpmgBt2" onclick="location='sing-up2.jsp'">다음</button></li>
                </ul>
            </form>
        </section>

        <div style="height: 20px;"><a href="#header" id="top">▲ TOP</a></div>
        
        <%@ include file = "../common/footer.jsp" %>
    </body>
</html>