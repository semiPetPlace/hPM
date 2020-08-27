<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>1:1문의하기</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../resources/css/mainpage.css">
        <link rel="stylesheet" href="../../resources/css/Question.css">
        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src ="../../resources/js/script.js"></script>
    </head>
    <body>
        <%@ include file = "../common/header.jsp" %>

        <div class="main">
            <div class="content_top_img">
                <img src="../../resources/images/service/mtm.png" alt="1:1 문의하기">
            </div>
        <div class="inMain">
            <div id="content_top">
                <p id="top_p">
                    도움말을 통해 충분히 답변이 되지 못한 분들에게 1:1 문의를 통해 <br>
                    자세한 답변을 드리고 있습니다.
                </p>
            </div>
            <div style="width:100%; height:8px; background:orange;;"></div>
            <div id="content_body">
                <div class="kinds">
                <label class="label_size">문의 유형</label>
                <select name="kinds" id="kinds" class="input_size">
                    <option value="reservation">예약 관련</option>
                    <option value="userinfo">유저 정보</option>
                    <option value="pay">결제</option>
                    <option value="tendinous">건의하기</option>
                    <option value="company">업체 문의</option>
                    <option value="etc">기타</option>
                </select>
                </div>
                <div class="email">
                    <label class="label_size">이메일</label>
                    <input type="text" name="email1" id="email1" class="input_size">
                    <span>@</span>
                    <input type="text" name="email2" id="email2" class="input_size">
                    <select name="email3" id="email3" class="input_size">
                        <option value='0'>----이메일 선택----</option>
                        <option value='naver.com' >naver.com</option>
                        <option value='nate.com' >nate.com</option>
                        <option value='dreamwiz.com' >dreamwiz.com</option>
                        <option value='yahoo.co.kr' >yahoo.co.kr</option>
                        <option value='hotmail.com' >hotmail.com</option>
                        <option value='gmail.com' >gmail.com</option>
                        <option value='hanmail.net' >hanmail.net</option>
                        <option value='1' >직접 입력</option>
                    </select>
                </div>
                <div class="title">
                    <label class="label_size">제목</label>
                    <input type="text" name="title" id="title" class="input_size">
                </div>
                <div class="contnet">
                    <div>
                        <label class="label_size" id="content_lb">내용</label>
                    </div>
                    <div>
                        <textarea name="content_ta" id="content_ta" cols="30" rows="10"></textarea>
                    </div>
                </div>
            </div>
                <div class="contnet_bottem">

                    <dl class="a_info">
                        <dt>1:1 문의 유의사항</dt>
                        <dd><span class="bul_num">1)</span> 접수된 내용은 최초 접수 건부터 순차적으로 답변해 드리고 있으며, 문의량이 급증하거나 확인이
                            필요한 문의의 경우 답변이 지연될 수 있으니 양해 부탁드립니다.
                        </dd>
                        <dd><span  class="bul_num">2)</span> 이메일을 통한 통화 시간 예약 문의 등 전화 상담 요청은 불가하오니 양해 부탁 드립니다.</dd>
                        <dd><span  class="bul_num">3)</span> 불량 유저 신고 안내 사항
                            <p><span>-</span> 증거 자료가 첨부되어야 접수가 가능합니다.</p>
                            <p><span>-</span> 운영원칙의 위반 정도에 따라 경고부터 이용 정지까지 처리 될 수 있으며, 음란물 및 운영원칙 위반
                                정도가 심할 경우 경고 없이 바로 이용 정지 될 수 있습니다.</p>
                            <p><span>-</span> 타인을 비방하거나 고의적인 허위 신고의 경우 신고자 또한 제재를 받을 수 있습니다.</p>
                        </dd>
                    </dl>

                    <dl class="a_info2">
                    <dt>안내 사항 </dt>
                    <dd>- 유저상담 업무를 처리하기 위해 최소한의 개인정보만을 수집하고 있습니다.</dd>
                    </dl>

                    <dl class="a_info2">
                    <dt>개인정보의 수집항목 및 이용목적</dt>
                    <dd>- 수집 항목 : 아이디, 이메일</dd>
                    <dd>- 이용 목적 : 유저 불만 또는 분쟁 처리 해결을 위함</dd>
                    </dl>

                    <dl class="a_info2">
                    <dt>개인정보의 보유 및 이용기간</dt>
                    <dd>- 보관 목적 : 문의 접수 및 유저 불만 해결을 위해 일정 기간 보관됩니다.</dd>
                    <dd>- 보관 기간 : 3년</dd>
                    </dl>

                    <p class="a_info3">※ 고객센터로 문의/신고 시 회원님이 추가로 입력하는 개인정보가 있을 수 있습니다.</p>
                </div>
                
                <div class="bottem_btn">
                    <p class="agree"><input type="checkbox" id="ag" name="agree" /><label id="ag_lb">위 입력정보를 이메일 상담을 위하여 수집하는 것에 동의합니다</label></p>
                    <input type="button" value="확인" id="submit" class="btn">
                    <input type="button" value="취소" id="cancel" class="btn">
                </div>
            </div>
        </div>    
        <!-- TOP -->
        <div style="height: 20px; margin-right: 2%;"><a href="#header" id="top">▲ TOP</a></div>

        <%@ include file = "../common/footer.jsp" %>
    </body>
</html>