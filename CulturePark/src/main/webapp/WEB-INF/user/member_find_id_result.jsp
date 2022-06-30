<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <%
        String resultId = (String) session.getAttribute("findEmail");

        if(resultId != null){


    %>



    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

    <%-- css 불러오기 --%>
    <style><%@include file="/resources/manager/css/main_find_id_result.css" %></style>

    <title>find_id_result</title>
</head>
<body>



<%--성공시--%>
<%--<c:choose>
<c:when test="${mail != null}">--%>
<div class="success_view">

    <div class="container_div">

        <div class="label_section label_div">
            <div class="label">아이디 찾기</div>
        </div>

    <p class="sectionLine_thin"></p>
        <c:set var="email" value="${sessionScope.findEmail}"/>
        <div class="label_section id_section">
            <span>회원님의 아이디는</span>
        </div>

        <div class="label_section id_section">
            <span class="user_id"/>
            ${email}
        </div>

        <div class="label_section id_section">
            <span class="label">입니다.</span>
        </div>

        <p class="sectionLine_thin"></p>

        <div class="btn_section">
            <input type="button" class="btn login_btn" value="로그인">
            <input type="button" class="btn ok_btn" value="확인">
        </div>

    </div>

</div>

<%
    } else {
%>

<%--</c:when>--%>

<%--실패시--%>
<%--<c:otherwise>--%>
<div class="fail_view">
    <div class="container_div">

        <div class="icon_section">
            <i class="fa-solid fa-triangle-exclamation"></i>
        </div>

        <div class="label_section_row">
            <span>존재하지 않는 회원정보입니다.</span>
            <span>다시 입력해주세요.</span>
        </div>

        <div class="btn_section">
            <input type="button" class="ok_btn" value="확인">
        </div>

    </div>
</div>
<%--
</c:otherwise>
</c:choose>
--%>

<%--<%
    number = fdsafdsa.getParemeter("a");

    if (number == 1) {
%>

<div> !@!@!@!@!</div>

<%
    } else if (number == 2) {

%>


<div>`11`1실패</div>
--%>

<%
    }
%>
</body>

<%-- script --%>
<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/resources/user/js/member_find_id.js"></script>


</html>
