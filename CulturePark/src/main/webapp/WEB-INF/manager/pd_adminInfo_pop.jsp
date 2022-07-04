<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

    <%-- css 불러오기 --%>
    <style><%@include file="/resources/manager/css/pd_adminInfo_pop.css" %></style>

    <title>adminInfo popup</title>
</head>
<body>

<div class="popup_container">
    <c:forEach var="adminVO" items="${adminList}" varStatus="status">
        <input type="hidden" class="ad_seq$${status.count}" value="${adminVO.ad_seq}">
        <input type="hidden" class="ad_email${status.count}" value="${adminVO.ad_email}">
        <input type="hidden" class="ad_tel${status.count}" value="${adminVO.ad_tel}">
    </c:forEach>

    <div class="icon_section">
        <div class="icon"><i class="fa-solid fa-user-tie"></i></div>
    </div>

    <div class="sectionType1">
    <select class="admin_select" >
        <c:forEach begin="1" end="${adminList.size()}" varStatus="status">
            <option value="${status.count}">${status.count}</option>
        </c:forEach>
    </select>
    </div>


    <div class="adminEmail_section">
        <div class="title_label">관리자 이메일</div>
        <div class="title_value">${adminList.get(0).ad_email}</div>
    </div>

    <div class="adminTel_section">
        <div class="title_label">관리자 연락처</div>
        <div class="title_value">${adminList.get(0).ad_tel}</div>
    </div>

    <div class="btn_section">
        <input type="button" class="ok_btn" value="확인" onclick="window.self.close()">
    </div>



</div>

</body>

<%-- script --%>
<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>


</html>
