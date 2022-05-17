
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

    <%-- css 불러오기 --%>
    <style><%@include file="/resources/common/css/reset.css" %></style>
    <style><%@include file="/resources/user/css/myPage_viewCancel.css" %></style>

    <title>view Cancel</title>
</head>
<body>

    <div class="viewCancel_container">

        <%-- 1. 정보 영역 --%>
        <div class="cancel_title_section">

            <div class="booking_name_section">
                <span class="booking_name">사울레이터 창문을 통해 어렴풋이</span><br>
            </div>

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

        </div> <%-- cancel_title_section --%>

            <p class="sectionLine"></p>

        <%-- 2. 결제금액 영역 --%>
        <div class="cancel_purchase_section">

            <div class="purchase_div_section">
                <span class="booking_label">결제금액 합계</span>

                <div class="purchase_div_inner">
                    <span class="booking_purchase">15,000</span><span>원</span>
                </div>
            </div> <%--purchase_div_section--%>

            <div class="deduction_pay_div_section">
                <span class="booking_label_small">차감 합계</span>

                <div class="deduction_pay_div">
                    <span class="deduction_pay">0</span><span>원</span>
                </div>
            </div> <%--deduction_pay_div_section--%>

            <div class="cancellationPee_div_section">
                <span class="booking_label_small">취소 수수료</span>

                <div class="cancellationPee_div">
                    <span class="cancellationPee">0</span><span>원</span>
                </div>
            </div> <%--cancellationPee--%>

            <span class="booking_label_xsmall">(이용 1일 전까지 결제금액의 0% 차감)</span>

        </div> <%-- cancel_purchase_section --%>

            <p class="sectionLine"></p>


        <%-- 3. 환불금액 영역 --%>
        <div class="refundAmount_section">
            <div class="refundAmount_div_section">
                <span class="booking_label">환불금액</span>

                <div class="refundAmount_div_inner">
                <span class="refundAmount">15,000</span><span>원</span>
                </div> <%--refundAmount_div_inner--%>
            </div>

            <textarea class="reason_cancel" placeholder="예약 취소 사유를 기재해주세요."></textarea>
            <span class="booking_label_small">취소/환불 규정 안내</span>

            <%-- 취소/환불 규정 안내 문구 영역 --%>
            <div class="cancel_refund_guide_section">
                <span class="cancel_refund_guide">취소 시 취소/환불 규정에 따라</span>
                <span class="fee_red">수수료(</span>
                <span class="cancel_refund_fee">0</span>
                <span class="fee_red">)원 가 부과</span>
                <span>됩니다.</span>
            </div> <%-- cancel_refund_guide_section --%>
        </div> <%-- refundAmount_section --%>

            <p class="sectionLine"></p>

            <%-- 4. 취소 안내 영역 --%>

        <div class="cancel_check_div">
        <div class="cancel_check_section">

            <div class="cancel_guide_section">
                <span class="cancel_guide">취소하시겠습니까?</span>
            </div> <%-- cancel_guide_section --%>

            <div class="cancel_guide_section2">
                <span>취소 후 </span><span class="cancel_guide_blue">최대 3~5 영업일</span>
                <span>이내 카드 승인이 취소됩니다.</span>
            </div> <%--cancel_guide_section --%>

        </div> <%-- cancel_check_section --%>

            <div class="button_section">
                <button class="cancel_no_btn">아니오</button>
                <button class="cancel_yes_btn">예</button>
            </div>
    </div> <%--cancel_check_div--%>

    </div> <%-- viewCancel_container --%>

</body>

<%-- script --%>
<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/resources/user/js/myPage_viewDetail_viewTicket.js"></script>


</html>
