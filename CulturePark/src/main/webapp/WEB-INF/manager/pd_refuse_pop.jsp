<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

    <%-- css 불러오기 --%>
    <style><%@include file="/resources/manager/css/pd_refuse_pop.css" %></style>

    <title>refuse popup</title>
</head>
<body>

<div class="popup_container">

    <div class="name_section">
        <div class="title_label">작품명</div>
        <div class="title_value">사울레이터 창문을 통해 어렴풋이</div>
    </div>

    <p class="sectionLine_thin"></p>

    <div class="refuse_section">
        <div class="title_label">거절사유</div>
        <textarea class="title_value title_value_text"></textarea>
    </div>

    <p class="sectionLine_thin"></p>

    <div class="btn_section">
        <input type="button" class="ok_btn" value="확인" onclick="window.self.close()" >
    </div>

</div>

</body>

<%-- script --%>
<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>


</html>
