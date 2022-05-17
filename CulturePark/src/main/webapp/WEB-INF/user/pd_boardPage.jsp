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
    <style><%@include file="/resources/user/css/pd_boardPage.css"%></style>
    <style><%@include file="/resources/user/css/pd_board_header.css"%></style>


    <title>CulturePark 우리들의 문화공간</title>
</head>
<body>

<div class="mainContainer">

    <div class="header_container">
        <%@ include file="/WEB-INF/user/main_header.jsp"%>
        <%@ include file="/WEB-INF/user/main_side.jsp"%>
        <%@ include file="/WEB-INF/user/pd_board_header.jsp"%>
    </div>

    <%-- Contents 영역 --%>
    <div class="centerContainer">
        <%-- 이곳에 페이지를 import --%>



        <div class="pdContainer">

            <div class="pdContainer_m">

                <div id="pd_section_m_01" class="pd_section_m">

                    <div class="section_one_m">
                        <div class="pd_img"><img src="/resources/user/resource/exhibit/img/ex_01_b.png"></div>
                        <div class="pd_img_02">
                            <img src="/resources/user/resource/exhibit/img/ex_01.png">
                            <div class="pd_img_title">사울 레이터의 사진전</div>
                            <div class="pd_score_box">
                                <div class="score_star"><i class="fa-solid fa-star"></i><span class="star_point">3.8</span></div>
                                <div class="score_thumb"><i class="fa-solid fa-thumbs-up"></i><span class="thumb_point">21</span></div>
                            </div>
                        </div>
                    </div>

                    <div class="section_two_m">
                        <ul class="board_cal_01_m">
                            <li class="cal_01_row_01_m">기간</li>
                            <li class="cal_01_row_02_m">장소</li>
                            <li class="cal_01_row_03_m">주최</li>
                            <li class="cal_01_row_04_m">관람시간</li>
                            <li class="cal_01_row_05_m">금액</li>
                        </ul>
                        <ul class="board_cal_02_m">
                            <li class="cal_02_row_01">
                                <span class="info_period_start">2022.07.21</span>
                                ~
                                <span class="info_period_start">2022.09.13</span>
                            </li>
                            <li class="cal_02_row_02">
                                <span class="info_space">Picknik</span>
                            </li>
                            <li class="cal_02_row_03">
                                <span class="info_company">PicknicCompany</span>
                            </li>
                            <li class="cal_02_row_04">
                                <span class="info_timeLimit">110</span>
                                <span class="info_tail">분</span>
                            </li>
                            <li class="cal_02_row_05">
                                <div class="info_price_per">
                                    <span class="span_head">최대가 : </span><span class="unit_name"><성인></성인></span>
                                    <span class="unit_price"> 12000원</span>
                                    <button id="btn_price_detail">상세보기</button>
                                </div>
                            </li>
                        </ul>
                    </div>

                </div>
                <div class="pd_section_p">
                </div>

            </div>

            <div class="pdContainer_p"></div>

            <div class="sideContainer"></div>
        </div>

        <div class="buttonContainer">
            <div class="button_section">
                <div class="btn_content_select">
                    <ul class="btn_c_s_box">
                        <li id="c_s_01_m" class="btn_content_list"><button id="btn_mainInfo">이 용 정 보</button></li>
                        <li id="c_s_02_m" class="btn_content_list"><button id="btn_extraInfo">부 가 정 보</button></li>
                        <li id="c_s_03_m" class="btn_content_list"><button id="btn_reviewInfo">리 뷰 보 기</button></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="content_container">

        </div>


    </div>


    <div class="footer_container"></div>

</div>

</body>


<%--js  불러오기 --%>

<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/resources/common/js/common.js" type="text/javascript"></script>
<script src="/resources/user/js/pd_board.js" type="text/javascript"></script>


</html>
