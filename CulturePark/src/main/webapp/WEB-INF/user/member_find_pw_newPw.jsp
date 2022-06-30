<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <%
        String resultPw = (String) session.getAttribute("findPw");

        if(resultPw.equals("success")){

    %>

    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

    <%-- css 불러오기 --%>
    <style><%@include file="/resources/common/css/reset.css" %></style>
    <style><%@include file="/resources/user/css/member_find_pw_newPw.css" %></style>

    <title>find_pw_result</title>
</head>
<body>

<%-- 성공시 --%>
<div class="success_view">

    <div class="container_div_suc">


        <div class="label_section label_div">
            <div class="label">새 비밀번호 입력</div>
        </div>

        <p class="sectionLine_thin"></p>

    <div class="div_center">
        <div class="inner_center">
        <div class="pw_section section_type01">
            <div class="center">
                <div class="pw_label">새 비밀번호 입력</div>
                <input class="input_pw pw_value input_type01" type="password" name="mb_pw">
            </div>
        </div>

        <div class="rePw_section section_type01">
            <div class="center">
                <div class="Pw_label">새 비밀번호 확인</div>
                <div class="rePw_value_section">
                    <input class="input_pw rePw_value input_type01" type="password">
                    <div class="pw_check" type="textFiled">비밀번호를 입력해주세요</div>
                </div>
            </div>
        </div>
        </div>
    </div>

        <div class="btn_section">
            <input type="button" class="btn new_cancel_btn" value="취소">
            <input type="button" class="btn new_ok_btn" value="확인">
        </div>

        <p class="sectionLine_thin"></p>

    </div>

</div>


<%
} else {
%>

<style><%@include file="/resources/common/css/reset.css" %></style>
<style><%@include file="/resources/user/css/member_find_pw_newPw.css" %></style>

<%--실패시--%>
<div class="fail_view">
    <div class="container_div_fai">

        <div class="icon_section">
            <i class="fa-solid fa-triangle-exclamation"></i>
        </div>

        <div class="label_section_row">
            <span>존재하지 않는 회원정보입니다.</span><br>
            <span>다시 입력해주세요.</span>
        </div>

        <div class="btn_section">
            <input type="button" class="fail_ok_btn" value="확인">
        </div>

    </div>
</div>



<%
    }
%>
</body>

<%-- script --%>
<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/resources/user/js/member_find_pw.js"></script>


</html>
