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
    <style><%@include file="/resources/common/css/header.css"%></style>
    <style><%@include file="/resources/user/css/member_find_pw.css" %></style>

    <title>member find id pw</title>
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

            <%-- 뒤로가기 --%>
            <div class="back_section">
                <div class="arrow_section">
                    <i class="fa-solid fa-arrow-left"></i>
                    <div class="back">뒤로가기</div>
                </div>
            </div>


            <%---- 비밀번호 찾기 영역 ----%>
            <div class="find_all_section">
                <div class="find_section">
                    <div class="find_label">아이디</div>
                    <input type="textField" class="email_value" id="find_email_value">
                </div>

                <div class="find_section">
                    <div class="find_label">인증번호</div>
                    <input type="textField" class="find_value" id="find_code_value">
                </div>

                <div class="certifyTime_section">
                    <span class="certifyTime">test:02:39</span>
                </div>

                <div class="ok_btn_section">
                    <input class="ok_btn" id=pw_ok_btn" type="submit" value="확인">
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
