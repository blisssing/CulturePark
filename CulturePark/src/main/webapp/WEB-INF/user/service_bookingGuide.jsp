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
    <style><%@include file="/resources/common/css/header.css"%></style>
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
                        <div class="guide_head"> 예매 방법 안내
                            <div class="guide_radio">
                                <input type="radio" name="guide_chk" value="mobile" checked="checked"> 모바일
                                <input type="radio" name="guide_chk" value="pc"> pc
                            </div>
                        </div>
                        <div class="guide_content guide_pc">
                            <ul class="description_wrap">
                                <li class="descript_list">
                                    <div class="descript_head">Step 1<div class="descript_text">PC 원하는 상품의 예매하기 버튼 클릭</div></div>
                                    <div class="descript_img">
                                        <img src="/resources/user/resource/service/booking/bookingGuide_m_01.png">
                                    </div>
                                </li>
                                <li class="descript_list">
                                    <div class="descript_head">Step 2 <div class="descript_text">원하는 날짜 선택</div></div>
                                    <div class="descript_img">
                                        <img src="/resources/user/resource/service/booking/bookingGuide_m_02.png">
                                    </div>
                                </li>
                                <li class="descript_list">
                                    <div class="descript_head">Step 3 <div class="descript_text">원하는 시간대 선택</div></div>
                                    <div class="descript_img">
                                        <img src="/resources/user/resource/service/booking/bookingGuide_m_03.png">
                                    </div>
                                </li>
                                <li class="descript_list">
                                    <div class="descript_head">Step 4 <div class="descript_text">유형별 인원 수 선택</div></div>
                                    <div class="descript_img">
                                        <img src="/resources/user/resource/service/booking/bookingGuide_m_04.png">
                                    </div>
                                </li>
                                <li class="descript_list">
                                    <div class="descript_head">Step 5 <div class="descript_text">결제하기 클릭</div></div>
                                    <div class="descript_img">
                                        <img src="/resources/user/resource/service/booking/bookingGuide_m_05.png">
                                    </div>
                                </li>
                                <li class="descript_list">
                                    <div class="descript_head">Step 6 <div class="descript_text">결제 진행</div></div>
                                    <div class="descript_img">
                                        <img src="/resources/user/resource/service/booking/bookingGuide_m_06.png">
                                    </div>
                                </li>

                            </ul>
                        </div>

                        <div class="guide_content guide_m">
                            <ul class="description_wrap">
                                <li class="descript_list">
                                    <div class="descript_head">Step 1<div class="descript_text">모바일 : 원하는 상품의 예매하기 버튼 클릭</div></div>
                                    <div class="descript_img">
                                        <img src="/resources/user/resource/service/booking/bookingGuide_m_01.png">
                                    </div>
                                </li>
                                <li class="descript_list">
                                    <div class="descript_head">Step 2 <div class="descript_text">원하는 날짜 선택</div></div>
                                    <div class="descript_img">
                                        <img src="/resources/user/resource/service/booking/bookingGuide_m_02.png">
                                    </div>
                                </li>
                                <li class="descript_list">
                                    <div class="descript_head">Step 3 <div class="descript_text">원하는 시간대 선택</div></div>
                                    <div class="descript_img">
                                        <img src="/resources/user/resource/service/booking/bookingGuide_m_03.png">
                                    </div>
                                </li>
                                <li class="descript_list">
                                    <div class="descript_head">Step 4 <div class="descript_text">유형별 인원 수 선택</div></div>
                                    <div class="descript_img">
                                        <img src="/resources/user/resource/service/booking/bookingGuide_m_04.png">
                                    </div>
                                </li>
                                <li class="descript_list">
                                    <div class="descript_head">Step 5 <div class="descript_text">결제하기 클릭</div></div>
                                    <div class="descript_img">
                                        <img src="/resources/user/resource/service/booking/bookingGuide_m_05.png">
                                    </div>
                                </li>
                                <li class="descript_list">
                                    <div class="descript_head">Step 6 <div class="descript_text">결제 진행</div></div>
                                    <div class="descript_img">
                                        <img src="/resources/user/resource/service/booking/bookingGuide_m_06.png">
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
<script src="/resources/user/js/service_ticketGuide.js" type="text/javascript"></script>


</html>
