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
    <style><%@include file="/resources/user/css/board_section_2.css"%></style>

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
                                <input type="checkbox" name="chk_genre" value="gre_total" checked="checked"/>
                                    <label class="chk_label">전체</label>
                            </li>
                            <li class="chk_list">
                                <input type="checkbox" name="chk_genre" value="gre_paint"/>
                                    <label class="chk_label">그림</label>
                            </li>
                            <li class="chk_list">
                                <input type="checkbox" name="chk_genre" value="gre_photo"/>
                                    <label class="chk_label">사진</label>
                            </li>
                            <li class="chk_list">
                                <input type="checkbox" name="chk_genre" value="gre_space"/>
                                    <label class="chk_label">공간</label>
                            </li>
                            <li class="chk_list">
                                <input type="checkbox" name="chk_genre" value="gre_activity"/>
                                    <label class="chk_label">체험</label>
                            </li>
                        </ul>
                    </div>
                    <div class="search_select_02" id="search_area">
                        <div class="search_head"> 지역 </div>
                        <ul class="chk_box">
                            <li class="chk_list">
                                <input type="checkbox" name="chk_region" value="rg_total" checked="checked"/>
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
                        <div class="keyword_box"><select name="keyword">
                                <option value="이름" selected="selected">전시이름</option>
                                <option value="태그">태그</option>
                            </select></div>
                        <div class="keyword_area"><input id="keywordInput"/></div>
                    </div>
                </div>
                <div class="search_tag_row">
                    <ul class="tag_box">
                        <li class="tag_list"><span class="icon_cancel"><a class="a_icon"><i class="fa-solid fa-xmark"></i></a> </span><span class="tag_text">#가족과함께하는</span></li>
                        <li class="tag_list"><span class="icon_cancel"><a class="a_icon"><i class="fa-solid fa-xmark"></i></a> </span><span class="tag_text">#가족과함께하는</span></li>
                        <li class="tag_list"><span class="icon_cancel"><a class="a_icon"><i class="fa-solid fa-xmark"></i></a> </span><span class="tag_text">#가족과함께하는</span></li>
                        <li class="tag_list"><a class="a_span"><span class="tag_text">#가족과함께하는</span></a></li>
                        <li class="tag_list"><span class="icon_cancel"><a class="a_icon"><i class="fa-solid fa-xmark"></i></a> </span><span class="tag_text">#가족과함께하는</span></li>
                        <li class="tag_list"><span class="icon_cancel"><a class="a_icon"><i class="fa-solid fa-xmark"></i></a> </span><span class="tag_text">#가족과함께하는</span></li>
                    </ul>
                </div>
                <div class="search_row_03">
                    <button class="search_btn">적용하기</button>
                </div>
            </div>
        </div>

        <div class="board_section_2">
            <div class="board_container_mobile">
                <ul class="board_box_2_m">
                    <li class="board_list_2_m">
                        <%-- 300 * 400 이미지만 올릴 것--%>
                        <div class="board_img_2_m">
                            <img src="/resources/user/resource/exhibit/ex_01.png">
                        </div>
                        <div class="board_info_2_m">
                            <div class="board_row_01_m">
                                <div class="info_title_m">
                                    <span class="title_text"> 사울레이터 창문을 통해 어렴풋이</span>
                                </div>
                                <div class="info_score_m">
                                    <div class="i_star">
                                        <i class="fa-solid fa-star"></i>
                                        <div class="star_point">3.5</div>
                                    </div>
                                    <div class="i_thumb">
                                        <i class="fa-solid fa-thumbs-up"></i>
                                        <div class="thumb_point">21</div>
                                    </div>
                                </div>
                            </div>
                            <div class="board_row_02_m">
                                <div class="info_place_m">
                                    <span class="place_text"> 서울 피크닉 </span>
                                </div>
                            </div>
                            <div class="board_row_03_m">
                                <div class="info_period_m">
                                    <span class="period_start">2022.07.21</span> ~ <span class="period_end">2022.09.13</span>
                                </div>
                            </div>
                        </div>
                    </li>

                </ul>
            </div>
<%--            <div class="board_container_pc">--%>
<%--            </div>--%>

        </div>



    </div>
</div>

</body>


<%--js  불러오기 --%>

    <script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="/resources/common/js/common.js" type="text/javascript"></script>

</html>
