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

      <div class="contentContainer"></div>

      <div class="quickContainer">
        <ul class="quick_wrap">
          <li class="quickList"><a class="quick_link" href="/faqPage.do">FAQ</a></li>
          <li class="quickList"><a class="quick_link" href="/bookingGuide.do">예매안내</a></li>
          <li class="quickList"><a class="quick_link" href="/ticketingGuide.do">발권안내</a></li>
          <li class="quickList"><a class="quick_link" href="/refundGuide.do">환불안내</a></li>
        </ul>
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
