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
    <style><%@include file="/resources/user/css/common_header.css"%></style>
    <style><%@include file="/resources/user/css/member_find_pw.css" %></style>

    <title>member find pw</title>
</head>

<body>

<%-- Main --%>
<div class="mainContainer">
    <%-- 절대 건드리지말기. class이름 공통으로 가져가기. div 따로 만들어주고 건드리기 --%>

    <%-- haader --%>
    <div class="header_container">
        <%@ include file="/WEB-INF/user/main_header.jsp"%>
    </div>


    <div class="centerContainer">
        <%-- 절대 건드리지말기. class이름 공통으로 가져가기. div 따로 만들어주고 건드리기 --%>

        <div class="content_container">
            <div class="inner_container">

            <%-- 뒤로가기 --%>
            <div class="back_section">
                <div class="arrow_section">
                    <i class="fa-solid fa-arrow-left"></i>
                    <div class="back">뒤로가기</div>
                </div>
            </div>

            <div class="label_section">
                <div class="label">비밀번호 찾기</div>
            </div>


            <%---- 비밀번호 찾기 영역 ----%>
            <div class="find_all_section">

                <input class="mb_seq" name="mb_seq" hidden="hidden">
                <div class="type_choice">
                    <input type="radio" class="email_radio" id="email" name="type_chk" value="email" checked="checked">
                    <div class="email_radio_label">이메일</div>
                    <input type="radio" class="phone_radio" id="phone" name="type_chk" value="phone">
                    <div class="phone_radio_label">휴대폰</div>
               </div>


                <div class="find_section">
                    <div class="find_label">이름</div>
                    <input type="textField" class="input_value" id="find_name_value" name="mb_name">
                </div>

                <%--이메일--%>
                <div class="find_section email_set">
                    <div class="find_label">이메일</div>
                    <input type="textField" class="input_value" id="find_email_value" name="mb_email">
                    <input type="button" class="code_send_btn code_send_email" name="code_send_email" value="인증코드 받기">
                </div>

                <%--번호--%>
                <div class="find_section phone_set">
                    <div class="find_label">휴대폰</div>
                    <input type="textField" class="input_value tel_1" id="find_phone_value_1">
                    <div class="space">-</div>
                    <input type="textField" class="input_value tel_2" id="find_phone_value_2">
                    <div class="space">-</div>
                    <input type="textField" class="input_value tel_3" id="find_phone_value_3">
                    <input type="button" class="code_send_btn code_send_phone" name="code_send_phone" value="인증번호 받기">
                </div>

                <div class="find_section">
                    <div class="find_label">인증번호</div>
                    <input type="text" class="input_value authentication_code" id="authentication_code" name="authentication_code" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                    <span class="time">10:00</span>
                    <input type="button" class="code_chk_ok" name="code_send_ok_phone" value="확인">
                </div>

                <div class="ok_btn_section">
                    <input class="ok_btn find_pw_ok_btn" id="pw_ok_btn" type="button" value="확인">
                </div>
            </div>

            </div>
        </div> <%-- /content_container --%>
    </div>  <%-- /centerContainer --%>
</div>  <%-- /mainContainer --%>

</body>

<%-- script --%>
<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/resources/user/js/member_find_pw.js"></script>

</html>
