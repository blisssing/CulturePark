<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

    <%--  css 불러오기  --%>
    <style><%@include file="/resources/common/css/reset.css"%></style>
    <style><%@include file="/resources/common/css/common.css"%></style>
    <style><%@include file="/resources/common/css/header.css"%></style>

    <style><%@include file="/resources/user/css/pd_list.css"%></style>
    <style><%@include file="/resources/user/css/review_listPage.css"%></style>
    <%-- 기슬 블로그 목록
       jquery로 무한 스크롤 만들기
            -https://velopert.com/1890
            -https://m.blog.naver.com/altmshfkgudtjr/221591364557
            -https://victorydntmd.tistory.com/194
            -https://www.bucketplace.co.kr/post/2020-09-10 -오늘의집-내-무한스크롤-개발기/

            ==> 현시점으로는 불가능한 기술력이므로 생략. 페이징 기법 채택

        페이징 기법

            -https://beaniejoy.tistory.com/25
            -https://upcake.tistory.com/358

        자동완성

            -https://cocoon1787.tistory.com/553
            ★★★★-https://shplab.tistory.com/entry/jQuery제이쿼리-Autocomplete-사용법-및-옵션-살펴보기
            ★★★★-https://programmer93.tistory.com/2

       --%>


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
            <div class="section_name"> 필터 </div>
            <div class="search_table">
                <div class="search_row_01">
                    <div class="search_select_01" id="search_kind">
                        <div class="search_head"> 장르 </div>
                        <ul class="chk_box">
                            <li class="chk_list">
                                <input type="checkbox" name="chk_total" class="gre_total" value="gre_total" checked="checked"/>
                                <label class="chk_label">전체</label>
                            </li>
                            <li class="chk_list">
                                <input type="checkbox" name="chk_genre" id="gre_exhibit" class="gre_genre" value="gre_exhibit"/>
                                <label class="chk_label">전시</label>
                            </li>
                            <li class="chk_list">
                                <input type="checkbox" name="chk_genre" id="gre_museum" class="gre_genre" value="gre_museum"/>
                                <label class="chk_label">뮤지엄</label>
                            </li>
                        </ul>
                    </div>
                    <div class="search_select_02" id="search_area">
                        <div class="search_head"> 지역 </div>
                        <ul class="chk_box">
                            <li class="chk_list">
                                <input type="checkbox" name="chk_region_total" value="rg_total" checked="checked"/>
                                <label class="chk_label">전체</label>
                            </li>
                            <li class="chk_list">
                                <input type="checkbox" name="chk_region" value="rg_region1" />
                                <label class="chk_label">서울</label>
                            </li>
                            <li class="chk_list">
                                <input type="checkbox" name="chk_region" value="rg_region3" />
                                <label class="chk_label">경기</label>
                            </li>
                            <li class="chk_list">
                                <input type="checkbox" name="chk_region" value="rg_region4" />
                                <label class="chk_label">충청</label>
                            </li>
                            <li class="chk_list">
                                <input type="checkbox" name="chk_region" value="rg_region5" />
                                <label class="chk_label">경상</label>
                            </li>
                            <li class="chk_list">
                                <input type="checkbox" name="chk_region" value="rg_region6" />
                                <label class="chk_label">전라</label>
                            </li>

                        </ul>
                    </div>
                </div>
                <div class="search_row_02">
                    <div class="search_head">검색</div>
                    <div class="search_content">
                        <div class="keyword_box">
                            <select class="key_select" name="keyword">
                                <option name="pd_title" value="title" selected="selected">제목</option>
                                <option name="writer"value="writer">작성자</option>
                            </select>
                        </div>
                        <div class="keyword_area"><input id="keywordInput"/></div>
                    </div>
                </div>
                <div class="search_row_extra_01"></div>
                <div class="search_row_03">
                    <button class="search_row_btn" id="search_btn">적용하기</button>
                    <button class="search_row_btn" id="refresh_btn">새로고침</button>
                </div>
            </div>

        </div>

        <div class="board_list_section">
            <div id="page_bar_top" class="page_bar"></div>
            <div class="board_list_wrap">
                <ul class="board_list_box">
                    <li class="board_list">
                        <div class="board_img"></div>
                        <div class="board_info">
                            <div class="info_row_01"></div>
                            <div class="info_row_02"></div>
                            <div class="info_row_03"></div>
                        </div>
                    </li>
                </ul>
            </div>
            <div id="page_bar_bottom" class="page_bar"></div>


        </div>

    </div>
</div>

</body>


<%--js  불러오기 --%>

<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
<script src="/resources/common/js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="/resources/common/js/common.js" type="text/javascript"></script>

</html>
