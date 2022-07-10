<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8" isELIgnored="false"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

    <%-- css 불러오기 --%>
    <style><%@include file="/resources/common/css/reset.css" %></style>
    <style><%@include file="/resources/common/css/common.css" %></style>
    <style><%@include file="/resources/user/css/member_login.css" %></style>

    <title>login</title>

    <c:if test="${message == 'logout' }">
        <script type='text/javascript'>
            alert('로그아웃되었습니다.');
        </script>
    </c:if>

</head>

<body>


<%-- Main --%>
<div class="mainContainer">
    <%-- 절대 건드리지말기. class이름 공통으로 가져가기. div 따로 만들어주고 건드리기 --%>

    <div class="centerContainer">
    <%-- 절대 건드리지말기. class이름 공통으로 가져가기. div 따로 만들어주고 건드리기 --%>

            <div class="content_container">
                <div class="login_container">
                    <div class="back_section">
                        <div class="arrow_section">
                            <i class="fa-solid fa-arrow-left"></i>
                            <div class="back">뒤로가기</div>
                        </div>
                    </div>

                    <div class="culturePark_section">
                        <a href="home.do"><span class="culturePark">Culture Park</span></a>
                    </div>


                <p class="sectionLine_thin"></p>

                <%--------------- pc ----------------%>

                    <%-- 로그인 전체 틀 --%>
                    <div class="pc_login">
                        <div class="div_row_section">

                            <%--왼쪽--%>
                            <div class="left_section">
                                <div class="id_label">아이디</div>
                                <div class="pw_label">비밀번호</div>
                            </div>

                            <%--가운데--%>
                            <div class="center_section">
                                <input name="mb_email" type="text" class="mb_email id_value p_id_value" >
                                <input name="mb_pw" type="password" class="pw_value p_pw_value"/>
                            </div>

                            <%--오른쪽--%>
                            <div class="right_section">
                                <div class="login_btn_section">
                                    <input class="login_btn login_btn_p" type="button" value="로그인">
                                </div>
                            </div>
                        </div>

                        <%-- 가로 영역 --%>
                        <div class="section_two">
                            <div class="save_id_section">
                                <div class="checkbox_section">
                                    <input class="checkbox_save_id checkbox_save_id_p" type="checkbox" name="save_id"
                                            required value="아이디저장">
                                    <div class="save_id">아이디 기억하기</div>
                                    <a class="p-2 logo" href="https://kauth.kakao.com/oauth/authorize?client_id=9062209bdf61d6187a357519816058d2&redirect_uri=http://localhost:8080/member/kakaoLogin&response_type=code" name="code">
                                        <img src="/resources/common/img/kakao_login.png" alt="카카오계정 로그인" style="width:108px; margin-left:91px;"></a>
                                </div>
                            </div>

                            <div class="join_section">
                                <input class="join_btn join_btn_p" type="submit" value="회원가입">
                            </div>

                            <div class="find_section">
                                <a href="/findId.do" class="find_id find_id_p"><button class="findId">아이디 찾기</button></a>
                                <a href="/findPw.do" class="find_pw find_pw_p"><button class="findPw">비밀번호 찾기</button></a>
                            </div>
                        </div>

                    </div>

                    <%------------- mobile ------------%>


                    <%-- 로그인 전체 틀 --%>
                    <div class="m_div_row_section">

                        <div class="m_div_row_inner">

                            <%-- 아이디 라벨 --%>
                           <%-- <div class="m_id_section">
                                <div class="m_id_label">아이디</div>
                            </div>--%>

                            <%-- 아이디 값 --%>
                            <div class="m_id_value_section">
                                <input name="mb_email" class="m_id_value mb_email" type="text" placeholder="아이디를 입력해주세요"/>
                            </div>

                            <%-- 비밀번호 라벨 --%>
                            <%--<div class="m_pw_section">
                                <div class="m_pw_label">비밀번호</div>
                            </div>--%>

                            <%-- 비밀번호 값 --%>
                            <div class="m_pw_value_section">
                                <input name="mb_pw" class="m_pw_value" type="password" placeholder="비밀번호를 입력해주세요"/>
                            </div>

                            <%-- 로그인 버튼 --%>
                            <div class="m_login_btn_section">
                                <input class="login_btn login_btn_m" type="button" value="로그인">
                            </div>



                            <%-- 아이디 저장 및  로그인 상태 유지 --%>
                            <div class="m_id_save_section">
                                <div class="m_id_save_div">
                                    <input class="checkbox_save_id checkbox_save_id_m" type="checkbox" name="save_id"
                                           value="아이디저장">
                                    <div class="label_div">
                                        <span class="m_save_id">아이디 저장</span>
                                    </div>

                                    <a class="p-2 logo" href="https://kauth.kakao.com/oauth/authorize?client_id=9062209bdf61d6187a357519816058d2&redirect_uri=http://localhost:8080/member/kakaoLogin&response_type=code" name="code">
                                        <img src="/resources/common/img/kakao_login.png" alt="카카오계정 로그인" style="width:100px; margin-left:65px">
                                    </a>

                                </div>
                            </div>

                            <%-- 아이디/비밀번호 찾기  // 회원가입 --%>
                            <div class="m_find_section">
                                <div class="m_find">
                                    <a href="/findId.do" class="find_id find_id_m"><button class="findId" >아이디 찾기</button></a>
                                    <a href="/findPw.do" class="find_pw find_pw_m"><button class="findPw">비밀번호 찾기</button></a>
                                </div>
                                <div class="m_join">
                                    <a href="/join.do" class="join_btn join_btn_m"><button class="join">회원가입</button></a>
                                </div>
                            </div>

                        </div>
                    </div>


                </div>  <%-- login_container --%>
            </div>  <%-- content_container --%>
        </div>  <%-- /centerContainer --%>
    </div>  <%-- /mainContainer --%>

</body>

<%-- script --%>
<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
<%--kakao API--%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="/resources/user/js/member_login.js"></script>


</html>
