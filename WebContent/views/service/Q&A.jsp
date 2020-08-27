<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>main</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../resources/css/mainpage.css">
        <link rel="stylesheet" href="../../resources/css/cafe-main.css">
        <link rel="stylesheet" href="../../resources/css/Q&A.css">
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src ="../../resources/js/script.js"></script>

        
    </head>
    <body>
        <%@ include file = "../common/header.jsp" %>
        <main id="H_main">
            <div id="main_wrapper">
                <div class="notice">
                    <img src="../../resources/images/service/Q&A.png" alt="Q&A">
                </div>

                <div id="moreHelp">
                    <div class="notice">
                        <p>어떤 도움이 필요하신가요?</p>
                    </div>
                    <table>
                        <tr>
                            <td class="selectHelp">
                                <div class="OtherHelp">
                                    <button id="btn1">
                                        <img src="../../resources/images/freeboard_detail/pat3.png" class="placeImg"><br> 
                                        <div class="Name">
                                            <p>숙소예약</p>
                                        </div> 
                                    </button>
                                </div>
                            </td>

                            <td class="selectHelp">
                                <div class="OtherHelp">
                                    <button id="btn2">
                                        <img src="../../resources/images/freeboard_detail/pat3.png" class="placeImg"><br> 
                                        <div class="Name">
                                            <p>카페 및 레스토랑</p>
                                        </div> 
                                    </button>
                                </div>
                            </td>

                            <td class="selectHelp">
                                <div class="OtherHelp">
                                    <button id="btn3">
                                        <img src="../../resources/images/freeboard_detail/pat3.png" class="placeImg"><br> 
                                        <div class="Name">
                                            <p>로그인 관련</p>
                                        </div> 
                                    </button>
                                </div>
                            </td>

                            <td class="selectHelp">
                                <div class="OtherHelp">
                                    <button id="btn4">
                                        <img src="../../resources/images/freeboard_detail/pat3.png" class="placeImg"><br> 
                                        <div class="Name">
                                            <p>리뷰 및 커뮤니티</p>
                                        </div> 
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <!-- Q&A 숙소관련 -->
                <div id="content1">
                    <div class="menu"> <label class="question">숙소 관련</label></div>
                    <p class="content"><label class="question">내일이요. 내일 안오면 죄송합니다.</label></p>
        
                    <div class="menu"><label class="question">사이즈가 뭐있어요?</label></div>
                    <p class="content"><label class="question">S, M, L 있습니다.</label></p>
        
                    <div class="menu"><label class="question">환불 어떻게 하나요?</label></div>
                    <p class="content"><label class="question">입금된 계좌로 환불드립니다.</label></p>
        
                    <div class="menu"><label class="question">전화번호가 어떻게 되시나요?</label></div>
                    <p class="content"><label class="question">010-1234-5678입니다.</label></p>
        
                    <div class="menu"><label class="question">교환은 어떻게 하나요?</label></div>
                    <p class="content"><label class="question">교환 안됩니다.</label></p>
                </div>
                <!-- 카페 및 레스토랑 -->
                <div id="content2">
                    <div class="menu"> <label class="question">카페 및 레스토랑</label></div>
                    <p class="content"><label class="question">내일이요. 내일 안오면 죄송합니다.</label></p>
        
                    <div class="menu"><label class="question">사이즈가 뭐있어요?</label></div>
                    <p class="content"><label class="question">S, M, L 있습니다.</label></p>
        
                    <div class="menu"><label class="question">환불 어떻게 하나요?</label></div>
                    <p class="content"><label class="question">입금된 계좌로 환불드립니다.</label></p>
        
                    <div class="menu"><label class="question">전화번호가 어떻게 되시나요?</label></div>
                    <p class="content"><label class="question">010-1234-5678입니다.</label></p>
        
                    <div class="menu"><label class="question">교환은 어떻게 하나요?</label></div>
                    <p class="content"><label class="question">교환 안됩니다.</label></p>
                </div>
                <!-- 로그인관련 -->
                <div id="content3">
                    <div class="menu"> <label class="question">로그인 관련</label></div>
                    <p class="content"><label class="question">내일이요. 내일 안오면 죄송합니다.</label></p>
        
                    <div class="menu"><label class="question">사이즈가 뭐있어요?</label></div>
                    <p class="content"><label class="question">S, M, L 있습니다.</label></p>
        
                    <div class="menu"><label class="question">환불 어떻게 하나요?</label></div>
                    <p class="content"><label class="question">입금된 계좌로 환불드립니다.</label></p>
        
                    <div class="menu"><label class="question">전화번호가 어떻게 되시나요?</label></div>
                    <p class="content"><label class="question">010-1234-5678입니다.</label></p>
        
                    <div class="menu"><label class="question">교환은 어떻게 하나요?</label></div>
                    <p class="content"><label class="question">교환 안됩니다.</label></p>
                </div>
                <!-- 리뷰 및 커뮤니티 -->
                <div id="content4">
                    <div class="menu"> <label class="question">리뷰 및 커뮤니티</label></div>
                    <p class="content"><label class="question">내일이요. 내일 안오면 죄송합니다.</label></p>
        
                    <div class="menu"><label class="question">사이즈가 뭐있어요?</label></div>
                    <p class="content"><label class="question">S, M, L 있습니다.</label></p>
        
                    <div class="menu"><label class="question">환불 어떻게 하나요?</label></div>
                    <p class="content"><label class="question">입금된 계좌로 환불드립니다.</label></p>
        
                    <div class="menu"><label class="question">전화번호가 어떻게 되시나요?</label></div>
                    <p class="content"><label class="question">010-1234-5678입니다.</label></p>
        
                    <div class="menu"><label class="question">교환은 어떻게 하나요?</label></div>
                    <p class="content"><label class="question">교환 안됩니다.</label></p>
                </div>


                <div class="notice">
                    <p><자세한 문의></p>
                    <ul>
                        <li>더 상세한 문의를 원하시면 아래 도움을 참조하시오.</li>
                        <div class="notice_sub">
                        <li style="font-size: 13px; font-weight: bolder;"><고객센터 이용안내></li>

                        <li> - 전화상담 : Tel.1544-9970</li>
                        <li> - 상담시간 : 평일 09:00 ~ 18:00 (주말, 공휴일 제외)</li>
                        <li style="font-size: 13px; font-weight: bolder;"> <1:1 문의> </1:1></li>
                        <li><a href="#">1:1상담 하러가기</a></li>
                    </div>
                    </ul>
                </div>

                
                <div id="emptyPlace">
                    <img src="" alt="">
                </div>
                
            </div>
            
            
            
        </main>
        

        <%@ include file = "../common/footer.jsp" %>
        <script>
            $(function(){
                $(".content").slideUp();
                $(".menu").click(function(){
                    $(this).next("p").slideToggle(1000,function(){
                    });
                })


                $("#btn1").click(function(){
                    $("#content1").css({
                        "display" : "block"
                    })
                    $("#content2").css({
                        "display" : "none"
                    })
                    $("#content3").css({
                        "display" : "none"
                    })
                    $("#content4").css({
                        "display" : "none"
                    })
                    
                })
                $("#btn2").click(function(){
                    $("#content1").css({
                        "display" : "none"
                    })
                    $("#content2").css({
                        "display" : "block"
                    })
                    $("#content3").css({
                        "display" : "none"
                    })
                    $("#content4").css({
                        "display" : "none"
                    })
                    
                })
                $("#btn3").click(function(){
                    $("#content1").css({
                        "display" : "none"
                    })
                    $("#content2").css({
                        "display" : "none"
                    })
                    $("#content3").css({
                        "display" : "block"
                    })
                    $("#content4").css({
                        "display" : "none"
                    })
                    
                })
                $("#btn4").click(function(){
                    $("#content1").css({
                        "display" : "none"
                    })
                    $("#content2").css({
                        "display" : "none"
                    })
                    $("#content3").css({
                        "display" : "none"
                    })
                    $("#content4").css({
                        "display" : "block"
                    })
                    
                });

            });

        </script>
    </body>
</html>
        