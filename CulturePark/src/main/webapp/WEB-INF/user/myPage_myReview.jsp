
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

    <style><%@include file="/resources/user/css/common_header.css"%></style>
    <style><%@include file="/resources/user/css/common_footer.css"%></style>
    <style><%@include file="/resources/user/css/common_side.css"%></style>

    <style><%@include file="/resources/user/css/myPage.css" %></style>
    <style><%@include file="/resources/user/css/myPage_subMenu.css" %></style>
    <style><%@include file="/resources/user/css/myPage_myReview.css" %></style>


    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>

    <title>my Review</title>
</head>
<body>

<%-- Main --%>
<div class="mainContainer">
    <%-- 절대 건드리지말기. class이름 공통으로 가져가기. div 따로 만들어주고 건드리기 --%>

    <%-- haader --%>
    <div class="header_container">
        <%@ include file="/WEB-INF/user/main_header.jsp"%>
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
                <%@ include file="/WEB-INF/user/myPage_subMenu.jsp"%>
            </div>

            <%-- content --%>
            <%-- include 하지않고, 직접 기재 (content관련 css는 myPage.css) --%>
            <div class="content_container">


                    <div class="label_section">마이리뷰</div>
                    <p class="sectionLine_thin"></p>


                <%-- 테이블 구성 --%>
                <div class="fix_relative">

                <div class="scroll_section">

                <table class="table_list">

                        <thead>
                        <tr>
                            <th class="pd_seq cal_01">seq</th>
                            <th class="pd_name" >이름</th>
                            <th class="pd_date">관람일</th>
                            <th class="pd_score">별점</th>
                            <th class="pd_like">좋아요</th>
                            <th class="pd_cnt">조회</th>
                        </tr>
                        </thead>




                    <tbody>
                        <tr class="table_row_section">
                            <td class="seq cal_01">1</td>
                            <td class="pd_name">사울레이터</td>
                            <td class="pd_price">22/05/19</td>
                            <td class="pd_score">4.5</td>
                            <td class="pd_like">5</td>
                            <td class="pd_cnt">20</td>
                        </tr>
                        <tr>
                            <td class="seq cal_01">2</td>
                            <td class="pd_name">요시고</td>
                            <td class="pd_price">22/03/19</td>
                            <td class="pd_score">4.0</td>
                            <td class="pd_like">1</td>
                            <td class="pd_cnt">5</td>
                        </tr>
                        <tr>
                            <td class="seq cal_01">3</td>
                            <td class="pd_name">라이프 사진전</td>
                            <td class="pd_price">22/03/19</td>
                            <td class="pd_score">4.0</td>
                            <td class="pd_like">1</td>
                            <td class="pd_cnt">5</td>
                        </tr>
                        <tr>
                            <td class="seq cal_01">4</td>
                            <td class="pd_name">어둠속의 대화</td>
                            <td class="pd_price">22/03/19</td>
                            <td class="pd_score">4.0</td>
                            <td class="pd_like">1</td>
                            <td class="pd_cnt">5</td>
                        </tr>
                        <tr>
                            <td class="seq cal_01">5</td>
                            <td class="pd_name">박물관이 살아있다</td>
                            <td class="pd_price">22/03/19</td>
                            <td class="pd_score">4.0</td>
                            <td class="pd_like">1</td>
                            <td class="pd_cnt">5</td>
                        </tr>
                        <tr>
                            <td class="seq cal_01">6</td>
                            <td class="pd_name">허브 아일랜드</td>
                            <td class="pd_price">22/03/19</td>
                            <td class="pd_score">4.0</td>
                            <td class="pd_like">1</td>
                            <td class="pd_cnt">5</td>
                        </tr>
                    </tbody>


            </table>

            </div> <%-- scroll_section --%>


            </div> <%-- fix_relative--%>


                    <div class="label_section">
                        <p class="label_text">최근 30일 이내 관람한 작품</p>
                    </div>

                    <p class="sectionLine_thin"></p>

                    <%-- scroll --%>
                    <div class="scroll_section">


                        <%-- table --%>
                        <table class="table_list">

                            <thead>
                            <tr>
                                <th class="watched_pd_type">종류</th>
                                <th class="watched_pd_name">이름</th>
                                <th class="watched_pd_review_btn"></th>
                            </tr>
                            </thead>




                        <tbody>
                        <div class="view_pd_list">
                            <tr class="table_row_section">
                                <td class="watched_pd_type_value"><span>[</span><span class="type">전시</span><span>]</span></td>
                                <td class="pd_name_watched">사울레이터</td>
                                <td><button class="write_review_btn"><a href="#리뷰쓰기페이지">리뷰쓰기</a></button></td>
                            </tr>
                        </div>

                       <div class="view_pd_list">
                            <tr>
                                <td class="watched_pd_type_value"><span>[</span><span class="type">뮤지엄</span><span>]</span></td>
                                <td class="pd_name_watched">허브아일랜드</td>
                                <td><button class="write_review_btn"><a href="#리뷰쓰기페이지">리뷰쓰기</a></button></td>
                            </tr>
                       </div>

                        <div class="view_pd_list">
                            <tr>
                                <td class="watched_pd_type_value"><span>[</span><span class="type">전시</span><span>]</span></td>
                                <td class="pd_name_watched">라이프 사진전</td>
                                <td><button class="write_review_btn"><a href="#리뷰쓰기페이지">리뷰쓰기</a></button></td>
                            </tr>
                        </div>

                        <div class="view_pd_list">
                            <tr>
                                <td class="watched_pd_type_value"><span>[</span><span class="type">뮤지엄</span><span>]</span></td>
                                <td class="pd_name_watched">박물관이 살아있다</td>
                                <td><button class="write_review_btn"><a href="#리뷰쓰기페이지">리뷰쓰기</a></button></td>
                            </tr>
                        </div>

                        <div class="view_pd_list">
                            <tr>
                                <td class="watched_pd_type_value"><span>[</span><span class="type">전시</span><span>]</span></td>
                                <td class="pd_name_watched">스누피</td>
                                <td><button class="write_review_btn"><a href="#리뷰쓰기페이지">리뷰쓰기</a></button></td>
                            </tr>
                        </div>
                        </tbody>



                        </table> <%--table--%>


                    </div> <%-- scroll --%>


                    <%--전시가 없을때--%> <%--if문으로 적용 class이름 같게함--%>
                    <div class="table_section_label">
                        <p>  관람한 작품이 없습니다. </p>
                    </div>

                <p class="sectionLine_thin"></p>

            </div> <%-- /content_container --%>

        </div> <%-- /innerContent --%>
    </div> <%-- /centerContainer --%>

        <div class="footer_container">
            <%@ include file="/WEB-INF/user/main_footer.jsp"%>
        </div>
</div> <%-- /mainContainer --%>
</body>

<%-- script --%>
<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%--<script src="/resources/user/js/myPage_likeList.js"></script>--%>



</html>
