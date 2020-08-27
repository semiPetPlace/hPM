<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
            <div class="glores-A-join-wrap">
                <form name="mem_reg_form" method="post" action="" target="ok_frame" enctype="multipart/form-data">
                    <input type="hidden" name="join_mode" value="">
                    <input type="hidden" name="tmp_name" value="tmp_val">
                    <input type="hidden" name="this_site_mode" value="1">
                    <input type="hidden" name="this_domain">
                    <input type="hidden" name="post_action">
                    <div class="title"><img src="../resources/images/sign1.png" alt=""></div>
                    <div id="sing-up2" class="sing-up2">
                    <div class="glores-A-join">
                        <label for="id"><span>아이디</span></label>
                        <div class="glores-A-value">
                            <div class="reg_memberID"><input type="text" name="id" id="id" maxlength="12">
                                <button type="button" onclick="id_chk_popup()" title="새창열림">아이디 중복체크</button>
                            </div>
                        </div>
                        <div class="glores-A-info">아이디는 영문+숫자만 입력 가능 합니다.</div>
                        <br>
                        <label for="nick"><span>별명</span></label>
                        <div class="glores-A-value">
                            <div class="reg_nickname"><input type="text" name="nickname" id="nick" size="20"
                                maxlength="20" value=""> <button type="button" onclick="nickname_chk_popup()"
                                title="새창열림">닉네임
                                중복체크</button></div>
                            </div>
                            <div class="glores-A-info">게시글 작성시 사용 할 닉네임을 입력해주세요.</div>
                            <br>
                            <label for="pwd"><span>패스워드</span></label>
                            <div class="glores-A-value">
                                <div class="reg_password">
                                    <input type="hidden" name="mem_link_yn" value="2">
                                    <input type="password" name="pwd" id="pwd" size="12" maxlength="16">
                                    <label for="pwd_re">확인</label>
                                    <input type="password" name="pwd_re" id="pwd_re" size="12" maxlength="16">
                                </div>
                            </div>
                            <div class="glores-A-info">패스워드는 영문+숫자+특수문자를 조합하여 8자 이상 입력해주세요.</div>
                            <br>
                            <label for="name"><span>성명</span></label>
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
                                <label for="addr"><span>주소</span></label>
                                <div class="glores-A-value">
                                    <div class="reg_address">
                                        <div class="zipcode">
                                            <input type="text" name="zip1" id="addr" size="7" maxlength="7" value=""
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
                                <label for="tel"><span>전화번호</span></label>
                                <div class="glores-A-value">
                                    <div class="reg_telNumber"><select name="tel1" id="tel1" style="width:55px"
                                        title="전화번호 첫번째">
                                        <option value="">선택</option>
                                        <option value="02">02</option>
                                        <option value="031">031</option>
                                        <option value="032">032</option>
                                        <option value="033">033</option>
                                        <option value="041">041</option>
                                        <option value="042">042</option>
                                        <option value="043">043</option>
                                        <option value="044">044</option>
                                        <option value="051">051</option>
                                        <option value="052">052</option>
                                        <option value="053">053</option>
                                        <option value="054">054</option>
                                        <option value="055">055</option>
                                        <option value="061">061</option>
                                        <option value="062">062</option>
                                        <option value="063">063</option>
                                        <option value="064">064</option>
                                        <option value="050">050</option>
                                        <option value="060">060</option>
                                        <option value="080">080</option>
                                        <option value="070">070</option>
                                        <option value="0502">0502</option>
                                        <option value="0503">0503</option>
                                        <option value="0505">0505</option>
                                        <option value="0506">0506</option>
                                        <option value="0507">0507</option>
                                        <option value="0508">0508</option>
                                        <option value="0130">0130</option>
                                        <option value="0303">0303</option>
                                    </select> - <input type="text" name="tel2" size="4" maxlength="4" value=""
                                    title="전화번호 두번째">
                                    - <input type="text" name="tel3" size="4" maxlength="4" value="" title="전화번호 세번째">
                                </div>
                            </div>
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
                            <div class="cont"><span><label><input type="radio" name="birthday_type" id="" value="0"
                                checked="checked">
                                <span>양력</span></label>
                                <label><input type="radio" name="birthday_type" id="birthday_type1" value="1">
                                    <span>음력</span></label></span> <span class=""><label><select name="birth_y">
                                        <option value="">선택</option>
                                        <option value="2020">2020</option>
                                        <option value="2019">2019</option>
                                        <option value="2018">2018</option>
                                        <option value="2017">2017</option>
                                        <option value="2016">2016</option>
                                        <option value="2015">2015</option>
                                        <option value="2014">2014</option>
                                        <option value="2013">2013</option>
                                        <option value="2012">2012</option>
                                        <option value="2011">2011</option>
                                            <option value="2010">2010</option>
                                            <option value="2009">2009</option>
                                            <option value="2008">2008</option>
                                            <option value="2007">2007</option>
                                            <option value="2006">2006</option>
                                            <option value="2005">2005</option>
                                            <option value="2004">2004</option>
                                            <option value="2003">2003</option>
                                            <option value="2002">2002</option>
                                            <option value="2001">2001</option>
                                            <option value="2000">2000</option>
                                            <option value="1999">1999</option>
                                            <option value="1998">1998</option>
                                            <option value="1997">1997</option>
                                            <option value="1996">1996</option>
                                            <option value="1995">1995</option>
                                            <option value="1994">1994</option>
                                            <option value="1993">1993</option>
                                            <option value="1992">1992</option>
                                            <option value="1991">1991</option>
                                            <option value="1990">1990</option>
                                            <option value="1989">1989</option>
                                            <option value="1988">1988</option>
                                            <option value="1987">1987</option>
                                            <option value="1986">1986</option>
                                            <option value="1985">1985</option>
                                            <option value="1984">1984</option>
                                            <option value="1983">1983</option>
                                            <option value="1982">1982</option>
                                            <option value="1981">1981</option>
                                            <option value="1980">1980</option>
                                            <option value="1979">1979</option>
                                            <option value="1978">1978</option>
                                            <option value="1977">1977</option>
                                            <option value="1976">1976</option>
                                            <option value="1975">1975</option>
                                            <option value="1974">1974</option>
                                            <option value="1973">1973</option>
                                            <option value="1972">1972</option>
                                            <option value="1971">1971</option>
                                            <option value="1970">1970</option>
                                            <option value="1969">1969</option>
                                            <option value="1968">1968</option>
                                            <option value="1967">1967</option>
                                            <option value="1966">1966</option>
                                            <option value="1965">1965</option>
                                            <option value="1964">1964</option>
                                            <option value="1963">1963</option>
                                            <option value="1962">1962</option>
                                            <option value="1961">1961</option>
                                            <option value="1960">1960</option>
                                            <option value="1959">1959</option>
                                            <option value="1958">1958</option>
                                            <option value="1957">1957</option>
                                            <option value="1956">1956</option>
                                            <option value="1955">1955</option>
                                            <option value="1954">1954</option>
                                            <option value="1953">1953</option>
                                            <option value="1952">1952</option>
                                            <option value="1951">1951</option>
                                            <option value="1950">1950</option>
                                            <option value="1949">1949</option>
                                            <option value="1948">1948</option>
                                            <option value="1947">1947</option>
                                            <option value="1946">1946</option>
                                            <option value="1945">1945</option>
                                            <option value="1944">1944</option>
                                            <option value="1943">1943</option>
                                            <option value="1942">1942</option>
                                            <option value="1941">1941</option>
                                            <option value="1940">1940</option>
                                            <option value="1939">1939</option>
                                            <option value="1938">1938</option>
                                            <option value="1937">1937</option>
                                            <option value="1936">1936</option>
                                            <option value="1935">1935</option>
                                            <option value="1934">1934</option>
                                            <option value="1933">1933</option>
                                            <option value="1932">1932</option>
                                            <option value="1931">1931</option>
                                            <option value="1930">1930</option>
                                        </select>년</label> <label><select name="birth_m">
                                            <option value="">선택</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                            <option value="7">7</option>
                                            <option value="8">8</option>
                                            <option value="9">9</option>
                                            <option value="10">10</option>
                                            <option value="11">11</option>
                                            <option value="12">12</option>
                                        </select>월</label> <label><select name="birth_d">
                                            <option value="">선택</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                            <option value="7">7</option>
                                            <option value="8">8</option>
                                            <option value="9">9</option>
                                            <option value="10">10</option>
                                            <option value="11">11</option>
                                            <option value="12">12</option>
                                            <option value="13">13</option>
                                            <option value="14">14</option>
                                            <option value="15">15</option>
                                            <option value="16">16</option>
                                            <option value="17">17</option>
                                            <option value="18">18</option>
                                            <option value="19">19</option>
                                            <option value="20">20</option>
                                            <option value="21">21</option>
                                            <option value="22">22</option>
                                            <option value="23">23</option>
                                            <option value="24">24</option>
                                            <option value="25">25</option>
                                            <option value="26">26</option>
                                            <option value="27">27</option>
                                            <option value="28">28</option>
                                            <option value="29">29</option>
                                            <option value="30">30</option>
                                            <option value="31">31</option>
                                        </select>일</label></span></div>
                            </div>
                        </div>
                    </ul>
                    <div class="glores-A-btn-wrap">
                        <ul class="footBtwrap">
                            <li><button class="fpmgBt1" onclick="location='../views/sing-up1.jsp'">이전</button></li>
                            <li><button class="fpmgBt2" onclick="location='../views/main1.jsp'">작성완료</button></li>
                        </ul>
                    </div>
                </form>
            </div>
        </div>
    </main>



    <div style="height: 20px;"><a href="#header" id="top">▲ TOP</a></div>
    <%@ include file = "../common/footer.jsp" %>
</body>

</html>