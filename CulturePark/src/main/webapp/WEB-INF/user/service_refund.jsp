<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

    <%--  css 불러오기  --%>
    <style><%@include file="/resources/common/css/reset.css"%> </style>
    <style><%@include file="/resources/common/css/common.css"%></style>
    <style><%@include file="/resources/user/css/common_header.css"%></style>
    <style><%@include file="/resources/user/css/service_common.css"%></style>
    <style><%@include file="/resources/user/css/service_ticketGuide.css"%></style>


    <title>CulturePark 우리들의 문화공간</title>

</head>
<body>

<div class="mainContainer">

    <div class="header_container">
        <%@ include file="/WEB-INF/user/main_header.jsp"%>
        <%@ include file="/WEB-INF/user/main_side.jsp"%>
    </div>

    <%-- Contents 영역 --%>
    <div class="centerContainer">
        <div class="innerContainer">
            <div class="contentContainer">
                <ul class="guide_wrap">
                    <li class="guide_list">
                        <div class="guide_head"> 환불규정
                        </div>

                        <div class="guide_content">
                            <ul class="guide_wrap02">
                                <li>
                                    <div class="list_header">취소마감시간</div>
                                    <div class="list_description">
                                        관람일 전일 (평일/주말/공휴일 오후 5시, 토요일 오전 11시)
                                        ®※ 관람일 전일 오후 5시 이후(토요일은 오전 11시) 또는 관람일 당일 예매하신 건에 대해서는 예매후 취소/변경/환불 불가
                                        ※ 토요일이 공휴일인 경우 토요일 오전 11시 기준으로 적용됩니다.
                                    </div>
                                </li>
                                <li>
                                    <div class="list_header">취소수수료안내</div>
                                    <table class="table_type2" border="0" cellpadding="0" cellspacing="0">

                                        <colgroup>
                                            <col style="width:184px">
                                            <col style="width:247px">
                                            <col style="width:290px">
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th>구분</th>
                                            <th>취소수수료</th>
                                            <th>비고</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>예매 후 7일 이내</td>
                                            <td>없음</td>
                                            <td rowspan="5">* 예매당일에 취소하는 경우 이외에는<br>예매수수료가 환불되지 않음 <br>* 예매 후 7일 이내라도 취소시점이 공연일로부터<br>10일 이내라면 그에 해당하는 취소수수료 부과</td>
                                        </tr>
                                        <tr>
                                            <td>예매 후 8일 ~ <br>관람일 10일 전</td>
                                            <td>뮤지컬, 콘서트, 클래식 등 공연권 : 4,000원 <br> 연극, 전시 등 입장권 : 2,000원 <br>(단,티켓 금액의 10% 이내)</td>
                                        </tr>
                                        <tr>
                                            <td>관람일 9일 전 ~ 7일 전</td>
                                            <td>티켓금액의 10%</td>
                                        </tr>
                                        <tr>
                                            <td>관람일 6일 전 ~ 3일 전</td>
                                            <td>티켓금액의 20%</td>
                                        </tr>
                                        <tr>
                                            <td>관람일 2일 전 ~ 1일 전</td>
                                            <td>티켓금액의 30%</td>
                                        </tr>
                                        </tbody></table>
                                </li>
                            </ul>
                        </div>
                    </li>

                    <li class="guide_list">
                        <div class="guide_head"> 환불안내
                        </div>

                        <div class="guide_content guide_m">
                            <ul class="description_wrap">
                                <li class="descript_list">
                                    <div class="descript_head">Step 1<div class="descript_text">마이메뉴-마이티켓 상세보기 클릭</div></div>
                                    <div class="descript_img">
                                        <img src="/resources/user/resource/service/refund/refund01.png">
                                    </div>
                                </li>
                                <li class="descript_list">
                                    <div class="descript_head">Step 2 <div class="descript_text">예매취소 클릭</div></div>
                                    <div class="descript_img">
                                        <img src="/resources/user/resource/service/refund/refund02.png">
                                    </div>
                                </li>

                            </ul>
                        </div>
                    </li>

                </ul>
            </div>

            <div class="quickContainer">
                <%@include file="service_quickMenu.jsp"%>
            </div>
        </div>
    </div>
</div>

</body>


<%--js  불러오기 --%>


<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
<script src="/resources/common/js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="/resources/common/js/common.js" type="text/javascript"></script>
<script src="/resources/user/js/service_common.js" type="text/javascript"></script>
</html>
