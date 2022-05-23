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
    <style><%@include file="/resources/user/css/booking_lv_success.css"%></style>

</head>

<body>

<div class="bookingContainer">
    <div class="booking_header">

        <div class="section_title">예매 완료</div>


        <div class="btn_bar">
            <a id="close_btn" class="book_btn"><i class="fa-solid fa-xmark"></i></a>
        </div>
    </div>

    <div class="booking_body">
        <table class="booking_table">
            <tr class="table_row">
                <th class="table_head">제목</th>
                <td class="table_data">반 고흐 언사이드 : 더 씨어터</td>
            </tr>
            <tr class="table_row">
                <th class="table_head">장소</th>
                <td class="table_data">그라운드시소 명동</td>
            </tr>
            <tr class="table_row">
                <th class="table_head">일정</th>
                <td class="table_data">2022.5.19(목)</td>
            </tr>
            <tr class="table_row">
                <th class="table_head">시간</th>
                <td class="table_data">
                    <span class="round_number">2</span>
                    회
                    <span class="round_time">11:00</span>
                </td>
            </tr>
            <tr class="table_row">
                <th class="table_head">티켓</th>
                <td class="table_data">
                    <ul class="ticket_box">
                        <li class="ticket_list">
                            <span class="ticket_case">성인</span>
                            <span class="ticket_number">2</span>
                            명
                        </li>
                        <li class="ticket_list">
                            <span class="ticket_case">청소년</span>
                            <span class="ticket_number">3</span>
                            명
                        </li>
                    </ul>
                </td>
            </tr>
            <tr class="table_row">
                <th class="table_head">금액</th>
                <td class="table_data"><span class="total_price">15000원</span></td>
            </tr>


        </table>
    </div>

    <div class="booking_footer">
        <button id="btn_myTicket" class="btn_footer">마이티켓</button>
        <button id="btn_close" class="btn_footer">창닫기</button>

    </div>

</div>

</body>

<%--JS script--%>
    <script src="/resources/common/js/jquery-3.6.0.min.js" type="text/javascript"></script>
    <script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
    <script src="/resources/user/js/booking_common.js" type="text/javascript"></script>
    <script src="/resources/user/js/booking_success.js" type="text/javascript"></script>
</html>
