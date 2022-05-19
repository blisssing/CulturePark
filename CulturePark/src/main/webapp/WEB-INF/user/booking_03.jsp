<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>예매하기 페이지 인덱스</title>

    <%--css include--%>
    <style><%@include file="/resources/common/css/reset.css"%> </style>
    <style><%@include file="/resources/user/css/booking_common.css"%></style>

</head>

<body>

<div class="booking_header">
    <div class="pd_info">
        <div class="pd_title"></div>
        <div class="pd_space"></div>
        <div class="pd_schedule"></div>
        <div class="pd_tickets"></div>
    </div>
</div>

<div class="booking_body">

</div>

<div class="booking_footer">
    <div class="total_price"></div>
    <div class="decide_btn"><a></a></div>
</div>

</body>
<%--JS script--%>
<script src="/resources/common/js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
</html>
