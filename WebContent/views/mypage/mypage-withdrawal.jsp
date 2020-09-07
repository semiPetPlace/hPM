<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>회원탈퇴</title>
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mainpage.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/cafe-main.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage_Member.Modification.css">

        <script src ="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src ="<%=request.getContextPath()%>/resources/js/script.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
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
                        <li class="page_nav"><a href="<%=request.getContextPath() %>/myplace.ys">찜한 플레이스</a></li>
                        <li class="page_nav"><a href="<%=request.getContextPath() %>/review.ys">내가 쓴 게시글</a></li>
                        <br><br><br>
                        <li class="page_nav"><a href="<%=request.getContextPath() %>/membermodification.ys">회원 정보 수정</a></li>
                        
                        <li class="page_nav"><a href="<%=request.getContextPath() %>/withdrawal.ys">회원 탈퇴</a></li>
                    </ul>
                </div>
                
            </div>

            
            <!-- 여기까지 네비 -->

            <div id="tag"><label id="tagTitle">회원 탈퇴</label> <label class="caution">*</label><label id="tagNotice">필수정보입력</label></div>

            
            <div id="showbox">
                <div>
                    <table>
                        <tr id="innerTop">
                            <td>
                                <div class="showList">
                                    <ul class="list">
                                        <li>아이디</li>
                                        <li style="margin-top:10px;"> <label class="caution">*</label> 비밀번호</li>
                                    </ul>
                                </div>
                            </td>

                            <td>
                                <div class="showRecode">
                                    <ul class="list">
                                        <li><input type="text" name="" id="id" value="<%= m.getMuserId() %>" disabled></li>
                                        <li><input type="text" name="pwd" id="password"></li>
                                        
                                    </ul>
                                </div>

                            </td>

                        </tr>
                       
                    </table>
                </div>
                <div id="Notice">
                    <label class="caution">**</label>
                    <p>주의사항</p>
                    <ul>
                        <li>탈퇴 후 회원정보가 모두 삭제됩니다. </li>
                        <li>메일주소, 핸드폰 번호/기타 연락처 등 회원정보가 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.</li>
                        <li>탈퇴 후에도 작성된 게시글은 그대로 남아 있습니다.</li>
                        <li>각 게시판에 등록한 게시물 및 댓글은 탈퇴 후에도 남아있습니다.</li>
                        <li>삭제를 원하시는 게시물은 탈퇴 전 반드시 삭제하시기 바랍니다.</li>
                        <li>(탈퇴 후에는 게시글 임의 삭제 요청을 받지 않습니다.)</li>
                    </ul>

                </div>

                <div id="decisionButton">
                    <a href="#ex1"><input type="button" value="탈퇴하기" id="btn1" > </a>
                    <a href="./mypage-basic.jsp"><input type="button" value="취소" id="btn2" > </a>
                </div>
                
                
            </div>
            
            <div id="emptyPlace">
                <img src="" alt="">
            </div>
            
        </main>
        <!-- TOP -->
        <div style="height: 20px;"><a href="#header" id="top">▲ TOP</a></div>
        
			<%@ include file = "../common/footer.jsp" %>

        <div id="ex1" class="modal" style="height: 200px;">
            <p>
                <div id="Notice-modal" >
                    <label class="caution">**</label>
                    <p>주의사항</p>
                    <ul>
                        <li>탈퇴 후 회원정보가 모두 삭제됩니다. </li>
                        <li>메일주소, 핸드폰 번호/기타 연락처 등 회원정보가 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.</li>
                        <li>탈퇴 후에도 작성된 게시글은 그대로 남아 있습니다.</li>
                        <li>각 게시판에 등록한 게시물 및 댓글은 탈퇴 후에도 남아있습니다.</li>
                        <li>삭제를 원하시는 게시물은 탈퇴 전 반드시 삭제하시기 바랍니다.</li>
                        <li>(탈퇴 후에는 게시글 임의 삭제 요청을 받지 않습니다.)</li>
                    </ul>
        
                </div>
                <div style="text-align: center; margin-top: 10px;" >
                    <a href="<%=request.getContextPath()%>/deleteMember.th"><input type="button" value="회원탈퇴" id="btn3" onclick="location.href='<%=request.getContextPath()%>/deleteMember.th'"></a>
                    <a href="#"><input type="button" value="취소" id="btn3"></a>
                </div>
                </div>
                
            </p>
        </div>
        <script>
            $('a[href="#ex1"]').click(function(event) {
              event.preventDefault();
         
              $(this).modal({
                fadeDuration: 250
              });
            });
        </script>
    </body>
</html>