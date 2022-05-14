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
    <style><%@include file="/resources/user/css/pd_list.css"%></style>

    <%--  js 불러오기  --%>



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

        <div class="search_section">
            <div class="search_table">
                <div class="search_row_01">
                    <div class="search_select_01" id="search_kind">
                        <div class="search_head"> 장르 </div>
                        <div class="radio_section">
                            <input type="radio" name="chk_genre" value="gre_total" checked="checked"/>
                                <label class="chk_label">전체</label>
                            <input type="radio" name="chk_genre" value="gre_paint"/>
                                <label class="chk_label">그림</label>
                            <input type="radio" name="chk_genre" value="gre_photo"/>
                                <label class="chk_label">사진</label>
                            <input type="radio" name="chk_genre" value="gre_space"/>
                                <label class="chk_label">공간</label>
                            <input type="radio" name="chk_genre" value="gre_activity"/>
                                <label class="chk_label">그림</label>
                        </div>
                    </div>
                    <div class="search_select_02" id="search_area">
                        <div class="search_head"> 지역 </div>
                        <div class="radio_section">
                            <input type="checkbox" name="chk_region" value="rg_total" />
                                <label class="chk_label">전체</label>
                            <input type="checkbox" name="chk_region" value="rg_total" />
                                <label class="chk_label">서울</label>
                            <input type="checkbox" name="chk_region" value="rg_total" />
                                <label class="chk_label">인천광역시</label>
                            <input type="checkbox" name="chk_region" value="rg_total" />
                                <label class="chk_label">경기도</label>
                            <input type="checkbox" name="chk_region" value="rg_total" />
                                <label class="chk_label">충청도</label>
                            <input type="checkbox" name="chk_region" value="rg_total" />
                                <label class="chk_label">경상도</label>
                            <input type="checkbox" name="chk_region" value="rg_total" />
                                <label class="chk_label">전라도</label>

                        </div>
                    </div>
                </div>
                <div class="search_row_02">
                    <div class="keyword_box">
                        <select name="keyword">
                            <option value="전체" selected="selected">전체검색</option>
                            <option value="이름">전시이름</option>
                            <option value="태그">태그</option>
                        </select>
                    </div>
                    <div class="keyword_area"><input type="search"/></div>
                </div>
                <div class="search_row_03">
                    <button class="search_btn">검색하기</button>
                </div>
            </div>
        </div>

        <div class="list_section"></div>



    </div>
</div>

</body>


<%--js  불러오기 --%>
    <script src="/resources/common/js/common.js" type="text/javascript"></script>
    <script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</html>
