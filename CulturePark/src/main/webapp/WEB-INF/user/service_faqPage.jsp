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
            <div class="contentContainer">
                <div class="search_section">
                    <div class="select_wrap">
                        <div class="search_head">유형</div>
                        <div class="search_input">
                            <select name="select_chk">
                                <option name="select_chk" value="total">전체</option>
                                <option name="select_chk">티켓예매 및 발권</option>
                                <option name="select_chk">환불</option>
                                <option name="select_chk">기타</option>
                            </select>
                        </div>
                    </div>
                    <div class="keyword_wrap">
                        <div class="search_head">제목</div>
                        <div class="search_input"><input type="text"></div>
                    </div>
                </div>
                <div class="table_section">
                    <table class="table_wrap">
                        <tbody>
                            <tr class="row_head table_row">
                                <th class="table_head">유형</th>
                                <th class="table_head">제목</th>
                            </tr>
                            <tr class="table_row data_row">
                                <td class=""></td>

                                <td class="content_title">
                                    <a class="content_link" href="#"></a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="quickContainer">
                <ul class="quick_wrap">
                    <li class="quickList"><a class="quick_link">FAQ</a></li>
                    <li class="quickList"><a class="quick_link">예매안내</a></li>
                    <li class="quickList"><a class="quick_link">모바일발권안내</a></li>
                    <li class="quickList"><a class="quick_link">환불안내</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

</body>


<%--js  불러오기 --%>
<script src="/resources/common/js/common.js" type="text/javascript"></script>
<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
<script src="/resources/common/js/jquery-3.6.0.min.js" type="text/javascript"></script>


</html>
