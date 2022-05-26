<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                        <div class="culturePark">Culture Park</div>
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
                                <div type="textField" class="id_value m_id_value"></div>
                                <div type="password" class="pw_value m_pw_value"></div>
                            </div>

                            <%--오른쪽--%>
                            <div class="right_section">
                                <div class="login_btn_section">
                                    <input class="login_btn login_btn_p" type="submit" value="로그인">
                                </div>
                            </div>
                        </div>

                        <%-- 가로 영역 --%>
                        <div class="section_two">
                            <div class="save_id_section">
                                <div class="checkbox_section">
                                    <input class="checkbox_save_id checkbox_save_id_p" type="checkbox" name="save_id"
                                           value="아이디저장">
                                    <div class="save_id">아이디 저장</div>
                                </div>
                            </div>

                            <div class="join_section">
                                <input class="join_btn join_btn_p" type="submit" value="회원가입">
                            </div>

                            <div class="find_section">
                                <button class="find_id find_id_p">아이디 찾기</button>
                                <button class="find_pw find_pw_p">비밀번호 찾기</button>
                            </div>
                        </div>

                    </div>

                    <%------------- mobile ------------%>


                    <%-- 로그인 전체 틀 --%>
                    <div class="m_div_row_section">

                        <div class="m_div_row_inner">

                            <%-- 아이디 라벨 --%>
                            <div class="m_id_section">
                                <div class="m_id_label">아이디</div>
                            </div>

                            <%-- 아이디 값 --%>
                            <div class="m_id_value_section">
                                <div class="m_id_value" type="textField"></div>
                            </div>

                            <%-- 비밀번호 라벨 --%>
                            <div class="m_pw_section">
                                <div class="m_pw_label">비밀번호</div>
                            </div>

                            <%-- 비밀번호 값 --%>
                            <div class="m_pw_value_section">
                                <div class="m_pw_value" type="textField"></div>
                            </div>

                            <%-- 로그인 버튼 --%>
                            <div class="m_login_btn_section">
                                <button class="login_btn login_btn_m" type="submit">로그인</button>
                            </div>

                            <%-- 아이디 저장 및  로그인 상태 유지 --%>
                            <div class="m_id_save_section">
                                <div class="m_id_save_div">
                                    <input class="checkbox_save_id checkbox_save_id_m" type="checkbox" name="save_id"
                                           value="아이디저장">
                                    <div class="m_save_id">아이디 저장</div>
                                </div>
                            </div>


                            <%-- 아이디/비밀번호 찾기  // 회원가입 --%>
                            <div class="m_find_section">
                                <div class="m_find">
                                    <a href class="find_id find_id_m">아이디 찾기</a>
                                    <a href class="find_pw find_pw_m">비밀번호 찾기</a>
                                </div>
                                <div class="m_join">
                                    <a href class="join_btn join_btn_m" type="submit">회원가입</a>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/resources/user/js/member_login.js"></script>

</html>
