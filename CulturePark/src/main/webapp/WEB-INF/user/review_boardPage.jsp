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
    <style><%@include file="/resources/user/css/review_boardPage.css"%></style>


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

        <div class="review_board_section">
            <div class="review_info_wrap_m">

                <table class="review_point_table">
                    <tr class="point_row">
                        <th class="avg_head">평균</th>
                        <th class="review_head">리뷰</th>
                        <th class="review_like">LIKE</th>
                    </tr>
                    <tr class="point_row">
                        <td class="avg_point">
                            <i class="fa-solid fa-star"></i>
                            <span class="star_point">3.8</span>
                        </td>
                        <td class="review_point">
                            <i class="fa-solid fa-star"></i>
                            <span class="star_point">3.0</span>
                        </td>
                        <td class="review_thumb">
                            <button class="thumb_btn">
                                <i class="fa-regular fa-thumbs-up"></i>
                                <span class="thumb_point">21</span>
                            </button>
                        </td>
                    </tr>
                </table>
                <table class="review_info_table_m">
                    <tr class="review_row review_row_01">
                        <th class="row_head">제목</th>
                        <td class="row_content review_title" colspan="3"> 창문을 통해 어렴풋이</td>
                    </tr>
                    <tr class="review_row review_row_02">
                        <th class="row_head">Product</th>
                        <td class="row_content" colspan="3"><a class="pd_title" href="">사울레이터 : 창문을 통해 얼렴풋이</a><i class="link_icon fa-solid fa-link"></i></td>
                    </tr>
                    <tr class="review_row review_row_03">
                        <th class="row_head">작성자</th>
                        <td class="row_content" colspan="3"><a class="review_writer" href="">희야</a></td>
                    </tr>
                    <tr class="review_row review_row_04">
                        <th class="row_head">관람일</th>
                        <td class="row_content pd_date">22.04.17</td>
                        <th class="row_head">작성일</th>
                        <td class="row_content review_date">22.05.23</td>
                    </tr>
                </table>

            </div>
            <div class="review_score_wrap pc_wrap">
                <table class="review_point_table">
                    <tr class="point_row">
                        <th class="avg_head">평균</th>
                        <th class="review_head">리뷰</th>
                        <th class="review_like">LIKE</th>
                    </tr>
                    <tr class="point_row">
                        <td class="avg_point">
                            <i class="fa-solid fa-star"></i>
                            <span class="star_point">3.8</span>
                        </td>
                        <td class="review_point">
                            <i class="fa-solid fa-star"></i>
                            <span class="star_point">3.0</span>
                        </td>
                        <td class="review_thumb">
                            <button class="thumb_btn">
                                <i class="fa-regular fa-thumbs-up"></i>
                                <span class="thumb_point" id="thumb_point">21</span>
                            </button>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="review_info_wrap_p pc_wrap">
                <div class="pd_img_wrap">
                    <img class="pd_img" src="/resources/user/resource/home/ex_prom_01.png">
                </div>
                <div class="board_info_wrap">
                    <table class="info_table">
                        <tr class="info_row" id="info_row_01">
                            <th class="row_head">제목</th>
                            <td class="row_content review_title">창문을 통해 어렴풋이</td>
                        </tr>
                        <tr class="info_row" id="info_row_02">
                            <th class="row_head">Product</th>
                            <td class="row_content"><a class="pd_title" href="#">사울레이터 : 창문을 통해 어렴풋이<i class="link_icon fa-solid fa-link"></i></a></td>
                            <th class="row_head">작성자</th>
                            <td class="row_content"><a class="review_writer" href="#">희야</a></td>
                        </tr>
                        <tr class="info_row" id="info_row_03">
                            <th class="row_head">관람일</th>
                            <td class="row_content pd_date">22.07.21</td>
                            <th class="row_head">작성일</th>
                            <td class="row_content review_date">22.09.13</td>
                        </tr>
                    </table>

                </div>
            </div>


            <div class="review_content_section">
<%--                게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물--%>
<%--                게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물--%>
<%--                게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물--%>
<%--                게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물--%>
<%--                게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물--%>
<%--                게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물--%>
<%--                게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물--%>
<%--                게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물--%>
<%--                게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물게시물rptlanf게시물게시물게시물게시물--%>
            </div>

            <div class="review_bottom bottom_m">
                <button class="thumb_btn">
                    <i class="fa-regular fa-thumbs-up"></i>
                    <span class="thumb_point">21</span>
                </button>
                <button class="report_btn">신고하기</button>
                <button class="list_btn">
                    목록으로
                </button>
            </div>
            <div class="review_bottom_p"></div>
        </div>


    </div>
</div>

</body>


<%--js  불러오기 --%>

    <script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
    <script src="/resources/common/js/jquery-3.6.0.min.js" type="text/javascript"></script>
    <script src="/resources/common/js/common.js" type="text/javascript"></script>
    <script src="/resources/user/js/review_boardPage.js" type="text/javascript"></script>

</html>
