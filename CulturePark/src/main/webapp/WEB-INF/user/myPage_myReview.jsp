
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
    <style><%@include file="/resources/common/css/header.css"%></style>
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
            <div class="content_container"><div style="clear:both;"></div>

                <div class="myReview_section">

                <div class="label_section">마이리뷰</div>

                <p class="sectionLine_thin"></p>




                    <table class="table">
                        <thead>
                        <tr>
                            <th class="pd_seq">seq</th>
                            <th class="pd_name">작품명</th>
                            <th class="pd_date">관람날짜</th>
                            <th class="pd_score">별점</th>
                            <th class="pd_like">좋아요</th>
                            <th class="pd_cnt">조회수</th>
                        </tr>
                        </thead>

                <div class="scroll_section">

                    <tbody>
                        <tr class="table_row_section">
                            <td class="seq">1</td>
                            <td class="pd_name">사울레이터</td>
                            <td class="pd_price">22/05/19</td>
                            <th class="pd_score">4.5</th>
                            <th class="pd_like">5</th>
                            <th class="pd_cnt">20</th>
                        </tr>
                        <tr>
                            <td class="seq">2</td>
                            <td class="pd_name">요시고</td>
                            <td class="pd_price">22/03/19</td>
                            <th class="pd_score">4.0</th>
                            <th class="pd_like">1</th>
                            <th class="pd_cnt">5</th>
                        </tr>
                    </tbody>
                </div> <%-- scroll_section --%>

                    </table>

            </div> <%-- myReview_section --%>

                <%-- ========  탭메뉴 ======== --%>
                <div class="tab_content">

                    <div class="label_section">
                        <p class="label_text">최근 30일 이내 관람한 작품</p>
                    </div>

                    <p class="sectionLine"></p>

                    <%-- 스크롤 시작 --%>
                    <div class="scroll_section">

                    <div class="table_section" id="exhibit_set">

                        <table class="table">

                        <div class="view_pd_list">
                            <tr class="table_row_section">
                                <span>[</span><td class="type">전시</td><span>]</span>
                                <td class="pd_name">사울레이터</td>
                                <button class="write_Review">리뷰쓰기</button>
                            </tr>
                        </div>

                       <div class="view_pd_list">
                            <tr>
                                <span>[</span><td class="type">뮤지엄</td><span>]</span>
                                <td class="pd_name">허브아일랜드</td>
                                <button class="write_Review">리뷰쓰기</button>
                            </tr>
                       </div>

                        </table>

                    </div>

                    </div> <%-- 스크롤 끝 --%>


                    <%--전시가 없을때--%> <%--if문으로 적용 class이름 같게함--%>
                    <div class="table_section">
                        <p>  관람한 작품이 없습니다. </p>
                    </div>

                </div> <%-- scroll_section --%>

                </div> <!-- ===========  /탭 메뉴 ============== -->

            </div> <%-- /content_container --%>

        </div> <%-- /innerContent --%>
    </div> <%-- /centerContainer --%>
</div> <%-- /mainContainer --%>
</body>

<%-- script --%>
<script src="https://kit.fontawesome.com/2f0c3a79f6.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<%--<script src="/resources/user/js/myPage_likeList.js"></script>--%>



</html>
