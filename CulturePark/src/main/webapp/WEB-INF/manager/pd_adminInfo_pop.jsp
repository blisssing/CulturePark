<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

    <div class="icon_section">
        <div class="icon"><i class="fa-solid fa-user-tie"></i></div>
    </div>

    <div class="adminEmail_section">
        <div class="title_label">관리자 이메일</div>
        <div class="title_value">admin01@naver.com</div>
    </div>

    <div class="adminTel_section">
        <div class="title_label">관리자 연락처</div>
        <div class="title_value">010-0000-1111</div>
    </div>

    <div class="btn_section">
        <input type="button" class="ok_btn" value="확인" onclick="window.self.close()">
    </div>



</div>

</body>

<%-- script --%>
<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>


</html>
