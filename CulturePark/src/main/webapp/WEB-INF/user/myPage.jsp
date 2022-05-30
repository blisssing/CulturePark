<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

    <%-- css 불러오기 --%>
    <style><%@include file="/resources/common/css/reset.css" %></style>
    <style><%@include file="/resources/common/css/common.css" %></style>
    <style><%@include file="/resources/user/css/common_header.css"%></style>
    <style><%@include file="/resources/user/css/common_footer.css"%></style>
    <style><%@include file="/resources/user/css/common_side.css"%></style>
    <style><%@include file="/resources/user/css/myPage.css" %></style>
    <style><%@include file="/resources/user/css/myPage_subMenu.css" %></style>

    <%-- script --%>
    <script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>

    <title>myPage</title>

</head>
<body>

<%-- Main --%>
<div class="mainContainer">
<%-- 절대 건드리지말기. class이름 공통으로 가져가기. div 따로 만들어주고 건드리기 --%>
    <%-- haader --%>
    <div class="header_container">
        <%@ include file="/WEB-INF/user/main_header.jsp"%>
    </div>

    <%-- center --%>
    <div class="centerContainer">
        <%-- 절대 건드리지말기. class이름 공통으로 가져가기. div 따로 만들어주고 건드리기 --%>
        <%-- 이곳에 페이지를 import --%>
        <%--index--%>

        <%-- 내부 영역을 한 번 감싸주는 영역.  --%>

            <div class="innerContainer">
        <div class="innerContainer">

            <%-- subMenu --%>
            <div class="subMenu_container">
                <%@ include file="/WEB-INF/user/myPage_subMenu.jsp"%>
            </div>

        <%-- content --%>
        <%-- include 하지않고, 직접 기재 (content관련 css는 myPage.css) --%>
            <div class="content_container">

                <%@ include file="/WEB-INF/user/myPage_myTicket.jsp"%>
                <%--<img src="/resources/user/resource/myPage/love.PNG" style= "width: 807.792px; height: 800px;">--%>

            </div> <%-- /content_container --%>

        </div> <%-- /innerContent --%>
    </div> <%-- /centerContainer --%>
</div> <%-- /mainContainer --%>

    <div class="footer_container">
        <%@ include file="/WEB-INF/user/main_footer.jsp"%>
    </div>

</body>
</html>
