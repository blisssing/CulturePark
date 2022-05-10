<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
    <style><%@include file="/resources/common/css/reset.css"%> </style>
    <style><%@include file="/resources/common/css/common.css"%></style>
    <style><%@include file="/resources/common/css/header.css"%></style>
    

    <title>Title</title>
</head>
<body>

<div class="mainContainer">

    <div class="header_container">

        <div class="pc_header">
            <div class="logo_section">
                <div>
                    <a href="#">
                        <p class="main_title">Culture Park</p>
                        <p class="sub_title"> 우리들의 문화공간</p>
                    </a>
                </div>
            </div>

            <div class="function_section">


                <ul class="funcs_pc">
                    <li><a class="func_list" href="#">로그인</a></li>
                    <li><a class="func_list" href="#">회원가입</a></li>
                    <li><a class="func_list" href="#">마이페이지</a></li>
                    <li><a class="func_list" href="#">마이티켓</a></li>
                </ul>

                <div class="funcs_mobile">
                    <h1>이곳에는 토글 버튼이 들어갈 예정입니다</h1>
                </div>

            </div>

        </div>


        <div class="sideMenu_pc">
            <ul class="side_section">
                <li class="sideList"><a href="#">홈</a></li>
                <li class="sideList"><a href="#">전시</a></li>
                <li class="sideList"><a href="#">뮤지엄</a></li>
                <li class="sideList"><a href="#">랭킹</a></li>
                <li class="sideList"><a href="#">리뷰 게시판</a></li>
                <li class="sideList"><a href="#">고객센터</a></li>
            </ul>
        </div>

        <%-- 모바일 토글 버튼 누를시 활성화. 화면 가림

        <div class="sideMenu_mobile">
            <ul class="side_section_m">
                <li class="sideList_m"><a href="#">전시</a></li>
                <li class="sideList_m"><a href="#">뮤지엄</a></li>
                <li class="sideList_m"><a href="#">랭킹</a></li>
                <li class="sideList_m"><a href="#">리뷰 게시판</a></li>
                <li class="sideList_m"><a href="#">고객센터</a></li>
            </ul>
        </div>

        --%>

    </div>

    <%-- Contents 영역 --%>
    <div class="centerContainer">
        <%-- 이곳에 페이지를 import --%>
    </div>
</div>

</body>

</html>
