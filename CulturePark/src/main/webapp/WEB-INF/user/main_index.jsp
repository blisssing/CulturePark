<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

<%--  동적 변화


 https://stackoverflow.com/questions/64299234/how-to-include-jsp-file-inside-another-jsp-file-using-jquery

 --%>


<%--  css 불러오기  --%>
    <style><%@include file="/resources/common/css/reset.css"%> </style>
    <style><%@include file="/resources/common/css/common.css"%></style>
    <style><%@include file="/resources/user/css/common_header.css"%></style>
    <style><%@include file="/resources/user/css/common_footer.css"%></style>
    <style><%@include file="/resources/user/css/common_side.css"%></style>


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
        <%-- 이곳에 페이지를 import --%>
    </div>

    <div class="footer_container">
        <%@ include file="/WEB-INF/user/main_footer.jsp"%>
    </div>
</div>

</body>


<%--js  불러오기 --%>
    <script src="/resources/common/js/jquery-3.6.0.min.js" type="text/javascript"></script>
    <script src="/resources/common/js/common.js" type="text/javascript"></script>
    <script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>



</html>
