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
    <style><%@include file="/resources/user/css/main_rankPage.css"%></style>

<%--hover datepicker--%>
<%--https://stackoverflow.com/questions/44433406/hover-state-for-active-row-in-ui-datepicker--%>


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

        <div class="tab_wrap">
            <div class="tab_menu"><button class="tab_btn" id="total_btn">전체</button></div>
            <div class="tab_menu"><button class="tab_btn" id="exhibit_btn">전시</button></div>
            <div class="tab_menu"><button class="tab_btn" id="museum_btn">뮤지엄</button></div>
        </div>

        <div class="period_wrap">
            <div class="selector_wrap">
                <select class="date_selector">
                    <option name="date_day" value="day" selected="selected">일별</option>
                    <option name="date_month" value="month">주간</option>
                    <option name="date_year" value="year">월별</option>
                </select>
            </div>

            <div class="picker_wrap">

                <div class="datepicker_box" id="datebox_day">
                    <span><i class="fa-solid fa-calendar"></i></span><input class="datepicker" id="picker_date"></input>
                </div>

                <div class="datepicker_box" id="datebox_month">
                    <span><i class="fa-solid fa-calendar"></i></span><input class="datepicker" id="picker_month"></input>
                </div>
                <div class="datepicker_box" id="datebox_year">
                    <span><i class="fa-solid fa-calendar"></i></span><input class="datepicker" id="picker_year"></input>
                </div>
            </div>
        </div>

        <div class="rank_board_wrap">
            <ul class="rank_box">
                <li class="rank_list">
                    <a href="#">
                        <div class="rank_number">1</div>
                        <div class="rank_img"><img src="/resources/user/resource/home/ex_prom_01.png"></div>
                        <div class="table_wrap">
                            <table class="rank_info">
                                <tbody>
                                    <tr class="table_row title_row">
                                        <td class="row_content pd_title">팀 버튼 특별전</td>
                                    </tr>
                                    <tr class="table_row place_orw">
                                        <td class="row_content pd_place">DDP배움터 디자인전시관(B2F)</td>
                                    </tr>
                                    <tr class="table_row period_row">
                                        <td class="row_content pd_period">
                                            <div class="start_date">22.04.30</div>
                                            ~
                                            <div class="end_date">22.10.26</div>
                                        </td>
                                    </tr>
                                    <tr class="table_row percent_row">
                                        <td class="row_content ticket_percent">32%</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </a>
                </li>
                <li class="rank_list">
                    <a href="#">
                        <div class="rank_number">2</div>
                        <div class="rank_img"><img src="/resources/user/resource/home/ex_prom_01.png"></div>
                        <div class="table_wrap">
                            <table class="rank_info">
                                <tbody>
                                <tr class="table_row title_row">
                                    <td class="row_content pd_title">사울레이터 : 창문을 통해 어렴풋이 </td>
                                </tr>
                                <tr class="table_row place_orw">
                                    <td class="row_content pd_place">피크닉</td>
                                </tr>
                                <tr class="table_row period_row">
                                    <td class="row_content pd_period">
                                        <div class="start_date">22.07.30</div>
                                        ~
                                        <div class="end_date">22.10.26</div>
                                    </td>
                                </tr>
                                <tr class="table_row percent_row">
                                    <td class="row_content ticket_percent">10%</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </a>
                </li>

            </ul>
        </div>


    </div>
</div>

</body>


<%--js  불러오기 --%>


<script src="/resources/common/js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
<script src="/resources/common/js/common.js" type="text/javascript"></script>
<script src="/resources/user/js/main_rankPage.js" type="text/javascript"></script>

<%--date Picekr--%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>



</html>
