
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

    <%-- css 불러오기 --%>
    <style><%@include file="/resources/common/css/reset.css" %></style>
    <style><%@include file="/resources/user/css/myPage_viewTicket.css" %></style>

    <title>view Ticket</title>
</head>
<body>

    <div class="viewTicket_container">

        <%-- 1. 예약번호 --%>

        <div class="booking_no_section">
            <div class="arrow_div">
                <i class="fa-solid fa-arrow-left" onclick="self.close()"></i>
            </div>

            <div class="number_section">
            <span>No.</span>
            <span class="booking_no">267595037</span>
            </div>
        </div>

            <p class="sectionLine"></p>

        <%-- 2. QR 코드 --%>

        <div class="qr_code_section">
            <div class="qr_code"><img src="/resources/user/resource/myPage/qr_code_01.png" style= "width: 200px; height: 200px "></div>
        </div>

            <p class="sectionLine"></p>

        <%-- 3. 정보 전체 영역 --%>
        <div class="info_all">

                <%-- label --%>
                <div class="product_name_section">
                    <span class="pd_label_1">전시명</span>
                    <span class="pd_label_2">일정</span>
                    <span class="pd_label_2">내역</span>
                    <span class="pd_label_3">관람장소</span>
                </div>

                <%-- value --%>
                <div class="product_value_section">


                     <div class="pd_name"> 사울레이터 창문을 통해 어렴풋이 dsdfsdfsㄴㅇ런ㅇ리ㅏㅓ니ㅏ러  </div>


                    <div class="schedule_section">
                    <span class="pd_date">2022.1.1</span>
                    <span class="pd_time">11:00</span>
                    </div>

                    <div class="type_section">
                    <span class="pd_type">성인</span>
                    <span class="pd_unit">1</span>
                    <span>명</span>
                    </div>

                    <div class="address_section">
                        <span>[</span>
                        <span class="pd_place">피크닉</span>
                        <span>]</span>
                        <span class="pd_address">서울 중구 남창동 194 fkfsldkjfskㄴ이라너이라ㅓ</span>
                    </div>

                </div>


                <div class="product_unit_section">
                </div>


                <div class="product_place_section">
                </div>

        </div>

    </div> <%-- viewTicket_container --%>


</body>

<%-- script --%>
<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/resources/user/js/myPage_myTicket.js"></script>

</html>
