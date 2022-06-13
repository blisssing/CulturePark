<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>CulturePark 우리들의 문화공간</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <%--css include--%>
    <style><%@include file="/resources/common/css/reset.css"%> </style>
    <style><%@include file="/resources/user/css/booking_common.css"%></style>

</head>

<body>

    <div class="bookingContainer">
        <div class="booking_header">
            <div class="pd_info">
                <div class="pd_title">반 고흐 언사이드 : 더 씨어터</div>
                <div class="pd_space">그라운드시소 명동</div>
                <div class="pd_schedule">
                    <div class="schedule_date">2022.05.20</div>
                    <div class="schedule_time">
                        <div class="time_round">1</div>
                        <div class="unit">회</div>
                        <div class="round_time">10:00</div>
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

        </div>

        <div class="booking_footer">
            <div class="total_price">
                <div class="price_head">결제금액</div>
                <div class="price_mount">13,600</div>
                <div class="price_unit">원</div>
            </div>
            <div class="decide_btn">
                <a>구매할 가격의 매수를 선택해주세요</a>
            </div>
        </div>

    </div>

</body>
    <%--JS script--%>
    <script src="/resources/common/js/jquery-3.6.0.min.js" type="text/javascript"></script>
    <script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
</html>
