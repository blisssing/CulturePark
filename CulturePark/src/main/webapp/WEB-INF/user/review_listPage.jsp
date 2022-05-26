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
            <div class="section_head">
                <span>필터</span>
                <button class="filter_slide_btn slide_down"><i class="fa-solid fa-angle-down"></i></button>
                <button class="filter_slide_btn slide_up" ><i class="fa-solid fa-angle-up"></i></button>
            </div>
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
                <div class="search_row_03">
                    <button class="search_row_btn" id="refresh_btn">새로고침</button>
                    <button class="search_row_btn" id="search_btn">적용하기</button>
                </div>
            </div>

        </div>

        <div class="version_section">
            <button class="list_btn"><i class="fa-solid fa-list"></i></button>
            <button class="gallery_btn"><i class="fa-solid fa-image"></i></button>
        </div>


        <div class="board_list_section section_ver_01">
            <div id="page_bar_top" class="page_bar">
                <ul class="number_list">
                    <button class="arrow_button first_btn"><i class="fa-solid fa-angles-left"></i></button>
                    <button class="arrow_button prev_btn"><i class="fa-solid fa-angle-left"></i></button>
                    <li class="page_number"><a href="">1</a></li>
                    <li class="page_number"><a href="">2</a></li>
                    <li class="page_number"><a href="">3</a></li>
                    <li class="page_number"><a href="">4</a></li>
                    <li class="page_number"><a href="">5</a></li>
                    <button class="arrow_button next_btn"><i class="fa-solid fa-angle-right"></i></button>
                    <button class="arrow_button last_btn"><i class="fa-solid fa-angles-right"></i></button>
                </ul>
            </div>
            <div class="board_list_wrap">
                <ul class="board_list_box">
                    <li class="board_list">
                        <div class="board_img">
                            <img src="/resources/user/resource/home/ex_prom_01.png">
                        </div>
                        <div class="table_wrap">
                            <div class="score_wrap">
                                <div class="pd_genre">[전시]</div>
                                <div class="score_box score_star_wrap">
                                    <span class="review_icon star_icon"><i class="fa-solid fa-star"></i></span><span class="star_point">3.5</span>
                                </div>
                                <div class="score_box score_thumb_wrap">
                                    <span class="review_icon thumb_icon"><i class="fa-solid fa-thumbs-up"></i></span><span class="thumb_point">21</span>
                                </div>
                            </div>
                            <table class="board_table">
                                <tr class="table_row table_row_01">
                                    <th class="text_head board_title_head">제목</th>
                                    <td class="text_content board_title">장막 너머의 세상</td>
                                    <th class="text_head board_writer_head">작성자</th>
                                    <td class="text_content board_writer"><a href="#">작성자링크</a></td>
                                </tr>
                                <tr class="table_row table_row_02">
                                    <th class="text_head product_title_head">이름</th>
                                    <td class="text_content product_title" colspan="3"><a href="#">사울레이터 : 창문을 통해 어렴풋이</a></td>
                                </tr>
                                <tr class="table_row table_row_03">
                                    <th class="text_head product_place_head">장소</th>
                                    <td class="text_content product_place" colspan="3">Piknic</td>
                                </tr>
                                <tr class="table_row table_row_04">
                                    <td class="product_link" colspan="4"><button class="link_btn">리 뷰 보 기</button></td>
                                </tr>
                            </table>

                        </div>
                    </li>
                    <li class="board_list">
                        <div class="board_img">
                            <img src="/resources/user/resource/home/ex_prom_01.png">
                        </div>
                        <div class="table_wrap">
                            <div class="score_wrap">
                                <div class="pd_genre">[전시]</div>
                                <div class="score_box score_star_wrap">
                                    <span class="review_icon star_icon"><i class="fa-solid fa-star"></i></span><span class="star_point">3.5</span>
                                </div>
                                <div class="score_box score_thumb_wrap">
                                    <span class="review_icon thumb_icon"><i class="fa-solid fa-thumbs-up"></i></span><span class="thumb_point">21</span>
                                </div>
                            </div>
                            <table class="board_table">
                                <tr class="table_row table_row_01">
                                    <th class="text_head board_title_head">제목</th>
                                    <td class="text_content board_title">장막 너머의 세상</td>
                                    <th class="text_head board_writer_head">작성자</th>
                                    <td class="text_content board_writer"><a href="#">작성자링크</a></td>
                                </tr>
                                <tr class="table_row table_row_02">
                                    <th class="text_head product_title_head">이름</th>
                                    <td class="text_content product_title" colspan="3"><a href="#">사울레이터 : 창문을 통해 어렴풋이</a></td>
                                </tr>
                                <tr class="table_row table_row_03">
                                    <th class="text_head product_place_head">장소</th>
                                    <td class="text_content product_place" colspan="3">Piknic</td>
                                </tr>
                                <tr class="table_row table_row_04">
                                    <td class="product_link" colspan="4"><button class="link_btn">리 뷰 보 기</button></td>
                                </tr>
                            </table>

                        </div>
                    </li>
                    <li class="board_list">
                        <div class="board_img">
                            <img src="/resources/user/resource/home/ex_prom_01.png">
                        </div>
                        <div class="table_wrap">
                            <div class="score_wrap">
                                <div class="pd_genre">[전시]</div>
                                <div class="score_box score_star_wrap">
                                    <span class="review_icon star_icon"><i class="fa-solid fa-star"></i></span><span class="star_point">3.5</span>
                                </div>
                                <div class="score_box score_thumb_wrap">
                                    <span class="review_icon thumb_icon"><i class="fa-solid fa-thumbs-up"></i></span><span class="thumb_point">21</span>
                                </div>
                            </div>
                            <table class="board_table">
                                <tr class="table_row table_row_01">
                                    <th class="text_head board_title_head">제목</th>
                                    <td class="text_content board_title">장막 너머의 세상</td>
                                    <th class="text_head board_writer_head">작성자</th>
                                    <td class="text_content board_writer"><a href="#">작성자링크</a></td>
                                </tr>
                                <tr class="table_row table_row_02">
                                    <th class="text_head product_title_head">이름</th>
                                    <td class="text_content product_title" colspan="3"><a href="#">사울레이터 : 창문을 통해 어렴풋이</a></td>
                                </tr>
                                <tr class="table_row table_row_03">
                                    <th class="text_head product_place_head">장소</th>
                                    <td class="text_content product_place" colspan="3">Piknic</td>
                                </tr>
                                <tr class="table_row table_row_04">
                                    <td class="product_link" colspan="4"><button class="link_btn">리 뷰 보 기</button></td>
                                </tr>
                            </table>

                        </div>
                    </li>
                    <li class="board_list">
                        <div class="board_img">
                            <img src="/resources/user/resource/home/ex_prom_01.png">
                        </div>
                        <div class="table_wrap">
                            <div class="score_wrap">
                                <div class="pd_genre">[전시]</div>
                                <div class="score_box score_star_wrap">
                                    <span class="review_icon star_icon"><i class="fa-solid fa-star"></i></span><span class="star_point">3.5</span>
                                </div>
                                <div class="score_box score_thumb_wrap">
                                    <span class="review_icon thumb_icon"><i class="fa-solid fa-thumbs-up"></i></span><span class="thumb_point">21</span>
                                </div>
                            </div>
                            <table class="board_table">
                                <tr class="table_row table_row_01">
                                    <th class="text_head board_title_head">제목</th>
                                    <td class="text_content board_title">장막 너머의 세상</td>
                                    <th class="text_head board_writer_head">작성자</th>
                                    <td class="text_content board_writer"><a href="#">작성자링크</a></td>
                                </tr>
                                <tr class="table_row table_row_02">
                                    <th class="text_head product_title_head">이름</th>
                                    <td class="text_content product_title" colspan="3"><a href="#">사울레이터 : 창문을 통해 어렴풋이</a></td>
                                </tr>
                                <tr class="table_row table_row_03">
                                    <th class="text_head product_place_head">장소</th>
                                    <td class="text_content product_place" colspan="3">Piknic</td>
                                </tr>
                                <tr class="table_row table_row_04">
                                    <td class="product_link" colspan="4"><button class="link_btn">리 뷰 보 기</button></td>
                                </tr>
                            </table>

                        </div>
                    </li>
                    <li class="board_list">
                        <div class="board_img">
                            <img src="/resources/user/resource/home/ex_prom_01.png">
                        </div>
                        <div class="table_wrap">
                            <div class="score_wrap">
                                <div class="pd_genre">[전시]</div>
                                <div class="score_box score_star_wrap">
                                    <span class="review_icon star_icon"><i class="fa-solid fa-star"></i></span><span class="star_point">3.5</span>
                                </div>
                                <div class="score_box score_thumb_wrap">
                                    <span class="review_icon thumb_icon"><i class="fa-solid fa-thumbs-up"></i></span><span class="thumb_point">21</span>
                                </div>
                            </div>
                            <table class="board_table">
                                <tr class="table_row table_row_01">
                                    <th class="text_head board_title_head">제목</th>
                                    <td class="text_content board_title">장막 너머의 세상</td>
                                    <th class="text_head board_writer_head">작성자</th>
                                    <td class="text_content board_writer"><a href="#">작성자링크</a></td>
                                </tr>
                                <tr class="table_row table_row_02">
                                    <th class="text_head product_title_head">이름</th>
                                    <td class="text_content product_title" colspan="3"><a href="#">사울레이터 : 창문을 통해 어렴풋이</a></td>
                                </tr>
                                <tr class="table_row table_row_03">
                                    <th class="text_head product_place_head">장소</th>
                                    <td class="text_content product_place" colspan="3">Piknic</td>
                                </tr>
                                <tr class="table_row table_row_04">
                                    <td class="product_link" colspan="4"><button class="link_btn">리 뷰 보 기</button></td>
                                </tr>
                            </table>

                        </div>
                    </li>
                </ul>
            </div>
            <div id="page_bar_bottom" class="page_bar">
                <ul class="number_list">
                    <button class="arrow_button first_btn"><i class="fa-solid fa-angles-left"></i></button>
                    <button class="arrow_button prev_btn"><i class="fa-solid fa-angle-left"></i></button>
                    <li class="page_number"><a href="">1</a></li>
                    <li class="page_number"><a href="">2</a></li>
                    <li class="page_number"><a href="">3</a></li>
                    <li class="page_number"><a href="">4</a></li>
                    <li class="page_number"><a href="">5</a></li>
                    <button class="arrow_button next_btn"><i class="fa-solid fa-angle-right"></i></button>
                    <button class="arrow_button last_btn"><i class="fa-solid fa-angles-right"></i></button>
                </ul>
            </div>
        </div>

        <div class="board_list_section section_ver_02">
            <div id="page_bar_top_ver2" class="page_bar">
                <ul>

                </ul>
            </div>
            <div class="board_list_wrap_ver2">
                <table class="board_table_ver2">
                    <tr class="board_row_m">
                        <th>분류</th>
                        <th>제목</th>
                        <th>전시</th>
                        <th>작성자</th>
                        <th><span class="review_icon star_icon"><i class="fa-solid fa-star"></i></span> |
                            <span class="review_icon thumb_icon"><i class="fa-solid fa-thumbs-up"></i></span>
                        </th>
                    </tr>
                    <tr class="board_data_row">
                        <td class="pd_genre">[전시]</td>
                        <td class="board_title"><a href="#">장막 너머의 세상</a></td>
                        <td class="pd_title"><a href="#">사울레이터 : 창문을 통해 어렴풋이</a></td>
                        <td class="board_writer"><a  href="#">희야</a></td>
                        <td class=""><span class="star_point">3.5</span> | <span class="thumb_point">21</span>  </td>
                    </tr>
                    <tr class="board_data_row">
                        <td class="pd_genre">[전시]</td>
                        <td class="board_title"><a href="#">장막 너머의 세상</a></td>
                        <td class="pd_title"><a href="#">사울레이터 : 창문을 통해 어렴풋이</a></td>
                        <td><a class="board_writer" href="#">희야</a></td>
                        <td><span class="star_point">3.5</span> | <span class="thumb_point">21</span>  </td>
                    </tr>
                    <tr class="board_data_row">
                        <td class="pd_genre">[전시]</td>
                        <td class="board_title"><a href="#">장막 너머의 세상</a></td>
                        <td class="pd_title"><a href="#">사울레이터 : 창문을 통해 어렴풋이</a></td>
                        <td><a class="board_writer" href="#">희야</a></td>
                        <td><span class="star_point">3.5</span> | <span class="thumb_point">21</span>  </td>
                    </tr>
                    </tr>

                </table>
            </div>
        </div>

    </div>
</div>

</body>


<%--js  불러오기 --%>

<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
<script src="/resources/common/js/jquery-3.6.0.min.js" type="text/javascript"></script>
<script src="/resources/common/js/common.js" type="text/javascript"></script>
<script src="/resources/user/js/pd_filter.js" type="text/javascript"></script>
<script src="/resources/user/js/review_listPage.js" type="text/javascript"></script>

</html>
