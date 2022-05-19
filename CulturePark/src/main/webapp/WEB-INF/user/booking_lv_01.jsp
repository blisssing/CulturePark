<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>예매하기 페이지 01</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

    <%--css include--%>
    <style><%@include file="/resources/common/css/reset.css"%> </style>
    <style><%@include file="/resources/user/css/booking_common.css"%></style>
    <style><%@include file="/resources/user/css/booking_lv_01.css"%></style>


</head>

<body>
<div class="bookingContainer">
    <div class="booking_header">
        <div class="pd_info">
            <div class="pd_title">반 고흐 언사이드 : 더 씨어터</div>
            <div class="pd_space">그라운드시소 명동</div>
            <div class="pd_schedule">
                <div class="schedule_date"></div>
                <div class="schedule_time">
                    <div class="time_round"></div>
                    <div class="unit"></div>
                    <div class="round_time"></div>
                </div>
            </div>
        </div>

        <div class="btn_bar">
            <a id="back_btn" class="book_btn"><i class="fa-solid fa-arrow-left"></i></a>
            <div id="book_level" class="radio_section">
                <input type="radio" id="lv_chk_01" name="lv_chk" checked="checked">
                <input type="radio" id="lv_chk_02" name="lv_chk">
                <input type="radio" id="lv_chk_03" name="lv_chk">
                <input type="radio" id="lv_chk_04" name="lv_chk">
            </div>
            <a id="close_btn" class="book_btn"><i class="fa-solid fa-xmark"></i></a>
        </div>
    </div>

    <div class="booking_body">
        <div id="datepicker"></div>
    </div>


</div>

</body>

<%--JS script--%>
<script src="/resources/common/js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
<%--UI--%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>


<script src="/resources/user/js/booking_01.js" type="text/javascript"></script>
<script src="/resources/common/js/calendar_func.js" type="text/javascript"></script>
</html>
