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
    <style><%@include file="/resources/user/css/common_header.css" %></style>
    <style><%@include file="/resources/user/css/common_footer.css" %></style>
    <style><%@include file="/resources/user/css/common_side.css" %></style>
    <style><%@include file="/resources/user/css/myPage.css" %></style>
    <style><%@include file="/resources/user/css/myPage_subMenu.css" %></style>
    <style><%@include file="/resources/user/css/myPage_levelPage.css" %></style>

    <%--ui--%>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
    <%--<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness">--%>


    <%-- modal --%>
    <script src="/resources/common/js/jquery-3.6.0.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css"/>

    <title>level Page</title>

</head>
<body>

<%-- Main --%>
<div class="mainContainer">
    <%-- 절대 건드리지말기. class이름 공통으로 가져가기. div 따로 만들어주고 건드리기 --%>

    <%-- haader --%>
    <div class="header_container">
        <%@ include file="/WEB-INF/user/main_header.jsp" %>
    </div>

    <%-- center --%>
    <div class="centerContainer">
        <%-- 절대 건드리지말기. class이름 공통으로 가져가기. div 따로 만들어주고 건드리기 --%>
        <%-- 이곳에 페이지를 import --%>
        <%--index--%>

        <%-- 내부 영역을 한 번 감싸주는 영역 --%>
        <div class="innerContainer">

            <%-- subMenu --%>
            <div class="subMenu_container">
                <%@ include file="/WEB-INF/user/myPage_subMenu.jsp" %>
            </div>


            <%-- content --%>
            <%-- include 하지않고, 직접 기재 (content관련 css는 myPage.css) --%>
            <div class="content_container">

                <div class="level_label_section">
                    <span class="level_label">등급별 혜택</span>
                </div>

                <p class="sectionLine_thin"></p>

                <div class="myLevel_section">
                    <div class="myLevel">나의 현재 등급은 ? </div>
                </div>

                <div class="progress_section">
                    <div class="progressbar beginner_bar"></div>
                </div>

                <div class="label_text_section">
                    <div class="label_text">Culture Beginner</div>
                    <div class="label_text">Culture People</div>
                </div>

                <div class="myLevel_section">
                    <div class="myLevel">나의 현재 등급은 ? </div>
                </div>

                <div class="progress_section">
                    <div class="progressbar people_bar"></div>
                </div>

                <div class="label_text_section">
                    <div class="label_text">Culture Beginner</div>
                    <div class="label_text">Culture People</div>
                </div>


                <hr>

                <div class="description_section">
                    <table class="progress_table">
                        <tbody>
                            <tr class="progress_row">
                                <td class="icon_wrap"><i class="fa-solid fa-seedling"></i></td>
                                <td class="rank_wrap">컬쳐 비기너</td>
                                <td class="condition_wrap">누적결제 15만 이상</td>
                                <td class="benefit_wrap">결제금액 3% 포인트 적립</td>
                            </tr>
                            <tr class="progress_row">
                                <td class="icon_wrap"><i class="fa-solid fa-child-reaching"></i></td>
                                <td class="rank_wrap">컬쳐 비기너</td>
                                <td class="condition_wrap">누적결제 30만 이상</td>
                                <td class="benefit_wrap">결제금액 7% 포인트 적립</td>
                            </tr>
                            <tr class="progress_row">
                                <td class="icon_wrap"><i class="fa-solid fa-heart"></i></td>
                                <td class="rank_wrap">컬쳐 비기너</td>
                                <td class="condition_wrap">누적결제 60만 이상</td>
                                <td class="benefit_wrap">결제금액 15% 포인트 적립</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <%-- /content_container --%>

        </div>
        <%-- /innerContent --%>
    </div>
    <%-- /centerContainer --%>

    <div class="footer_container">
        <%@ include file="/WEB-INF/user/main_footer.jsp" %>
    </div>
</div>
<%-- /mainContainer --%>

</body>

<%-- script --%>
<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
<script src="/resources/user/js/myPage_levelPage.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

</html>

