
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

    <%-- css 불러오기 --%>
    <style><%@include file="/resources/common/css/reset.css" %></style>
    <style><%@include file="/resources/user/css/myPage_viewDetail.css" %></style>

    <title>view Detail</title>
</head>
<body>
        <div class="viewDetail_container">

            <div class="booking_status_section">
                <div class="booking_status_box">
                    <div class="arrow_div">
                        <i class="fa-solid fa-arrow-left" onclick="self.close()"></i>
                    </div>

                    <div class="check_div">
                        <i class="fa-solid fa-circle-check"></i>
                        <span class="booking_status_label">예매 확정</span>
                    </div>
                </div>
            </div>

        <p class="sectionLine"></p>

            <div class="booking_title_section">
               <span>No.</span><span id="booking_no">267595037</span>
                <span id="booking_name">사울레이터 창문을 통해 어렴풋이</span>
            </div>

        <p class="sectionLine"></p>

            <div class="booking_info_section">

                <div class="date_section">
                    <span class="booking_label">일정</span>

                    <div class="date_icon_section">
                        <i class="fa-solid fa-calendar-days"></i>
                        <span class="booking_date"> 2022.1.1</span>
                    </div>

                    <div class="time_icon_section">
                        <i class="fa-solid fa-clock"></i>
                        <span class="booking_time"> 11:00</span>
                    </div>

                </div>

                <div class="type_section">

                    <span class="booking_label">내역</span>

                    <div class="type_unit_value">
                        <span id="booking_type">성인</span><span class="booking_cnt"> 1</span><span class="booking_unit">명</span>
                    </div>

                </div>

            </div> <%-- booking_info_section --%>

            <div class="booking_cancel_section">
                <button class="booking_cancel_btn" id="booking_cancel">예 매 취 소</button>

            </div>

        <p class="sectionLine"></p>

            <div class="booking_place_section">
                <span class="booking_label">관람장소</span>
                <span>[</span><span class="booking_place">피크닉</span><span>]</span>
                <span class="booking_address">서울 중구 남창동 194</span>
            </div>

        <p class="sectionLine"></p>

            <div class="booking_admission_section">
                <span class="booking_label">입장 안내</span>
                <button class="booking_admission_btn"> <i class="fa-solid fa-angle-down"></i></button>

            </div>


            <div class="booking_admission_content_toggle">


                <span class="booking_admission_content">현장 상황에 따라 대기 시간이 발생 할 수 있습니다.<br>
                예매 시간으로부터 +1시간까지 입장 가능합니다.<br>
                마지막 입장가능시간 <span class="last_admissionTime">17:00</span><br>
                전시장 마감 <span class="close_exhibitionTime">18:00</span>
                </span>
            </div>

        <p class="sectionLine"></p>

            <div class="detail_section">

                <div class="label_section">
                    <span class="booking_label">상세 내역</span>
                </div>

            <div class="purchase_no_section">
                <span>주문번호</span>
                <span class="booking_purchase_no"> 202201012345 </span>
            </div>

        <p class="sectionLine"></p>

                <div class="purchase_section">
                <span class="booking_purchase">15,000</span><span>원</span><span class="ok_use">사용가능</span>
                </div>

            </div>

        </div> <%-- viewDetail_container --%>

</body>

<%-- script --%>
<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/resources/user/js/myPage_viewDetail_viewTicket.js"></script>


</html>
