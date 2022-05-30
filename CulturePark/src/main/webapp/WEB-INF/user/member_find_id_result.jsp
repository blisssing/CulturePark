
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

    <%-- css 불러오기 --%>
    <style><%@include file="/resources/common/css/reset.css" %></style>
    <style><%@include file="/resources/user/css/member_find_id_result.css" %></style>

    <title>find_id_result</title>
</head>
<body>

<%--성공시--%>
<div class="success_view">
    <div class="container_div">
        <div class="label_section">
            <span class="user">김진아</span><span>회원님의 아이디는</span>
        </div>

        <div class="id_section">
            <span class="user_id">abcdefg12@naver.com</span>
        </div>

        <div class="label_section">
            <span>입니다.</span>
        </div>

        <div class="btn_section">
            <input type="button" class="ok_btn" value="확인">
            <input type="button" class="login_btn" value="로그인하러가기">
        </div>

    </div>
</div>

<%--실패시--%>
<div class="fail_view">
    <div class="container_div">
        <div class="icon_section">

        </div>

        <div class="label_section">
            <span>존재하지 않는 회원정보입니다.</span>
            <span>다시 입력해주세요.</span>
        </div>

        <div class="btn_section">
            <input type="button" class="ok_btn" value="확인">
        </div>

    </div>
</div>

</body>

<%-- script --%>
<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/resources/user/js/member_find_id_pw_result.js"></script>

</html>
