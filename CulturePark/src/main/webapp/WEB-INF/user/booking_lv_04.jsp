<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>예매하기 마지막 단계</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

    <%--https://puzzle-puzzle.tistory.com/entry/import-아임포트-결제-모듈-만들기--%>
    <%--https://docs.iamport.kr/implementation/payment--%>
    <%-- https://minaminaworld.tistory.com/78   --%>

    <%--css include--%>
    <style><%@include file="/resources/common/css/reset.css"%> </style>
    <style><%@include file="/resources/user/css/booking_common.css"%></style>
    <style><%@include file="/resources/user/css/booking_lv_04.css"%></style>

</head>

<body>

<div class="bookingContainer">
    <div class="booking_header">
        <div class="pd_info">
            <div class="pd_title">반 고흐 언사이드 : 더 씨어터</div>
            <div class="pd_space">그라운드시소 명동</div>
            <div class="pd_schedule">
                <div class="schedule_date">2022.5.19(목)</div>
                <div class="schedule_time">
                    <div class="round_data">
                        <div class="time_round">2</div>
                        <div class="unit">회</div>
                    </div>
                    <div class="round_time_info">11:00</div>
                </div>
            </div>
            <div class="pd_tickets">
                <ul>
                    <li class="selected_list">
                        <div class="ticket_case">성인</div>
                        <div class="unit_number">2</div>
                        <div class="unit">명</div>
                    </li>
                    <li class="selected_list">
                        <div class="ticket_case">청소년</div>
                        <div class="unit_number">3</div>
                        <div class="unit">명</div>
                    </li>
                </ul>
            </div>

        </div>

        <div class="btn_bar">
            <button id="back_btn" class="book_btn"><i class="fa-solid fa-arrow-left"></i></button>
            <div id="book_level" class="radio_section">
                <input type="radio" id="lv_chk_01" name="lv_chk">
                <input type="radio" id="lv_chk_02" name="lv_chk">
                <input type="radio" id="lv_chk_03" name="lv_chk">
                <input type="radio" id="lv_chk_04" name="lv_chk" checked="checked">
                <input type="radio" id="lv_chk_05" name="lv_chk">
            </div>
            <a id="close_btn" class="book_btn"><i class="fa-solid fa-xmark"></i></a>
        </div>
    </div>

    <div class="booking_body">
        <button class="check_module">결제하기</button>
    </div>

    <div class="booking_footer">

    </div>

</div>

</body>
<%--JS script--%>
<script src="/resources/common/js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
<%--Iamport--%>
<%--<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>--%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="/resources/user/js/booking_04.js"></script>
<script src="/resources/user/js/booking_common.js" type="text/javascript"></script>
</html>
