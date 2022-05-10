<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

    <%-- css 불러오기 --%>
    <style>
        <%@include file="/resources/common/css/reset.css" %>
    </style>
    <style>
        <%@include file="/resources/common/css/common.css" %>
    </style>
    <style>
        <%@include file="/resources/user/css/myPage.css" %>
    </style>

    <%-- script --%>
    <script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>

    <title>myPage</title>

</head>
<body>

<%-- [Main] --%>
<div class="main_section">

    <%-- <myPage> --%>
    <div class="myPage">

        <%--1.라벨--%>
        <div class="myPage_txt">MY PAGE</div>

        <%--2.회원 등급--%>
        <div class="myInfo_txt">
            <span class="myName">김진아</span>"님은 현재"<br>

            <a href="#현재등급정보+다음등급까지의게이지" class="grade" target="_blank">
                <span class="culture_beginner">Culture Beginner</span>
            </a>"회원입니다."
        </div>

         <div class="level">
            <div class="level_btn">
            <a href="#고객센터_마이멤버십" target="_blank" alt="등급별 혜택">등급별 혜택</a>
            </div>
         </div>

        <%-- 3.적립금 영역 --%>
        <div class="saved_money">
            <span class="savedM_txt">적립금</span>

            <div class="savedM_btn">
            <a href="#고객센터_마이멤버십" target="_blank" alt="적립금">0</a>"p"
            </div>
        </div> <%-- /saved_money --%>

    </div><%-- /myPage --%>

<%-- <subMenu> --%>
<div class="subMenu">
    <ul class="sub_section">
        <li><a class="subList" href="#">마이티켓</a></li>
        <li><a class="subList" href="#">찜목록</a></li>
        <li><a class="subList" href="#">마이리뷰</a></li>
        <li><a class="subList" href="#">회원정보</a></li>
    </ul>
</div> <%-- /subMenu --%>

<%-- <content> --%>
<div class="content">


</div> <%-- /content--%>

</div> <%-- /Main --%>

</body>
</html>
