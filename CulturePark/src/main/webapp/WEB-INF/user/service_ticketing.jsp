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
    <style><%@include file="/resources/user/css/common_footer.css"%></style>
    <style><%@include file="/resources/user/css/common_side.css"%></style>

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
                        <div class="guide_head"> 발권 방법 안내</div>
                        <div class="guide_content guide_m">
                            <ul class="description_wrap">
                                <li class="descript_list ">
                                    <div class="descript_head">Step 1<div class="descript_text">마이페이지의 마이티켓으로 이동</div></div>
                                    <div class="descript_img">
                                        <img src="/resources/user/resource/service/ticketing/ticketing01.png">
                                    </div>
                                </li>
                                <li class="descript_list">
                                    <div class="descript_head">Step 2<div class="descript_text">상세보기 클릭</div></div>
                                    <div class="descript_img">
                                        <img src="/resources/user/resource/service/ticketing/ticketing02.png">
                                    </div>
                                </li>
                            </ul>
                        </div>

                    </li>
                    <li class="guide_list">
                        <div class="guide_head"> 기타 안내 </div>
                        <div class="guide_content">
                            * 이미 사용한 것으로 확인되는 티켓은 재사용이 불가능합니다.<br>
                            * 모바일 티켓은 현장에서 실제 티켓으로 교환한 뒤 사용 가능합니다. 이 점 유의하시길 바랍니다.
                        </div>
                    </li>
                </ul>
            </div>

            <div class="quickContainer">
                <%@include file="service_quickMenu.jsp"%>
            </div>

            <div class="footer_container">
                <%@ include file="/WEB-INF/user/main_footer.jsp"%>
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
