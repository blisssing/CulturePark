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
    <style><%@ include file="/resources/user/css/main_home.css"%></style>

    <%--  js 불러오기  --%>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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

        <div class="event_section">
            <div class="section_name"><span> 이벤트 영역 </span></div>
            <div class="slide_section">
                <ul class="img_box">
                    <%-- 이미지 규격 1200*400 --%>
                    <li class="img_list" id="ev_img_li_01"><img src="/resources/user/resource/home/event_img_01.png"></li>
                    <li class="img_list" id="ev_img_li_02"><img src="/resources/user/resource/home/event_img_02.png"></li>
                    <li class="img_list" id="ev_img_li_03"><img src="/resources/user/resource/home/event_img_03.png"></li>
                </ul>
                <div class="btn_section">
                    <button type="button" class="btn_prev"><i class="fa-solid fa-angle-left"></i></button>
                    <button type="button" class="btn_next"><i class="fa-solid fa-angle-right"></i></button>
                </div>

                <div class="radio_section">
                    <input type="radio" id="evt_chk_01" name="evt_chk" checked="checked">
                    <input type="radio" id="evt_chk_02" name="evt_chk">
                    <input type="radio" id="evt_chk_03" name="evt_chk">
                </div>


            </div>
        </div>
        <div class="ex_promotion_section">
            <div class="section_name"><a class="prom_link"><span> 전시회</span></a></div>

            <div class="slide_section">
                <li class="prom_list"> </li>
                <li class="prom_list"> </li>
                <li class="prom_list"> </li>
                <li class="prom_list"> </li>
                <li class="prom_list"> </li>
                <li class="prom_list"> </li>
            </div>

            <div class="slide_section_m">
                <li class="prom_list_m"> </li>
                <li class="prom_list_m"> </li>
                <li class="prom_list_m"> </li>
                <li class="prom_list_m"> </li>
                <li class="prom_list_m"> </li>
                <li class="prom_list_m"> </li>
            </div>

        </div>
        <div class="mu_promotion_section">
            <div class="section_name"><a class="prom_link"><span> 뮤지엄</span></a></div>

            <div class="slide_section">
                <li class="prom_list"> </li>
                <li class="prom_list"> </li>
                <li class="prom_list"> </li>
                <li class="prom_list"> </li>
                <li class="prom_list"> </li>
                <li class="prom_list"> </li>
            </div>

            <div class="slide_section_m">
                <li class="prom_list_m"> </li>
                <li class="prom_list_m"> </li>
                <li class="prom_list_m"> </li>
                <li class="prom_list_m"> </li>
                <li class="prom_list_m"> </li>
                <li class="prom_list_m"> </li>
            </div>

        </div>



    </div>
</div>

</body>


<%--js  불러오기 --%>
<script src="/resources/common/js/toggle_btn.js" type="text/javascript"></script>
<script src="/resources/user/js/main_home.js" type="text/javascript"></script>
<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>


</html>


<%--<div class="btn_section">--%>
<%--    <button type="button"><i class="fa-solid fa-angle-left"></i></button>--%>
<%--    <button type="button"><i class="fa-solid fa-angle-right"></i></button>--%>
<%--</div>--%>